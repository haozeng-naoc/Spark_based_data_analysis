# Databricks notebook source
# MAGIC %fs ls /FileStore/tables/kaggle/kaggle.json

# COMMAND ----------

# MAGIC %md
# MAGIC 1. To read Kaggle json file and create variables from the two attributes in this file.

# COMMAND ----------

json_file_path = '/FileStore/tables/kaggle/kaggle.json'

spark_json_df = spark.read.format('json').option('header','true').option('inferscheme','true').load(json_file_path)

KAGGLE_USERNAME = spark_json_df.select(spark_json_df.username).take(1)[0]['username']
KAGGLE_KEY = spark_json_df.select(spark_json_df.key).take(1)[0]['key']
KAGGLE_USERNAME,KAGGLE_KEY

# COMMAND ----------

import os 
os.environ['KAGGLE_NAME'] = KAGGLE_USERNAME
os.environ['KAGGLE_KEY'] = KAGGLE_KEY
os.environ

# COMMAND ----------

!cp /FileStore/tables/kaggle/kaggle.json  /root/.kaggle.

# COMMAND ----------

# MAGIC %sh
# MAGIC export KAGGLE_USERNAME=my_name
# MAGIC export KAGGLE_KEY=my_key

# COMMAND ----------

    from kaggle.api.kaggle_api_extended import KaggleApi
    api = KaggleApi()
    api.authenticate()

    print('The authentication is successful!')

# COMMAND ----------

# MAGIC %md 
# MAGIC 2.Validate that the spark object is a implict object

# COMMAND ----------

print(spark)

# COMMAND ----------

# MAGIC %md
# MAGIC 2.Authenticate Kaggle Account -USERNAME & KEY

# COMMAND ----------

def authenticate_kaggle(KAGGLE_USERNAME,KAGGLE_KEY):
    
    import os 
    os.environ['KAGGLE_NAME'] = KAGGLE_USERNAME
    os.environ['KAGGLE_KEY'] = KAGGLE_KEY

    from kaggle.api.kaggle_api_extended import KaggleApi

    api = KaggleApi()
    api.authenticate()

    print('The authentication is successful!')
    return api


# COMMAND ----------

try :
    api = authenticate_kaggle(KAGGLE_USERNAME,KAGGLE_KEY)
except Exception as e:
    print(e)
    print('Installing the module :pip isntall kaggle.......')
    
    import sys
    import subprocess
    
    subprocess.check_call([sys.executable,'-m','pip','install','kaggle'])
    api = authenticate_kaggle(KAGGLE_USERNAME,KAGGLE_KEY)
    

# COMMAND ----------

# !mkdir ~/.kaggle
!touch ~/.kaggle/kaggle.json

api_token = {"username":KAGGLE_USERNAME,"key":KAGGLE_KEY}

import json

with open('/root/.kaggle/kaggle.json', 'w') as file:
    json.dump(api_token, file)

!chmod 600 ~/.kaggle/kaggle.json

# COMMAND ----------

# MAGIC %fs ls /root/.kaggle/kaggle.json

# COMMAND ----------

# MAGIC %md 
# MAGIC 3.Download the dataset from kaggle now

# COMMAND ----------

!kaggle datasets list -s 'life expectancy'

# COMMAND ----------

api.dataset_download_file('kumarajarshi/life-expectancy-who','Life Expectancy Data.csv')

# COMMAND ----------

display(dbutils.fs.ls('file:/databricks/driver'))

# COMMAND ----------

!pwd

# COMMAND ----------

!mv Life%20Expectancy%20Data.csv life_expectancy_data.csv

# COMMAND ----------



# COMMAND ----------


