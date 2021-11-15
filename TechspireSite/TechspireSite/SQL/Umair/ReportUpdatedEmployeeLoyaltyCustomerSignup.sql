--Umair Shamsuddin
--Employee Amount of Loyalty Sign-ups In a Specific Time Period
--The client can use this report as a way to keep track of the frequency of customer sign-ups in a specific time period and what employees were most active in doing so. With this report, the client will know which employee was the most proactive in creating loyalty customers so that the performance of thiese individuals can be kept track of. For example, if the client wants to know which employees tend to get the most people to sign up as a way to reward them for their efforts, then they cn generate this report and know which name shows up the most.
--This report displays an employees name, type, and status as well as the customer they signed up's first name, when they signed up, and where they signed up within a specific time frame.
--Row number,Employee First Name,Employee Last Name,Employee Type,Employee Status,Customer First Name,Customer Begin Date,Store Name
--,,,,,,,

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
