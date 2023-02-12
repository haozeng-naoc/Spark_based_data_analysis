// Databricks notebook source
import org.apache.spark.sql.Encoders

// COMMAND ----------

case class life(Country: String,
Year: Int,
Status: String,
Life_expectancy: Double,
Adult_Mortality: Int,
infant_deaths: Int,
Alcohol: Double,
percentage_expenditure: Double,
Hepatitis_B: Int,
Measles: Int,
BMI: Double,
under_five_deaths: Int,
Polio: Int,
Total_expenditure: Double,
Diphtheria: Int,
HIV_AIDS: Double,
GDP: Double,
Population: Double,
thinness_1_19_years: Double,
thinness_5_9_years: Double,
Income_composition_of_resources: Double,
Schooling: Double)

// COMMAND ----------

val lifeSchema = Encoders.product[life].schema

// COMMAND ----------

val lifeDF = spark.read.schema(lifeSchema).option("header", "true").csv("/FileStore/tables/Life_Expectancy_Data-1.csv")

display(lifeDF)

// COMMAND ----------

// MAGIC %md
// MAGIC ### 数据记录计数

// COMMAND ----------

// MAGIC %scala
// MAGIC 
// MAGIC lifeDF.count()

// COMMAND ----------

// MAGIC %md
// MAGIC ### 数据统计

// COMMAND ----------

display(lifeDF.describe())

// COMMAND ----------

// MAGIC %md
// MAGIC ### 打印 dataframe 的schema

// COMMAND ----------

lifeDF.printSchema()

// COMMAND ----------

lifeDF.createOrReplaceTempView("lifeData")

// COMMAND ----------

// MAGIC %md
// MAGIC ### 从临时表中展示数据

// COMMAND ----------

// MAGIC %sql
// MAGIC 
// MAGIC select * from lifeData;

// COMMAND ----------

// MAGIC %md
// MAGIC ### 人均寿命柱状图

// COMMAND ----------

// MAGIC %sql
// MAGIC select Life_expectancy from lifeData;

// COMMAND ----------

// MAGIC %md
// MAGIC ### 婴儿死亡柱状图

// COMMAND ----------

// MAGIC %sql
// MAGIC select infant_deaths from LifeData;

// COMMAND ----------


