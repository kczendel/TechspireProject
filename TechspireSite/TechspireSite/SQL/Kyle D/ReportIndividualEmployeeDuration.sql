-- Kyle Dela Pena
-- Individual Employee Duration  
-- The client can see each employee and their employment duration along with their job associations, which is useful when the client wants to find a correlation between employment length and job association. For example, the first few rows display the employees who have worked with her for the longest. Inactive employees are also displayed since their employment duration will help calculate the average. Using the report, the client can identify which job associations provide the longest employee retention. However, if the client wants to find the average employment length for each job association, the Categorized Average Employee Duration report will be more useful. Since this report is for individual employees, the client can find a specific employee to compare to the average for the employee’s specific job associations. For instance, the client can find an employee who is a part-time and a cashier, then compare that specific employee’s employment length to the category’s average. She can then decide to increase a specific employee’s employment length by increasing their wage or adding bonuses, knowing that the employee is reaching the average length for their category.
-- Row Number, First Name, Last name, Duration in Days, Job Name, Type Name, Category Name, Status Name, End Date
-- null,null,null,right,null,null,null,null,null

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.last_name) AS 'Row Num', 
Employee.first_name AS 'First Name', 
Employee.last_name AS 'Last Name', 
DATEDIFF(day, begin_date, IIF(end_date IS NOT NULL , end_date, getdate() )) AS 'Duration in days', 
Job.job_name AS 'Job Name', 
EmployeeType.type_name AS 'Type Name', 
EmployeeCategory.category_name AS 'Category Name', 
EmployeeStatus.status_name AS 'Status Name', 
Employee.end_date AS 'End Date'

FROM Employee
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id

GROUP BY Employee.first_name, Employee.last_name, Job.job_name, EmployeeType.type_name, EmployeeCategory.category_name, EmployeeStatus.status_name, Employee.end_date, Employee.begin_date
ORDER BY 'Duration in days' DESC

