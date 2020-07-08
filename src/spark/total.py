# -*- coding: utf-8 -*-#
from MysqlConfig import *
from pyspark import Row
from pyspark.sql import SparkSession
import os

spark=SparkSession\
    .builder\
    .appName("Python Spark SQL basic example")\
    .config("spark.some.config.option","some-value")\
    .getOrCreate()

sc=spark.sparkContext

filePath=r"../../data/owid-covid-data.csv"
textFile=sc.textFile(filePath)


def to_pair(item):
    tmp_list=item.split(",")
    if tmp_list[2]=='location':
        return "\"Afghanistan\"",0
    country="\"{}\"".format(tmp_list[2])
    if tmp_list[5]!='':
        new_cases_per_million=float(tmp_list[5])
    else : new_cases_per_million=0
    return country,new_cases_per_million


rdd=textFile.map(lambda x:to_pair(x)).reduceByKey(lambda x,y:x+y)
rowRdd=rdd.map(lambda x:Row(country=x[0],total=round(x[1],2)))
dataFrame=spark.createDataFrame(rowRdd)
dataFrame.createGlobalTempView("city")
new_df=spark.sql("SELECT * FROM global_temp.city limit 5")

conn_param={}
conn_param["user"]=Mysql_User
conn_param["password"]=Mysql_Pwd
conn_param["driver"]=Mysql_Driver

dataFrame.write.jdbc(Mysql_Conn,"Total","overwrite",conn_param)
print("执行结束")
