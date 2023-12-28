create database HR_Analytics;
use HR_Analytics;

select * from hr_table;

## 1. Employee Count 

SELECT COUNT(EmployeeCount) FROM hr_table;

## 2. Avg year at company

SELECT ROUND(avg(YearsAtCompany), 2) FROM hr_table;

## 3. Avg Age of Employee

SELECT ROUND(AVG(Age), 0) FROM hr_table;

## 4. Attrition Count

SELECT COUNT(Attrition) as Attrition_Count FROM hr_table
WHERE Attrition = "Yes" ;

## 5. Attrition Rate

SELECT (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeCount)) * 100 as AttritionRate
FROM hr_table;

## 6. Attrition by Education

SELECT 
    EducationField,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as Total_Attrition,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)) OVER ()) * 100 as Percentage_of_Total_Attrition,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 as AttritionPercentage

FROM hr_table
GROUP BY EducationField;

## 7. Attrition by Age Group
 
 SELECT 
  (CASE WHEN Age BETWEEN 18 and 25 THEN "18-25"
		WHEN Age BETWEEN 26 and 35 THEN "26-35"
        WHEN Age BETWEEN 36 and 45 THEN "36-45"
        WHEN Age BETWEEN 46 and 55 THEN "46-55"
        ELSE "56 & Above"
        END) Age_Group, 
        SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
        FROM hr_table
        GROUP BY Age_Group
        ORDER BY Age_Group;
        
        
        
## 8. Attrition by Salary Slab

SELECT
(CASE WHEN MonthlyIncome BETWEEN 5000 and 10000 THEN "5k-10k"
	  WHEN MonthlyIncome BETWEEN 10000 and 15000 THEN "10k-15k"
      WHEN MonthlyIncome > 15000 THEN  "15k+ "
      ELSE "Upto 5k" END) Salary_Slab,
COUNT(CASE WHEN Attrition = "Yes" Then 1 ELSE 0 END) Attrition_Count
FROM hr_table
GROUP BY Salary_Slab
ORDER BY Salary_Slab;

## 9. Attrition by Job Role

SELECT JobRole,
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY JobRole;

## 10. Attrition by Year at Company

SELECT YearsAtCompany,
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

## 11. Job Satisfaction by Role and Total Attrition

SELECT JobRole, JobSatisfaction,
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY JobRole, JobSatisfaction
ORDER BY JobRole, JobSatisfaction;

## 12. Attrition by Department

SELECT Department, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY Department;

## 13. Attrition by Gender

SELECT Gender, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY Gender;

## 14. Attrition by Marital Status

SELECT MaritalStatus, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY MaritalStatus;

## 15. Attrition by WorkLife Balance

SELECT WorkLifeBalance, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY WorkLifeBalance;

## 16. Attrition by Business Travel

SELECT BusinessTravel, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY BusinessTravel;

## 17. Attrition by Environment Satisfaction

SELECT EnvironmentSatisfaction, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

## 18. Attrition by Distance From Home

SELECT DistanceFromHome, 
SUM(CASE WHEN Attrition = "Yes" THEN 1 ELSE 0 END) Total_Attrition
FROM hr_table
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome;
