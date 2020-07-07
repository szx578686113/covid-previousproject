import pymysql
from src.timestamp import getTimestamp
from src.timestamp import setTimestamp

timestampPath = "../../timestamp.txt"

tablename = ["total_cases","total_deaths","new_cases","new_deaths"]
conn = pymysql.connect('localhost', user="root", passwd="", db="covid")
cursor = conn.cursor()

def dateFormat(id):
    cursor.execute(" alter table " + tablename[id] + " modify date varchar(30) ")
    print(cursor.execute(" update " + tablename[id] + " set date = replace(date, '2020-','')"))
    print(cursor.execute(" update " + tablename[id] + " set date = replace(date, '-','/')"))
    print(cursor.execute(" update " + tablename[id] + " set date = replace(date, ' 16:00:00','')"))

for i in range(4):
    dateFormat(i)

cursor.execute("create or replace view datedata\
                as select total_cases.date, total_cases, new_cases, total_deaths, new_deaths, total_recovery\
                from total_cases, new_cases, total_deaths, new_deaths, total_recovery\
                where total_cases.date=total_deaths.date and total_cases.date=new_cases.date and\
                total_cases.date=new_deaths.date and total_cases.date=total_recovery.date")