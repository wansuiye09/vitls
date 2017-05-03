from CITIS.database import session
from models import *

jobs = session.query(Job)
jobs = jobs.join(Segment).join(Video)
f = open('public/list.html', 'w')

f.write('''
<!DOCTYPE html5>
<html>
<head>

<title>list</title>

</head>
<body>

<div style="font-size:120%">

''')


if jobs.count() > 0:
    f.write("<h1>LIST</h1>")
    x = 0
    for job in jobs:
        if x != job.segment.videoid:
            x = job.segment.videoid
            print("\n" + str(x) + "\t" + job.segment.video.slug)
            f.write("<br/><h3>Video " + str(x) + " " + job.segment.video.slug + "<h3>") 
        print job.offlineurl(config.localhost + "ann.html")
        f.write("<a href='")
        f.write(job.offlineurl(config.localhost + "ann.html"))
        f.write("'>")
        f.write(job.offlineurl(config.localhost + "ann.html"))
        f.write("</a><br/>\n")
else:
    print "No jobs matching this criteria."
    f.write("<h1>Nothing!</h1>")

f.write('''
</div>

</body>
</html>
''')

f.close()
