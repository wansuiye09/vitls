#!/usr/bin/python
# -*- coding: UTF-8 -*-

import MySQLdb

#用户注册 @handler()  
#def insertUser():
    # 打开数据库连接
db = MySQLdb.connect("localhost","root"," ","IRVADB" )

    # 使用cursor()方法获取操作游标 
cursor = db.cursor()

    # SQL 插入语句
sql = """INSERT INTO CITIS_users(id, username, password, type, address, email, gender,numaccount,phonenum,workexper,\
educationback,userlevel,numuploaded,numsubmitted,numacceptances, numacceptances,numrejections,blocked,donatedamount,\
bonusamount,verified)
            VALUES (5, 'zq', '2333','标注员','软件所','zhuqiancg@163.com','女','','','','','','',0,0,0,0,0,0,1,0)"""
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
