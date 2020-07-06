import datetime
nowTime = datetime.datetime.now()

def getTimestamp(filepath):
    try:
        fp = open(filepath, "r")
        content = fp.read()
        fp.close()
        if content == '':
            setTimestamp(filepath, 0)
            return 0
        content = content.split(' ')
        return int(content[0])

    except IOError:
        fp = open(filepath, "w")
        fp.write("0 {}".format(nowTime))
        fp.close()
        return 0

def setTimestamp(filepath, x):
    fp = open(filepath, "w")
    fp.write("{} {}".format(x,nowTime))
    fp.close()