#利用sql进行数据分析 提交到pyspark集群中
# coding:utf8
#@Author：LU80
from pyhive import hive
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://root:123456@localhost:3306/bigdata')

if __name__ == '__main__':
    # 获取到Hive(Spark ThriftServer的链接)
    conn = hive.Connection(host="node1", port=10000, username="root", database='pyspark')
    cursor = conn.cursor()

    #Task-1 下载次数最多的游戏的好评和差评top10
    cursor.execute("select name, Positive ,Negative from games order by owners_clean DESC limit (10);")
    # 通过fetchall API 获得返回值
    result = cursor.fetchall()
    #list类型的result转为df类型
    df = pd.DataFrame(result)
    df.columns=['name', 'positive count', 'negative count']
    print(df)
    # 写出df到mysql数据库中
    #df.to_sql('Pos_neg', engine, index=False)
    print("Task—1 finished")

    # Task-2 好评率（好评数/评价总数）限制评价总数1000以上的游戏
    cursor.execute("SELECT name, rate from(select name, Positive/(Negative+Positive) as rate "
                   "from games WHERE owners_clean > 100000)order by rate desc limit(10);")
    result = cursor.fetchall()
    df = pd.DataFrame(result)
    df.columns = ['name', 'rate']
    print(df)
    #df.to_sql('rate_rank', engine, index=False)
    print("Task—2 finished")

    #Task-3  Mac、Win、Linux中平均游戏价格
    cursor.execute("select Win_price, Mac_price, Linux_price from "
                   "(SELECT avg(price) as Win_price FROM games where Windows = \"True\") as windows_table,"
                   "(SELECT avg(price) as Mac_price FROM games where Mac = \"True\") as mac_table, "
                   "(SELECT avg(price) as Linux_price FROM games where Linux = \"True\") as linux_table;")
    result = cursor.fetchall()
    df = pd.DataFrame(result)
    df.columns = ['Win_price', 'Mac_price', 'Linux_price']
    print(df)
    #df.to_sql('Average_price', engine, index=False)
    print("Task—3 finished")

    #Task-4  DLC数top5的开发者
    cursor.execute("SELECT Developers, sum_DLC_count from("
                   "select Developers, sum(DLC_count) as sum_DLC_count FROM games group by Developers)"
                   "ORDER BY sum_DLC_count desc limit(10);")
    result = cursor.fetchall()
    df = pd.DataFrame(result)
    df.columns = ['Developers', 'sum_DLC_count']
    print(df)
    #df.to_sql('top_dlc_developers', engine, index=False)
    print("Task—4 finished")

    #Task-5  有支持服务的游戏和无支持服务的游戏平均下载量
    cursor.execute("select have_support_time, no_support_time from"
                   "(SELECT AVG(owners_clean) as have_support_time from games where Support_email is not NULL) as have_support_table, "
                   "(SELECT AVG(owners_clean) as no_support_time from games where Support_email=\"no Support email available\") as no_support_table;")
    result = cursor.fetchall()
    df = pd.DataFrame(result)
    df.columns = ['have_support_time', 'no_support_time']
    print(df)
    #df.to_sql('support', engine, index=False)
    print("Task—5 finished")

