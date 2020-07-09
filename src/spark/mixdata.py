# -*- coding: utf-8 -*-#
from MysqlConfig import *
from pyspark.sql import SparkSession
from pyspark.sql.functions import udf
from pyspark.sql.types import *

spark=SparkSession\
    .builder\
    .appName("Python Spark SQL basic example")\
    .config("spark.some.config.option","some-value")\
    .getOrCreate()

df = spark.read.format("csv").load("../../data/9bhg-hcku.csv",header=True, inferSchema="true")
df.createGlobalTempView("city")
df2 = spark.read.format("csv").option("header",True).load(r"../../data/owid-covid-data.csv")
df2.createGlobalTempView("owid")

agegroup={}
agegroup['Under 1 year']='0-4'
agegroup['1-4 years']='0-4'
agegroup['5-14 years']='5-14'
agegroup['15-24 years']='15-24'
agegroup['25-34 years']='25-34'
agegroup['35-44 years']='35-44'
agegroup['45-54 years']='45-54'
agegroup['55-64 years']='55-64'
agegroup['65-74 years']='65-74'
agegroup['75-84 years']='75-84'
agegroup['85 years and over']='85+'

ageid={}
ageid['0-4']=1
ageid['5-14']=2
ageid['15-24']=3
ageid['25-34']=4
ageid['35-44']=5
ageid['45-54']=6
ageid['55-64']=7
ageid['65-74']=8
ageid['75-84']=9
ageid['85+']=10

def age_process (value):
    if value in agegroup:
        return agegroup[value]
    else :
        return 'none'

def idd(value):
    if value in ageid:
        return ageid[value]
    else :
        return 0

udf_age_process = udf(age_process, StringType())
udf_id = udf(idd, IntegerType())
tmp1_df=df.withColumn("age_groups",udf_age_process("`age_group`"))
tmp_df=tmp1_df.withColumn("id_num",udf_id("age_groups"))

tmp_df.createGlobalTempView("age")
age_df=spark.sql("select age_groups,sum(`covid_19_deaths`) deaths,id_num from global_temp.age where State like 'United%' and "
                 "age_groups!='none' group by id_num,age_groups")
sex_df=spark.sql("select Sex,`covid_19_deaths` from global_temp.city where state like 'United%' and `age_group` like 'All%'"
                 "and Sex like '%ale%'")
new_df=spark.sql("select continent,sum(new_cases) total_cases from global_temp.owid where continent is not null group by continent")
million_df=spark.sql("select location country,sum(new_cases_per_million) total_per_million from global_temp.owid where location is not null "
                 "group by location order by total_per_million desc limit 10")

conn_param={}
conn_param["user"]=Mysql_User
conn_param["password"]=Mysql_Pwd
conn_param["driver"]=Mysql_Driver

sex_df.write.jdbc(Mysql_Conn,"sex","overwrite",conn_param)
age_df.write.jdbc(Mysql_Conn,"age","overwrite",conn_param)
new_df.write.jdbc(Mysql_Conn,"continent","overwrite",conn_param)
million_df.write.jdbc(Mysql_Conn,"TotalPerMillion","overwrite",conn_param)
print("执行结束")
