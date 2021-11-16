-- Kyle Dela Pena
--Categorized Average Employee Duration
-- The client can use this report to see which employee classification has the highest and lowest employee retention rate and determine the average length of employment, which can be helpful information that can be used to set the length of time before any employee receives a raise. The report could also be used to determine which job role, category, and type allows for the greatest employee retention rate. It is then up to the client to modify each job association to either increase or decrease the employee retention. This can be done by lowering or increases wages, adding or removing bonuses, and increasing or decreasing paid time off hours.
-- Selects all the different employee classifications such as job role, category, and type and finds the average employment length of each.
-- Employee Classifcation, Total Employee Days, Total Employee Count, Avg Employment in Days, Avg Employment in Months
-- null,right,right,right,right

DECLARE @employee_category VARCHAR(10) = 1
DECLARE @employee_job VARCHAR(10) = 1
DECLARE @employee_type VARCHAR(10) = 1
DECLARE @store_id VARCHAR(12) = 1

SELECT  'All' AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(DISTINCT Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id

UNION

SELECT (SELECT category_name FROM EmployeeCategory WHERE id = @employee_category) AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(DISTINCT Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id
WHERE EmployeeCategory.id = @employee_category

UNION

SELECT  (SELECT job_name FROM Job WHERE id = @employee_job) AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(DISTINCT Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Months'

FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id
WHERE Job.id = @employee_job


UNION

SELECT  (SELECT type_name FROM EmployeeType WHERE id = @employee_type) AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(DISTINCT Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Months'


FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id
WHERE EmployeeType.id = @employee_type

UNION 

SELECT  'Store: ' + (SELECT store_name FROM Store WHERE id = @store_id) AS 'Employee Classifcation',
		SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) AS 'Total Employee Days',
		COUNT(DISTINCT Employee.id) AS 'Total Employee Count',
        SUM(DATEDIFF(day, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Days',
		SUM(DATEDIFF(month, Employee.begin_date, IIF(Employee.end_date IS NOT NULL , Employee.end_date, getdate() ))) / COUNT(DISTINCT Employee.id) AS 'Avg Employment in Months'


FROM Employee
INNER JOIN EmployeeEmployeeCategory ON EmployeeEmployeeCategory.employee_id = Employee.id
INNER JOIN EmployeeCategory ON EmployeeEmployeeCategory.employee_category_id = EmployeeCategory.id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeType ON Employee.employee_type_id = EmployeeType.id
INNER JOIN Store ON EmployeeJob.store_id = Store.id

WHERE EmployeeJob.store_id = @store_id




