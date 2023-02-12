#!/usr/bin/env python
# coding: utf-8
#@Author：LU80
import pandas as pd

df = pd.read_csv("../Data/input/games.csv", encoding='ISO-8859-1')
# 将Release date转为datetime类型
df['Release date cleaned'] = pd.to_datetime(df['Release date'], errors='coerce')

# 处理name列的空值
df = df.drop(df.loc[df['Name'].isna()].index)

#beta、Test等游戏的About the game列为  先定位到此列
#beta、Test等游戏的About the game列更改为“this game is xxx and still under testing
for index, row in df.iterrows():
    if (pd.isnull(row['About the game'])):
        if 'Beta' in row['Name']:
            df.at[index, 'About the game'] = 'this game is beta and still under testing'
        elif "Alpha" in row['Name']:
            df.at[index, 'About the game'] = 'this game is Alpha and still under testing'
        elif "beta" in row['Name']:
            df.at[index, 'About the game'] = 'this game is beta and still under testing'
        elif "BETA" in row['Name']:
            df.at[index, 'About the game'] = 'this game is beta and still under testing'
        elif "Test" in row['Name']:
            df.at[index, 'About the game'] = 'this game is and still under testing'
        elif "playtest" in row['Name']:
            df.at[index, 'About the game'] = 'this game is still under testing'
        elif "Demo" in row['Name']:
            df.at[index, 'About the game'] = 'this game is Demo and still under testing'

#处理Reviews列
df = df.drop('Reviews', axis=1)

#将三个系统列产生一个新列
for index, row in df.iterrows():
    if row["Windows"] == True:
        df.at[index, 'OS'] = "Windows"
        if row["Mac"] == True:
            df.at[index, 'OS'] = "Windows, Mac"
            if row["Linux"] == True:
                df.at[index, 'OS'] = "Windows, Mac, Linux"
        elif row["Linux"] == True:
            df.at[index, 'OS'] = "Windows, Linux"
    elif row["Windows"] == False and row["Mac"] == True:
        df.at[index, 'OS'] = "Mac"
        if row["Linux"] == True:
            df.at[index, 'OS'] = "Windows, Linux"
    elif row["Windows"] == False and row["Mac"] == False and row["Linux"] == True:
        df.at[index, 'OS'] = "Linux"

#将有publisher但没有developer的游戏 publisher作为developer
for index, row in df.iterrows():
    if (pd.isnull(row['Publishers'])):
        if (pd.isnull(row['Developers'])):
            continue
        else:
            df.at[index, 'Publishers'] = df.at[index, 'Developers']

#将有developer但没有publisher的游戏 developer作为publisher
for index, row in df.iterrows():
    if (pd.isnull(row['Developers'])):
        if (pd.isnull(row['Publishers'])):
            continue
        else:
            df.at[index, 'Developers'] = df.at[index, 'Publishers']

#beta、Test等游戏的Developers列更改为“this game is xxx and still under testing the developer is not mentioned“
for index, row in df.iterrows():
    if (pd.isnull(row['Developers'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Developers'] = 'this game is Playtest and still under testing the developer is not mentioned'
        elif "Alpha" in row['Name']:
            df.at[index, 'Developers'] = 'this game is Alpha and still under testing the developer is not mentioned'
        elif "beta" in row['Name']:
            df.at[index, 'Developers'] = 'this game is beta and still under testing the developer is not mentioned'
        elif "BETA" in row['Name']:
            df.at[index, 'Developers'] = 'this game is beta and still under testing the developer is not mentioned'
        elif "Test" in row['Name']:
            df.at[index, 'Developers'] = 'this game is and still under testing the developer is not mentioned'
        elif "playtest" in row['Name']:
            df.at[index, 'Developers'] = 'this game is still under testing the developer is not mentioned'
        elif "SDK" in row['Name']:
            df.at[index, 'Developers'] = 'Software Development Kit of the game the developer is not mentioned'
        elif "Demo" in row['Name']:
            df.at[index, 'Developers'] = 'this game is Demo and still under testing the developer is not mentioned'
        elif "Server" in row['Name']:
            df.at[index, 'Developers'] = 'this is a Server for the game the developer is not mentioned'
        elif "Editor" in row['Name']:
            df.at[index, 'Developers'] = 'this is an Editor for the game the developer is not mentioned'
        elif "Beta" in row['Name']:
            df.at[index, 'Developers'] = 'this game is beta and still under testing the developer is not mentioned'
        else:
            df.at[index, 'Developers'] = 'No developer mentioned for this game'

#beta、Test等游戏的Publishers列更改为“this game is xxx and still under testing the publisher is not mentioned“
for index, row in df.iterrows():
    if (pd.isnull(row['Publishers'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Publishers'] = 'this game is Playtest and still under testing the publisher is not mentioned'
        elif "Alpha" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is Alpha and still under testing the publisher is not mentioned'
        elif "beta" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is beta and still under testing the publisher is not mentioned'
        elif "BETA" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is beta and still under testing the publisher is not mentioned'
        elif "Test" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is and still under testing the publisher is not mentioned'
        elif "playtest" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is still under testing the publisher is not mentioned'
        elif "SDK" in row['Name']:
            df.at[index, 'Publishers'] = 'Software Development Kit of the game the publisher is not mentioned'
        elif "Demo" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is Demo and still under testing the publisher is not mentioned'
        elif "Server" in row['Name']:
            df.at[index, 'Publishers'] = 'this is a Server for the game the publisher is not mentioned'
        elif "Editor" in row['Name']:
            df.at[index, 'Publishers'] = 'this is an Editor for the game the publisher is not mentioned'
        elif "Beta" in row['Name']:
            df.at[index, 'Publishers'] = 'this game is beta and still under testing the publisher is not mentioned'
        else:
            df.at[index, 'Publishers'] = 'No publisher mentioned for this game'

#beta、Test等游戏的Categories列更改为“xxx game not playable
for index, row in df.iterrows():
    if (pd.isnull(row['Categories'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Categories'] = 'Playtest game not playable'
        elif "Alpha" in row['Name']:
            df.at[index, 'Categories'] = 'Alpha game not playable'
        elif "beta" in row['Name']:
            df.at[index, 'Categories'] = 'Beta game not playable'
        elif "BETA" in row['Name']:
            df.at[index, 'Categories'] = 'Beta game not playable'
        elif "Test" in row['Name']:
            df.at[index, 'Categories'] = 'test game not playable'
        elif "playtest" in row['Name']:
            df.at[index, 'Categories'] = 'Playtest game not playable'
        elif "SDK" in row['Name']:
            df.at[index, 'Categories'] = 'Software Development Kit of the game not playable'
        elif "Demo" in row['Name']:
            df.at[index, 'Categories'] = 'Demo game not playable'
        elif "Server" in row['Name']:
            df.at[index, 'Categories'] = 'Server of a game not playable'
        elif "Editor" in row['Name']:
            df.at[index, 'Categories'] = 'Editor of a game not playable'
        elif "Beta" in row['Name']:
            df.at[index, 'Categories'] = 'Beta game not playable'
        else:
            continue

#再剩余的Categories则设置为no Category added
for index, row in df.iterrows():
    if (pd.isnull(row['Categories'])):
        df.at[index, 'Categories'] = 'no Category added'

#Genres列处理
#beta、Test等游戏的Genres列更改为“xxx game not playable
for index, row in df.iterrows():
    if (pd.isnull(row['Genres'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Genres'] = 'Playtest game not playable'
        elif "Alpha" in row['Name']:
            df.at[index, 'Genres'] = 'Alpha game not playable'
        elif "beta" in row['Name']:
            df.at[index, 'Genres'] = 'Beta game not playable'
        elif "BETA" in row['Name']:
            df.at[index, 'Genres'] = 'Beta game not playable'
        elif "Test" in row['Name']:
            df.at[index, 'Genres'] = 'test game not playable'
        elif "playtest" in row['Name']:
            df.at[index, 'Genres'] = 'Playtest game not playable'
        elif "SDK" in row['Name']:
            df.at[index, 'Genres'] = 'Software Development Kit of the game not playable'
        elif "Demo" in row['Name']:
            df.at[index, 'Genres'] = 'Demo game not playable'
        elif "Server" in row['Name']:
            df.at[index, 'Genres'] = 'Server of a game not playable'
        elif "Editor" in row['Name']:
            df.at[index, 'Genres'] = 'Editor of a game not playable'
        elif "Beta" in row['Name']:
            df.at[index, 'Genres'] = 'Beta game not playable'
        else:
            continue

#再剩余的Genres则设置为no Genres added
for index, row in df.iterrows():
    if (pd.isnull(row['Genres'])):
        df.at[index, 'Genres'] = 'no Genres added'

#处理Tags列
#Tags列为空的Genres列复制过去
for index, row in df.iterrows():
    if (pd.isnull(row['Tags'])):
        df.at[index, 'Tags'] = df.at[index, 'Genres']

#playtest游戏Screenshots列改为'Playtest game no screenshot available'
#其他的则改为'no screenshot available'
for index, row in df.iterrows():
    if (pd.isnull(row['Screenshots'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Screenshots'] = 'Playtest game no screenshot available'
        else:
            df.at[index, 'Screenshots'] = 'no screenshot available'

#beta、Test等游戏的Movies列更改为“xxx game no trailer available”
for index, row in df.iterrows():
    if (pd.isnull(row['Movies'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Movies'] = 'Playtest game no trailer available'
        elif "Alpha" in row['Name']:
            df.at[index, 'Movies'] = 'Alpha game no trailer available'
        elif "beta" in row['Name']:
            df.at[index, 'Movies'] = 'Beta game no trailer available'
        elif "BETA" in row['Name']:
            df.at[index, 'Movies'] = 'Beta game no trailer available'
        elif "Test" in row['Name']:
            df.at[index, 'Movies'] = 'test game no trailer available'
        elif "playtest" in row['Name']:
            df.at[index, 'Movies'] = 'Playtest game no trailer available'
        elif "SDK" in row['Name']:
            df.at[index, 'Movies'] = 'Software Development Kit of the game no trailer available'
        elif "Demo" in row['Name']:
            df.at[index, 'Movies'] = 'Demo game no trailer available'
        elif "Server" in row['Name']:
            df.at[index, 'Movies'] = 'Server of a game no trailer available'
        elif "Editor" in row['Name']:
            df.at[index, 'Movies'] = 'Editor of a game no trailer available'
        elif "Beta" in row['Name']:
            df.at[index, 'Movies'] = 'Beta game no trailer available'
        else:
            df.at[index, 'Movies'] = 'no trailer available'


#notes, score rank, Metacritic url, website, Support url 空数据多，删除处理
df = df.drop('Notes', axis=1)
df = df.drop('Score rank', axis=1)
df = df.drop('Metacritic url', axis=1)
df = df.drop('Support url', axis=1)
df = df.drop('Website', axis=1)

#处理support email列
#beta、Test等游戏的Support email列更改为“xxx game no Support email available”
for index, row in df.iterrows():
    if (pd.isnull(row['Support email'])):
        if 'Playtest' in row['Name']:
            df.at[index, 'Support email'] = 'Playtest game no Support email available'
        elif "Alpha" in row['Name']:
            df.at[index, 'Support email'] = 'Alpha game no Support email available'
        elif "beta" in row['Name']:
            df.at[index, 'Support email'] = 'Beta game no Support email available'
        elif "BETA" in row['Name']:
            df.at[index, 'Support email'] = 'Beta game no Support email available'
        elif "Test" in row['Name']:
            df.at[index, 'Support email'] = 'test game no Support email available'
        elif "playtest" in row['Name']:
            df.at[index, 'Support email'] = 'Playtest game no Support email available'
        elif "SDK" in row['Name']:
            df.at[index, 'Support email'] = 'Software Development Kit of the game no Support email available'
        elif "Demo" in row['Name']:
            df.at[index, 'Support email'] = 'Demo game no Support email available'
        elif "Server" in row['Name']:
            df.at[index, 'Support email'] = 'Server of a game no Support email available'
        elif "Editor" in row['Name']:
            df.at[index, 'Support email'] = 'Editor of a game no Support email available'
        elif "Beta" in row['Name']:
            df.at[index, 'Support email'] = 'Beta game no Support email available'
        else:
            df.at[index, 'Support email'] = 'no Support email available'

#处理Estimated owners列，取两个数的中位数作为用户数owners clean
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

df.to_csv('games_clean_new.csv', index=False, encoding='utf-8', sep=';')