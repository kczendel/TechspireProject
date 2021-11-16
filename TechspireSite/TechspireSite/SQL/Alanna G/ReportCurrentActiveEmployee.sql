--Alanna Gilcrease
--Current Active Employees
--The client could use this report to view a list of current active employees. For example, the client could use this report to call employees in the event of an emergency or to call someone in to work if shorthanded.
--This report displays all active employees, phone number, their job title, and store location.  
--Row Number,First Name,Last Name,Phone Number,Job Title
--,,,phone,

SELECT 
Employee.first_name AS 'First Name',
Employee.last_name AS 'Last Name',
Employee.phone_number AS 'Phone Number',
Job.job_name AS 'Job Title'

FROM Employee
INNER JOIN EmployeeJob
ON EmployeeJob.employee_id = Employee.id
INNER JOIN Job
ON EmployeeJob.job_id = Job.id
INNER JOIN EmployeeStatus
ON Employee.employee_status_id = EmployeeStatus.id

WHERE EmployeeStatus.id = 1
ORDER BY Job.id, EmployeeJob.store_id
