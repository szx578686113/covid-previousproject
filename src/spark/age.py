# -*- coding: utf-8 -*-#
from MysqlConfig import *
from pyspark import Row
from pyspark.sql import SparkSession
from pyspark.sql.functions import udf
from pyspark.sql.types import *
import os

# SparkSession 用来操作SparkSQL DataFrame，读取结构化数据
spark=SparkSession\
    .builder\
    .appName("Python Spark SQL basic example")\
    .config("spark.some.config.option","some-value")\
    .getOrCreate()

df = spark.read.format("csv").load("../../data/9bhg-hcku.csv",header=True, inferSchema="true")

def age_process(value):
    if value =='Under 1 year' :
        return '0-4'
    elif value == '1-4 years' :
        return '0-4'
    elif value=='5-14 years' :
        return '5-14'
    elif value=='15-24 years' :
        return '15-24'
    elif value=='25-34 years' :
        return '25-34'
    elif value=='35-44 years' :
        return '35-44'
    elif value=='45-54 years':
        return '45-54'
    elif value=='55-64 years':
        return '55-64'
    elif value=='65-74 years' :
        return '65-74'
    elif value=='75-84 years':
        return '75-84'
    elif value=='85 years and over':
        return '85+'
    else :
        return 'none'

def idd(value):
    if value =='0-4' :
        return 1
    elif value=='5-14' :
        return 2
    elif value=='15-24' :
        return 3
    elif value=='25-34' :
        return 4
    elif value=='35-44' :
        return 5
    elif value=='45-54':
        return 6
    elif value=='55-64':
        return 7
    elif value=='65-74' :
        return 8
    elif value=='75-84':
        return 9
    elif value=='85+':
        return 10
    else :
        return 0

udf_age_process = udf(age_process, StringType())
udf_id = udf(idd, IntegerType())
tmp1_df=df.withColumn("age_groups",udf_age_process("age_group"))
tmp_df=tmp1_df.withColumn("id_num",udf_id("age_groups"))
#tmp_df.show()
tmp_df.createGlobalTempView("city")
age_df=spark.sql("select age_groups,sum(`covid_19_deaths`) deaths,id_num from global_temp.city where State like 'United%' and "
                 "age_groups!='none' group by id_num,age_groups")
#age_df.show()

conn_param={}
conn_param["user"]=Mysql_User
conn_param["password"]=Mysql_Pwd
conn_param["driver"]=Mysql_Driver

age_df.write.jdbc(Mysql_Conn,"age","overwrite",conn_param)
print("执行结束")