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

// MAGIC %python 
// MAGIC import pandas as pd
// MAGIC df=pd.read_csv('/FileStore/tables/Life_Expectancy_Data-1.csv')
// MAGIC df.head()

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

// MAGIC %sql
// MAGIC 
// MAGIC select Life_expectancy,Adult_Mortality from lifeData

// COMMAND ----------



// COMMAND ----------

// MAGIC %md
// MAGIC ### 特征提取

// COMMAND ----------

var StringfeatureCol = Array("Status","Country")

// COMMAND ----------

// MAGIC %md
// MAGIC ### StringIndexer 将一列标签字符串编码为一列标签索引

// COMMAND ----------

// MAGIC %python
// MAGIC """
// MAGIC %scala
// MAGIC 
// MAGIC import org.apache.spark.ml.feature.VectorAssembler
// MAGIC 
// MAGIC val assembler = new VectorAssembler().setInputCols(Array(“Country_indexed”, “Year”, “Status_indexed”, “Adult_Mortality”, “infant_deaths”, “Alcohol”, “percentage_expenditure”, “Hepatitis_B”, “Measles”, “BMI”, “under_five_deaths”, “Polio”, “Total_expenditure”, “Diphtheria”, “HIV_AIDS”, “GDP”, “Population”, “thinness_1_19_years”, “thinness_5_9_years”, “Income_composition_of_resources”, “Schooling”)).setOutputCol(“features”).setHandleInvalid(“skip”)
// MAGIC 
// MAGIC val training = assembler.transform(train).select($”features”, $”Life_expectancy”.alias(“label”))
// MAGIC 
// MAGIC training.show()
// MAGIC 
// MAGIC """.replace('“','"').replace('”','"').replace('\n','')

// COMMAND ----------

import org.apache.spark.ml.feature.StringIndexer
val df = spark.createDataFrame(Seq((0, "a"), (1, "b"), (2, "c"), (3, "a"), (4, "a"), (5, "c"))).toDF("id", "category")
val indexer = new StringIndexer().setInputCol("category").setOutputCol("categoryIndex")
val indexed = indexer.fit(df).transform(df)
indexed.show()

// COMMAND ----------

// MAGIC %md
// MAGIC ###定义pipeline
// MAGIC 
// MAGIC 一个预测模型往往需要多个阶段的特征准备。
// MAGIC 
// MAGIC pipeline由一系列转换器和估计器阶段组成，这些阶段通常为建模准备一个 DataFrame，然后训练一个预测模型
// MAGIC 
// MAGIC 这样我们需要创建一个多阶段的管道
// MAGIC 
// MAGIC 一个 StringIndexer 估计器，它将字符串值转换为分类特征的索引
// MAGIC 
// MAGIC 将分类特征组合到单个向量中的 VectorAssembler

// COMMAND ----------

// MAGIC %scala
// MAGIC 
// MAGIC import org.apache.spark.ml.attribute.Attribute
// MAGIC import org.apache.spark.ml.feature.{IndexToString, StringIndexer}
// MAGIC import org.apache.spark.ml.{Pipeline, PipelineModel}
// MAGIC 
// MAGIC val indexers = StringfeatureCol.map { colName =>
// MAGIC new StringIndexer().setInputCol(colName).setHandleInvalid("skip").setOutputCol(colName + "_indexed")
// MAGIC }
// MAGIC print(indexers)
// MAGIC 
// MAGIC val pipeline = new Pipeline().setStages(indexers)
// MAGIC 
// MAGIC val LifeDF = pipeline.fit(lifeDF).transform(lifeDF)

// COMMAND ----------

// MAGIC %md
// MAGIC ### 打印schema

// COMMAND ----------

LifeDF.printSchema()

// COMMAND ----------

// MAGIC %md
// MAGIC ### 将数据集分为训练集和验证集 
// MAGIC 7:3的比例

// COMMAND ----------

val splits = LifeDF.randomSplit(Array(0.7, 0.3))
val train = splits(0)
val test = splits(1)
val train_rows = train.count()
val test_rows = test.count()
println("Training Rows:" + train_rows + " Testing Rows:" + test_rows)

// COMMAND ----------

// MAGIC %md
// MAGIC ### 准备training set
// MAGIC 
// MAGIC 为了训练线性回归模型，需要一个训练数据集，其中包括一个数字特征向量和一个标签列
// MAGIC 
// MAGIC 在这个项目中，我们将使用 VectorAssembler 类将特征列转换为向量，然后将预期寿命列重命名为标签

// COMMAND ----------

// MAGIC %md
// MAGIC ### VectorAssembler () 
// MAGIC 
// MAGIC 是一个transforer，它将给定的列列表组合成单个向量列
// MAGIC 
// MAGIC 它有助于将不同特征转换器生成的原始特征和特征组合成一个单一的特征向量，以便训练机器学习模型，如 Logit模型和决策树模型
// MAGIC 
// MAGIC VectorAssembler 接受以下输入列类型: 所有数值类型、布尔类型和向量类型。
// MAGIC 
// MAGIC 在每一行中，输入列的值将按指定的顺序连接到一个向量中。

// COMMAND ----------

// MAGIC %scala
// MAGIC import org.apache.spark.ml.feature.VectorAssembler
// MAGIC val assembler = new VectorAssembler().setInputCols(Array("Country_indexed", "Year", "Status_indexed", "Adult_Mortality", "infant_deaths", "Alcohol", "percentage_expenditure", "Hepatitis_B", "Measles", "BMI", "under_five_deaths", "Polio", "Total_expenditure", "Diphtheria", "HIV_AIDS", "GDP", "Population", "thinness_1_19_years", "thinness_5_9_years", "Income_composition_of_resources", "Schooling")).setOutputCol("features").setHandleInvalid("skip")
// MAGIC val training = assembler.transform(train).select($"features", $"Life_expectancy".alias("label"))
// MAGIC 
// MAGIC training.show()

// COMMAND ----------

// MAGIC %md
// MAGIC ### 训练一个线性回归模型
// MAGIC 
// MAGIC 我们需要利用训练数据来训练一个线性回归模型
// MAGIC 
// MAGIC 创建一个你想要使用的线性回归算法的实例，并使用它的 fit 方法来训练基于数据框架的模型
// MAGIC 
// MAGIC 在这个项目中，我们将使用一个线性回归的算法——我们也可以使用相同的技术来处理任何一个在 stark.ml API 中支持的回归算法，如逻辑回归等

// COMMAND ----------

import org.apache.spark.sql.types._
import org.apache.spark.sql.functions._

import org.apache.spark.ml.Pipeline
import org.apache.spark.ml.feature.VectorAssembler
import org.apache.spark.ml.regression.LinearRegression

val lr = new LinearRegression().setLabelCol("label").setFeaturesCol("features")

val model = lr.fit(training)

println("训练完成！")

// COMMAND ----------

// MAGIC %md
// MAGIC ### 准备验证集
// MAGIC 
// MAGIC 现在您已经有了一个经过训练的模型，可以使用以前保留的测试数据对其进行测试
// MAGIC 
// MAGIC 首先，通过将特征列转换为向量，您需要以与训练数据相同的方式准备测试数据
// MAGIC 
// MAGIC 我们把 Life _ Features 列重命名为 trueLabel

// COMMAND ----------


val testing = assembler.transform(test).select($"features", $"Life_expectancy".alias("trueLabel"))
testing.show()

// COMMAND ----------

// MAGIC %md
// MAGIC ### 测试模型
// MAGIC 
// MAGIC 我们现在其实可以根据生成的线性回归模型去预测人均寿命，但是在本项目中使用的是测试集，是真实的数据，因此我们可以看一下模型的训练效果

// COMMAND ----------

val prediction = model.transform(testing)
val predicted = prediction.select("features", "prediction", "trueLabel")
predicted.show(100)

// COMMAND ----------

predicted.createOrReplaceTempView("regressionModelPredictions")

// COMMAND ----------

// MAGIC %sql
// MAGIC 
// MAGIC select trueLabel,prediction from regressionModelPredictions

// COMMAND ----------

// MAGIC %md
// MAGIC ## 均方根误差（RMSE）是回归模型两项主要性能指标中的一项
// MAGIC 
// MAGIC 它度量模型所预测的值与实际值之间的平均差值。 它用来估计模型预测目标值的性能（准确度）。

// COMMAND ----------

import org.apache.spark.ml.evaluation.RegressionEvaluator

val evaluator = new RegressionEvaluator().setLabelCol("trueLabel").setPredictionCol("prediction").setMetricName("rmse")
val rmse = evaluator.evaluate(prediction)
println("均方根误差（RMSE）:"  + rmse)



// COMMAND ----------

// MAGIC %md
// MAGIC > 由均方根误差为3.5左右，我们可以认为，该模型拟合效果较好

// COMMAND ----------


