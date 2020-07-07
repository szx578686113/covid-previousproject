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

df = spark.read.format("csv").load("../../data/9bhg-hcku.csv",header=True, inferSchema="true")
df.createGlobalTempView("city")

sex_df=spark.sql("select Sex,`covid_19_deaths` from global_temp.city where state like 'United%' and `age_group` like 'All%'"
                 "and Sex like '%ale%'")

conn_param={}
conn_param["user"]=Mysql_User
conn_param["password"]=Mysql_Pwd
conn_param["driver"]=Mysql_Driver

sex_df.write.jdbc(Mysql_Conn,"sex","overwrite",conn_param)
print("执行结束")
