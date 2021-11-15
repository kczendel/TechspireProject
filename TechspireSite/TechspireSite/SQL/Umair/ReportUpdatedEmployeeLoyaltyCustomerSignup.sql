--Umair Shamsuddin
--Employee Amount of Loyalty Sign-ins
--The client can use this report as a way to keep track of the number of customers signed up for loyalty membership per employee. Specifically, the focus is on the employee in that it keeps track of which employee signed up what loyalty customer as well as what that employee's current status is in the business. For example, if the client sees a large number of loyalty member signups on a specific day or week then they can look at the  employee who is the most adept at that and make better use of them.
--The report displays info mainly related to the employee such as the employee name, what type of employee they are, if they are currently an employee or not. It also shows which customer was signed-up and when.
--Row number,Employee First Name,Employee Last Name,Employee Category,Customer First Name,Customer Last Name,Customer Begin Date,Store Name
--,,,,,,,,

DECLARE @begin_date VARCHAR(12) = '2015-01-01'
DECLARE @end_date VARCHAR(12) = '2015-12-31'

SELECT ROW_NUMBER() 

OVER(ORDER BY Employee.first_name ASC) AS Row_Num, 
Employee.first_name AS "Employee First Name", 
Employee.last_name AS "Employee Last Name",
EmployeeType.type_name AS "Employee Type",
EmployeeStatus.status_name AS "Employee Status", 
Customer.first_name AS "Customer First Name",
Customer.begin_date AS "Loyalty Membership Start Date",
Store.store_name AS "Store"

FROM Employee
INNER JOIN Customer ON Customer.create_employee_id = Employee.id
INNER JOIN EmployeeType ON EmployeeType.id = Employee.employee_type_id
INNER JOIN EmployeeStatus ON EmployeeStatus.id = Employee.employee_status_id
INNER JOIN EmployeeJob ON EmployeeJob.employee_id = Employee.id
INNER JOIN Store ON Store.id = EmployeeJob.store_id
WHERE Employee.employee_status_id=1 AND Customer.begin_date >= @begin_date AND Customer.begin_date <= @end_date
