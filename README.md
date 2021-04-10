# Pewlett-Hackard Analysis

## Overview of the Pewlett-Hackard Analysis

In this Module, we used PostgreSQL to analyze the employee and department datasets from Pewlett-Hackard company. There are 6 tables. Each one of them have one or more primary keys which will be used to link to other tables. 

In this analysis, we are going to use the existing tables to complete two tasks in order to help the PH manager to prepare for the “silver tsunami” as many current employees reach retirement age.

-	Get the number of employees reaching the retirement age by Title;
-	Get the number of current employees that eligible for the Mentorship program in the company. 

## Analysis

In the previous analysis, we have already imported each dataset into the schema on PgAdmin. We are going to continue using the existing data from PH company. 

1.	The Number of Retiring Employees by Title.

    (1) 	Merged the employees and titles dataset by primary key “emp_no”. Kept emp_no, first_name and last_name variables from the employees data; kept title, from_date and               to_date variables from the titles data. In the meantime, filtered the data with birth date between 01 January 1952 and 31 December 1955. After this step, created                 dataset named retirement_titles.  

    ![inst1](https://user-images.githubusercontent.com/79289806/114286363-136bc300-9a2c-11eb-920c-8984217616a8.png)

    (2) 	Employees could have multiple titles in the titles dataset. This will cause duplicate records in the dataset created from step (1). In this step, used DISTINCT ON to             remove duplicates by emp_no, created dataset unique_titles.

    ![inst2](https://user-images.githubusercontent.com/79289806/114286364-136bc300-9a2c-11eb-84d9-2d1d93ee1795.png)
 
    (3) 	Used the dataset unique_titles created from step (2) to count the number of employees by most recent job title who are about to retire. Ordered the data in descending           by the count.  

    ![inst3](https://user-images.githubusercontent.com/79289806/114286365-136bc300-9a2c-11eb-954b-0b101977e72f.png)

2.	The Employees Eligible for the Mentorship Program.

    Merged employees, dept_emp and titles datasets together by primary keys. In the merged step, used LEFT JOIN to keep all the records from the employees data. In the meantime,     removed duplicates by using DISTINCT ON (emp_no). Filtered the data by birth date and to_date. After this step, the dataset mentorship_eligibilty contained unique records       for each employee that eligible for the mentorship program.  

    ![inst4](https://user-images.githubusercontent.com/79289806/114286366-136bc300-9a2c-11eb-9bc0-0c08ca0a1e87.png)

## Results

1.	Employees and titles with birth date between 1952 and 1955 sample:

    ![inst5](https://user-images.githubusercontent.com/79289806/114286368-136bc300-9a2c-11eb-97d5-45a03e575944.png)

    Removed duplicates and only kept the employee’s most recent title:
 
    ![inst6](https://user-images.githubusercontent.com/79289806/114286369-136bc300-9a2c-11eb-8875-25de2ccd3bd5.png)

    Final table of number of unique employees by the most recent job title:

    ![inst7](https://user-images.githubusercontent.com/79289806/114286370-14045980-9a2c-11eb-875e-11bceba67704.png)

2.	Employees that eligible for the mentorship program sample:

    ![inst8](https://user-images.githubusercontent.com/79289806/114286371-14045980-9a2c-11eb-8f72-dce4a379f454.png)

## Summary: 

There are 300,024 employees in the company in variety of departments. Based on this analysis, there are 90,398 employees reached the retirement age. Additionally, there are 1,549 current employees that eligible for the mentorship program. 

To be able to better help PH manager prepare for the “silver tsunami” further analysis are needed.

1.	In the current analysis for the number of retirement employees, we included both retired and current employees. To get the total number of employees that reaching the           retirement age, we need to further filter the data by “to_date”.

    ![inst9](https://user-images.githubusercontent.com/79289806/114286353-123a9600-9a2c-11eb-9842-0422b7958419.png)
  
    After this step, there are 72,458 unique employees that will retire in the near future. 

    ![inst10](https://user-images.githubusercontent.com/79289806/114286354-123a9600-9a2c-11eb-917f-e388fd3734b3.png)

    The roles for each of these employees need to be filled. In the next step, we will conduct a similar analysis as we did before to get the number of employees that will           retire by their most recent titles. 

    ![inst11](https://user-images.githubusercontent.com/79289806/114286355-123a9600-9a2c-11eb-8c72-5f832f03c806.png)

    We will get the number of roles that need to be filed by title:

    ![inst12](https://user-images.githubusercontent.com/79289806/114286356-123a9600-9a2c-11eb-8258-28b9690e2b34.png)
   
    Alternatively, we could also link the future_retirment_titles data to the dept_emp table in order to get the count of employees that need to be filled by department. 

    ![inst13](https://user-images.githubusercontent.com/79289806/114286357-12d32c80-9a2c-11eb-95a3-d98af4363f58.png)
 
    We are able to get the number of employees that need to be filled by department:

    ![inst14](https://user-images.githubusercontent.com/79289806/114286358-12d32c80-9a2c-11eb-8855-194ee07e42a1.png)

2.	From the previous analysis, there are 1,549 employees met the criteria to be enrolled in the mentorship program. 

    In order to know the distribution of employees by department, we could link the mentorship dataset created from previous step to the dept_empt data.

    ![inst15](https://user-images.githubusercontent.com/79289806/114286359-12d32c80-9a2c-11eb-9373-c9412ec04a0a.png)
 
    The number of employees by department:

    ![inst16](https://user-images.githubusercontent.com/79289806/114286360-12d32c80-9a2c-11eb-9fd9-d07489cfe502.png)

    From #1 we have already known the employees that will retire in the near future by department. Combine these two tables together by dept_no.

    ![inst17](https://user-images.githubusercontent.com/79289806/114286361-12d32c80-9a2c-11eb-8df2-872956cfaca5.png)

    we could get the following table:

    ![inst18](https://user-images.githubusercontent.com/79289806/114286362-136bc300-9a2c-11eb-8a15-678d36a9eba1.png)      

    For each of these department, there are about 40 to 50 times more employees that will retire in the near future than the number of employees that eligible for the mentorship     program (column “percent_4_mentorship”). 

    Based on this analysis, there will be enough qualified, retirement-ready employees in the departments to mentor the next generation of PH employees. 
