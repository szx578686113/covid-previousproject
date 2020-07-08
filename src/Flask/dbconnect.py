import pymysql

#return: 连接，游标
def get_conn():

    # 创建连接
    conn = pymysql.connect(host="127.0.0.1",
                           user="root",
                           password="",
                           db="covid",
                           charset="utf8mb4")
    # 创建游标
    cursor = conn.cursor()# 执行完毕返回的结果集默认以元组显示
    return conn, cursor


def close_conn(conn, cursor):
    cursor.close()
    conn.close()

def query(sql,*args):
    """
    封装通用查询
    :param sql:
    :param args:
    :return: 返回查询到的结果，((),(),)的形式
    """
    conn, cursor = get_conn()
    cursor.execute(sql,args)
    res = cursor.fetchall()
    close_conn(conn, cursor)
    return res

def get_map():
    sql = "SELECT t.* FROM covid.total t WHERE total IS NOT NULL" \
          " ORDER BY country"
    res = query(sql)
    ori_data = list(res)
    modified_data = []

    for row in ori_data:
        row = list(row)
        if row[0] == '\"Congo\"':
            row[0] = "{v: \'CG\', f: \'Congo\'}"
            a = row
            modified_data.append(a)
        elif row[0] == '\"Democratic Republic of Congo\"':
            row[0] = "{v: \'CD\', f: \'Democratic Republic of Congo\'}"
            a = row
            modified_data.append(a)
        elif row[0] == '\"Cote d\'Ivoire\"':
            row[0] = "{v: \'CI\', f: \'Côte d\\'Ivoire\'}"
            a = row
            modified_data.append(a)
        elif row[0] == '\"South Sudan\"':
            row[0] = "{v: \'SS\', f: \'South Sudan\'}"
            a = row
            modified_data.append(a)
        elif row[0] == '\"Taiwan\"':
            row[0] = "{v: \'Taiwan\', f: \'Taiwan (China)\'}"
            a = row
            modified_data.append(a)
        else:
            a = row
            modified_data.append(a)

    return modified_data

def get_top10():
    sql = "SELECT t.* FROM covid.totalpermillion t " \
          "ORDER BY total_per_million DESC"
    res = query(sql)
    return res

def get_gender():
    sql = "SELECT t.* FROM covid.sex t"
    res = query(sql)
    return res

def get_trend(column_name):
    sql = "SELECT date,%s FROM covid.datedata t" %(column_name)
    res = query(sql)
    return res

def get_continent():
    sql = "SELECT t.* FROM covid.continent t"
    res = query(sql)
    return res

def get_total():
    sql = "SELECT date, total_cases, total_deaths FROM covid.datedata t"
    res = query(sql)
    return res

def get_age():
    sql = "SELECT t.* FROM covid.age t " \
          "ORDER BY id_num DESC"
    res = query(sql)
    return res
