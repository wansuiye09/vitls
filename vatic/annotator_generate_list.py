#coding=utf-8
from CITIS.database import session
from models import *

jobs = session.query(Job)
jobs = jobs.join(Segment).join(Video)
f = open('public/annotator_generate_list.html', 'w')

f.write('''
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"content="width = device-width, initial-scale = 1">
    <title>标注人员任务</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="jquery-3.2.0.min.js"></script>
    <script type="text/javascript" src="jquery-ui.min.js"></script>
    <script type="text/javascript" src="jquery.tmpl.min.js"></script>
    <script src="js\bootstrap.min.js"></script> 
    <style type="text/css">
      li{  list-style:none }
      li.demo_1{
          width:240px;
          padding:8px;
          margin:0px;
      }
      li.demo_2{
          width:160px;
          padding:5px;
          margin:0px;
      }
      div.checkbox{
          float: right;
      }
    </style>
</head>
<body>
   <!--nav bar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
      <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" >任务视频图像标记系统</a>
      </div>
  <div id="navbar">
    <ul class="nav navbar-nav">
        <li><a href="#"><span class="glyphicon glyphicon-file"></span> 可选任务</a></li>
        
    </ul>

    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户中心 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="user_info.html">用户信息</a></li>
                <li><a href="user_task.html">用户任务</a></li>
                <li><a href="index.html">注销用户</a></li>
              </ul>
        </li>
    </ul>
   </div>
   </div>
    </nav>

<div class="container">

''')


if jobs.count() > 0:
    x = 0
    i = 1
    for job in jobs:
        f.write('''
        <div class="panel panel-default">
        <div class="panel-heading"><h4><a href="#video''' + str(i) + '''Content" data-toggle="collapse">Video Task ''' + str(i) + "</a></h4></div>"
        '''<div class="panel-body collapse" id="video''' + str(i) + '''Content">
        ''')
        print job.offlineurl(config.localhost + "ann.html")
        f.write("<p><a href='")
        f.write(job.offlineurl(config.localhost + "ann.html"))
        f.write("'>")
        f.write('Click to choose the task')
        f.write("</a></p>\n")
        f.write('''
        <table class="table">
          <tr>
            <th>
              视频主题
            </th>
            <th>
              视频长度
            </th>
            <th>
              有效期限
            </th>
            <th>
              报酬
            </th>
          </tr>
          <tr>
            <td>
              车辆监控视频
            </td>
            <td>
              5mins
            </td>
            <td>
              2017-7-31
            </td>
            <td>
              ￥1/标注
            </td>
          </tr>
        </table>
        </div>
        </div>
        ''')
        i += 1
else:
    print "No jobs matching this criteria."
    f.write("<h1>Nothing!</h1>")

f.write('''
<nav aria-label="Page navigation" align="center">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
''')

f.write('''
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
''')

f.close()
