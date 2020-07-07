# -*- coding: utf-8 -*-#


from MysqlConfig import *
from pyspark import Row
from pyspark.sql import SparkSession
import os

spark = SparkSession \
    .builder \
    .appName("Python Spark SQL basic example") \
    .config("spark.some.config.option", "some-value") \
    .getOrCreate()

tablename = ["total_cases","total_deaths","new_cases","new_deaths"]

filepath = [r"../../data/total_cases.csv",
            r"../../data/total_deaths.csv",
            r"../../data/new_cases.csv",
            r"../../data/new_deaths.csv"]

conn_param = {}
conn_param["user"] = Mysql_User
conn_param["password"] = Mysql_Pwd
conn_param["driver"] = Mysql_Driver



def dateProcess(id):
    df = spark.read.format("csv").load(filepath[id], header=True, inferSchema="true")
    df.registerTempTable("info")
    df = spark.sql("select date, world as " + tablename[id] + " from info where date > '2020-01-17 00:00:00' ")
    df.show()
    df.write.jdbc(Mysql_Conn, tablename[id], "overwrite", conn_param)

for i in range(4):
    dateProcess(i)


'''
create view datedata as select date_cases.date, cases, deaths from date_cases, date_deaths where date_cases=date_deaths;
UPDATE 表名 SET 字段名=replace(字段名, ‘被替换字符串’, '用来替换的字符串') ;
'''