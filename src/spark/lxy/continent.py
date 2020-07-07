# -*- coding: utf-8 -*-#
from config import *
from pyspark import Row
from pyspark.sql import SparkSession
import os

# SparkSession 用来操作SparkSQL DataFrame，读取结构化数据
spark=SparkSession\
    .builder\
    .appName("Python Spark SQL basic example")\
    .config("spark.some.config.option","some-value")\
    .getOrCreate()

df = spark.read.format("csv").option("header",True).load(r"../../../data/owid-covid-data.csv")
df.createGlobalTempView("city")

new_df=spark.sql("select continent,sum(new_cases) total_cases from global_temp.city where continent is not null group by continent")
#new_df.show()

conn_param={}
conn_param["user"]=Mysql_User
conn_param["password"]=Mysql_Pwd
conn_param["driver"]=Mysql_Driver

new_df.write.jdbc(Mysql_Conn,"continent","overwrite",conn_param)
print("执行结束")