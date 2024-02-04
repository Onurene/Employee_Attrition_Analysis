-- Databricks notebook source
-- DBTITLE 1,Employee Attrition Rate Analysis
-- MAGIC %md This project aims at analysing the factors involved in the attrition rate of employees from a particular company
-- MAGIC

-- COMMAND ----------

select * from emp_attrition;

-- COMMAND ----------

-- MAGIC %md Understanding the attrition rate based on categorical variables 

-- COMMAND ----------

SELECT BusinessTravel, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as attrition_percentage
FROM emp_attrition
GROUP BY BusinessTravel;

-- COMMAND ----------

SELECT Department, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as attrition_percentage
FROM emp_attrition
GROUP BY Department;

-- COMMAND ----------

SELECT EducationField, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as attrition_percentage
FROM emp_attrition
GROUP BY EducationField;

-- COMMAND ----------

SELECT Gender, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as attrition_percentage
FROM emp_attrition
GROUP BY Gender;


-- COMMAND ----------


SELECT JobRole, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as jobrole
FROM emp_attrition
GROUP BY JobRole;


-- COMMAND ----------


SELECT MaritalStatus, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as marital_status
FROM emp_attrition
GROUP BY MaritalStatus;


-- COMMAND ----------


SELECT Over18, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as attrition_percentage
FROM emp_attrition
GROUP BY Over18;


-- COMMAND ----------


SELECT OverTime, 
avg(case WHEN attrition='Yes' THEN 1 ELSE 0 END)*100 as attrition_percentage
FROM emp_attrition
GROUP BY OverTime;

-- COMMAND ----------

-- MAGIC %md Overall attrition rate

-- COMMAND ----------

SELECT avg(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) as total_attrition
FROM emp_attrition

-- COMMAND ----------

-- MAGIC %md Attrition based on Age

-- COMMAND ----------

SELECT count(*) as age_count, 
CASE WHEN Age BETWEEN 18 and 30 then '18-30'
    WHEN Age BETWEEN 31 and 40 THEN '31-40'
    WHEN Age BETWEEN 41 and 50 THEN '41-50'
    WHEN Age BETWEEN 51 and 60 THEN '51-60'
  END as age_group
FROM emp_attrition
GROUP BY Age;


-- COMMAND ----------

-- MAGIC %md Correlation Analysis

-- COMMAND ----------

SELECT
  corr(Age, DailyRate) AS Correlation_Age_DailyRate,
  corr(Age, MonthlyIncome) AS Correlation_Age_MonthlyIncome,
  corr(DailyRate, MonthlyIncome) AS Correlation_DailyRate_MonthlyIncome
FROM emp_attrition;

-- COMMAND ----------


