#coding=utf-8
import os.path, sys
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

import config
from CITIS.server import handler, application
from CITIS.database import session
import cStringIO
from models import *

import logging
logger = logging.getLogger("vatic.server")

#注册导入
import MySQLdb
#执行extract命令行
import stat
@handler()
def submitextract(videopath,outputpath):
    videopath=videopath.replace('<[<]','/')
    outputpath=outputpath.replace('<[<]','/')
    print('CITIS extract '+videopath+' '+outputpath)
    #先进入vatic所在目录
    os.system('cd /home/iscas-dsilab/vitls/vatic && CITIS extract '+videopath+' '+outputpath)

@handler()
def generateannotatorlist():
    os.system('cd /home/iscas-dsilab/vitls/vatic && python annotator_generate_list.py')


@handler()
def getjob(id, verified):
    job = session.query(Job).get(id)

    logger.debug("Found job {0}".format(job.id))

    if int(verified) and job.segment.video.trainwith:
        # swap segment with the training segment
        training = True
        segment = job.segment.video.trainwith.segments[0]
        logger.debug("Swapping actual segment with training segment")
    else:
        training = False
        segment = job.segment

    video = segment.video
    labels = dict((l.id, l.text) for l in video.labels)

    attributes = {}
    for label in video.labels:
        attributes[label.id] = dict((a.id, a.text) for a in label.attributes)

    logger.debug("Giving user frames {0} to {1} of {2}".format(video.slug,
                                                               segment.start,
                                                               segment.stop))

    return {"start":        segment.start,
            "stop":         segment.stop,
            "slug":         video.slug,
            "width":        video.width,
            "height":       video.height,
            "skip":         video.skip,
            "perobject":    video.perobjectbonus,
            "completion":   video.completionbonus,
            "blowradius":   video.blowradius,
            "jobid":        job.id,
            "training":     int(training),
            "labels":       labels,
            "attributes":   attributes}

@handler()
def getboxesforjob(id):
    job = session.query(Job).get(id)
    result = []
    for path in job.paths:
        attrs = [(x.attributeid, x.frame, x.value) for x in path.attributes]
        result.append({"label": path.labelid,
                       "boxes": [tuple(x) for x in path.getboxes()],
                       "attributes": attrs})
    return result

def readpaths(tracks):
    paths = []
    logger.debug("Reading {0} total tracks".format(len(tracks)))

    for label, track, attributes in tracks:
        path = Path()
        path.label = session.query(Label).get(label)
        
        logger.debug("Received a {0} track".format(path.label.text))

        visible = False
        for frame, userbox in track.items():
            box = Box(path = path)
            box.xtl = max(int(userbox[0]), 0)
            box.ytl = max(int(userbox[1]), 0)
            box.xbr = max(int(userbox[2]), 0)
            box.ybr = max(int(userbox[3]), 0)
            box.occluded = int(userbox[4])
            box.outside = int(userbox[5])
            box.frame = int(frame)
            if not box.outside:
                visible = True

            logger.debug("Received box {0}".format(str(box.getbox())))

        if not visible:
            logger.warning("Received empty path! Skipping")
            continue

        for attributeid, timeline in attributes.items():
            attribute = session.query(Attribute).get(attributeid)
            for frame, value in timeline.items():
                aa = AttributeAnnotation()
                aa.attribute = attribute
                aa.frame = frame
                aa.value = value
                path.attributes.append(aa)

        paths.append(path)
    return paths

@handler(post = "json")
def savejob(id, tracks):
    job = session.query(Job).get(id)

    for path in job.paths:
        session.delete(path)
    session.commit()
    for path in readpaths(tracks):
        job.paths.append(path)

    session.add(job)
    session.commit()

@handler(post = "json")
def validatejob(id, tracks):
    job = session.query(Job).get(id)
    paths = readpaths(tracks)

    return job.trainingjob.validator(paths, job.trainingjob.paths)

@handler()
def respawnjob(id):
    job = session.query(Job).get(id)

    replacement = job.markastraining()
    job.worker.verified = True
    session.add(job)
    session.add(replacement)
    session.commit()

    replacement.publish()
    session.add(replacement)
    session.commit()

@handler()
def getuserid(uname, pwd):
    user = session.query(Worker)
    user = user.filter(Worker.username == uname)
    user = user.filter(Worker.password == pwd)
    #user = user.filter(Worker.type == 2)
    if user.count() == 1:
        return user.one().id
    else:
        return -1

@handler()#zqtest
def insertUser(uname, pwd,email,type,address):
    db = MySQLdb.connect("localhost","root"," ","IRVADB" )

    # 使用cursor()方法获取操作游标 
    cursor = db.cursor()

    # SQL 插入语句
    sql = """INSERT INTO CITIS_users(id, username, password, type, address, email, gender,numaccount,phonenum,workexper,\
    educationback,userlevel,numuploaded,numsubmitted,numacceptances, numacceptances,numrejections,blocked,donatedamount,\
    bonusamount,verified) VALUES (5, uname, pwd,type,address,email,'女','','','','','','',0,0,0,0,0,0,1,0)"""
    #插入的另一种写法
    #sql = "INSERT INTO EMPLOYEE(FIRST_NAME, \
    #      LAST_NAME, AGE, SEX, INCOME) \
    #    VALUES ('%s', '%s', '%d', '%c', '%d' )" % \
    #   ('Mac', 'Mohan', 20, 'M', 2000)

    try:
         # 执行sql语句
        cursor.execute(sql)
        # 提交到数据库执行
        db.commit()
    except:
        # Rollback in case there is any error
         db.rollback()

    # 关闭数据库连接
    db.close()

