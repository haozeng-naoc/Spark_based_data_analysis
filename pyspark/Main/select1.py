# 利用pandas进行数据分析 提交到pyspark集群中
# @Author：LU80
# !/usr/bin/env python
# coding: utf-8
import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv("../Data/input/games_clean.csv", encoding='ISO-8859-1')
engine = create_engine('mysql+pymysql://root:123456@localhost:3306/bigdata')

# Task-1统计各语言的支持数
language_count = {}
for language in df['Supported languages'].to_list():
    language = language.strip()
    language_sub = language.split(',')
    for key in language_sub:
        key = key.strip()
        key = key.replace("'", "")
        key = key.replace("[", "")
        key = key.replace("]", "")
        language_count[key] = language_count.get(key, 0) + 1

language_count = pd.DataFrame.from_dict(language_count, orient='index').reset_index()

language_count.columns = ['language', 'Frequency']
language_count = language_count.sort_values('Frequency', ascending=False).head(10)

print(language_count)
# 输出结果到Mysql
# language_count.to_sql('language_count', engine, index=False)
print("Task-1 finished")

# Task-2统计游戏类别的top10
def categories_clean(x):
    x = x.split(",")
    return x


# 测试清洗函数
print(categories_clean('Single-player,Multi-player,Steam Achievements,Partial Controller Support'))

# 拆分Categories列 统计类别数
categories_count = {}
for categories in df['Categories']:
    words = categories_clean(categories)
    for word in words:
        categories_count[word] = categories_count.get(word, 0) + 1

print(categories_count)

categories_count = pd.DataFrame.from_dict(categories_count, orient='index').reset_index()

categories_count.columns = ['category', 'Frequency']
categories_count = categories_count.sort_values('Frequency', ascending=False)

print(categories_count.head(10))

# categories_count.head(10).to_sql('categories_count', engine, index=False)
print("Task-2 finished")

# Task-3.制作游戏最多的年份（辅助列'year'）
df['Release date cleaned'] = pd.to_datetime(df['Release date'], errors='coerce')
df['year'] = df['Release date cleaned'].dt.year
years = df.groupby("year").agg({
    "Name": "count"
}).reset_index()
print(years.sort_values("Name", ascending=False))
# years.sort_values("Name",ascending = False).to_sql('years', engine, index=False)
print("Task-3 finished")

# Task-4.下载次数最多的游戏及其价格（新加列 'owners clean'）
# 取Estimated owners的中位数作为ownerrs_clean
def owners_clean(x):
    x = x.strip()
    x = x.split("-")
    x = [num.strip(' ') for num in x]
    num1 = int(x[0])
    num2 = int(x[1])
    med = (num2 - num1) / 2
    return med


# print(owners_clean("0 - 20000"))

for index, row in df.iterrows():
    df.at[index, 'owners clean'] = owners_clean(df.at[index, 'Estimated owners'])

most_downloaded_games_price = df.groupby(["Name", "Price"]).agg({
    "owners clean": "sum"
}).reset_index().sort_values("owners clean", ascending=False).head(10)
print(most_downloaded_games_price)
# most_downloaded_games_price.to_sql('most_downloaded_games_price', engine, index=False)
print("Task-4 finished")

# Task-5.游戏发行商top10(辅助列 'owners clean')
top_publishers_total_downloads = df.groupby("Publishers").agg({
    "owners clean": "sum"
}).reset_index().sort_values("owners clean", ascending=False).head(10)
print(top_publishers_total_downloads)
# top_publishers_total_downloads.to_sql('top_publishers_total_downloads', engine, index=False)
print("Task-5 finished")
