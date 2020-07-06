import datetime
nowTime = datetime.datetime.now()
filepath = "../timestamp.txt"
def getTimestamp():
    try:
        fp = open(filepath, "r")
        content = fp.read()
        content = content.split(' ')
        if fp == '':
            fp.close()
            setTimestamp(0)
            return 0
        fp.close()
        return int(content[0])

    except IOError:
        fp = open(filepath, "w")
        fp.write("0 {}".format(nowTime))
        return 0
        fp.close()

def setTimestamp(x):
    fp = open(filepath, "w")
    fp.write("{} {}".format(x,nowTime))
    fp.close()