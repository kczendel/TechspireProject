--Umair Shamsuddin
--Customer Sign-ups
--This report is used as a way for the client to keep track of any loyalty customer sign-ups that occur. Loyalty members are a core part of a loyalty system so knowing when a loyalty member signs up can be very benefical. For example, you want to know the number of loyalty customers that signed up in a specific period of time as well as if they are still active, then this report can provide sufficent information.
--This report displays a customers first and last name as well as what sort of customer they are, when they joined the membership, if they are still active members, and who signed them up.
--Row Number,Customer First Name,Customer Last Name,Begin Date,Employee Name,Customer Status,Customer Tier
--,,,,,,

SELECT ROW_NUMBER() 

OVER(ORDER BY Customer.first_name ASC) AS Row_Num,
Customer.first_name AS "Customer First Name",
Customer.last_name AS "Customer Last Name",
Customer.begin_date AS "Loyalty Customer Start Date",
Employee.first_name AS "Employee Name",
CustomerStatus.status_name AS "Customer Status",
Tier.tier_name AS "Tier" 


From Customer
INNER JOIN Tier ON Tier.id = Customer.tier_id
INNER JOIN CustomerStatus ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN Employee ON Employee.id = Customer.create_employee_id
