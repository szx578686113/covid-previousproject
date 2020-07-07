# -*- coding: utf-8 -*-#
from config import *
from pyspark import Row
from pyspark.sql import SparkSession
import os

spark=SparkSession\
    .builder\
    .appName("Python Spark SQL basic example")\
    .config("spark.some.config.option","some-value")\
    .getOrCreate()

df = spark.read.format("csv").option("header",True).load(r"../../../data/owid-covid-data.csv")
df.createGlobalTempView("city")

new_df=spark.sql("select location country,sum(new_cases_per_million) total_per_million from global_temp.city where location is not null "
                 "group by location order by total_per_million desc limit 10")

conn_param={}
conn_param["user"]=Mysql_User
conn_param["password"]=Mysql_Pwd
conn_param["driver"]=Mysql_Driver

new_df.write.jdbc(Mysql_Conn,"TotalPerMillion","overwrite",conn_param)
print("执行结束")