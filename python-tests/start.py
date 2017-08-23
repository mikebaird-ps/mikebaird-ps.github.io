print "Welcome to Python"

frog = 1 + 2

print frog

from datetime import datetime

now = datetime.now()

mm = str(now.month)

dd = str()

yyyy = str(now.year)

hour = str(now.hour)

mi = str(now.minute)

ss = str(now.second)

print mm + "/" + dd + "/" + yyyy + " " + hour + ":" + mi + ":" + ss

import datetime
d = datetime.date(year=2010, month=3, day=15)
t = datetime.time(hour=10, minute=11, second=50)
print datetime.datetime.combine(d, t)
