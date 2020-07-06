# -*- coding: utf-8 -*-#


from MysqlConfig import *
from pyspark import Row
from pyspark.sql import SparkSession
import csv
from functools import reduce

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

filepath = "../../../data/time_series_covid19_recovered_global.csv"
filename = "recovery.csv"

data = []
date = []

#读csv
with open(filepath, "r") as fp:
    reader = csv.reader(fp)
    for row in reader:
        del row[0 : 4]
        if len(row[0]) == 1:
            row = [int(x) for x in row]
        data.append(row)
    fp.close()

#添加前导0
def addZero(x):
    return "{0:0>2}".format(x[0]) + "/" +"{0:0>2}".format(x[1])

#取出日期，并且把前导0补上
date = data[0]
del data[0]
date = [x[:-3] for x in date]
#用'/'把月和日分开，便于添加前导0
date = [x.split('/') for x in date]
date = [addZero(x) for x in date]

def addList(x, y):
    return [int(x[i])+int(y[i]) for i in range(len(x))]

sumList = reduce(addList, data)

with open(filename, "w") as fp:
    writer = csv.writer(fp)
    writer.writerow(["date","total_recovery"])
    for i in range(len(sumList)):
        writer.writerow([date[i], sumList[i]])
    fp.close()

conn_param = {}
conn_param["user"] = Mysql_User
conn_param["password"] = Mysql_Pwd
conn_param["driver"] = Mysql_Driver

df = spark.read.format("csv").load(filename, header=True, inferSchema="true")
df.registerTempTable("info")
df = spark.sql("select date, total_recovery from info")
df.show()
df.write.jdbc(Mysql_Conn, "total_recovery", "overwrite", conn_param)