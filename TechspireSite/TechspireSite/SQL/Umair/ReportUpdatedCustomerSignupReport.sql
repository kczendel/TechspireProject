--Umair Shamsuddin
--Customer Sign-ups
--This report is used as a way for the client to keep track of any loyalty customer signups that occur. Loyalty members are the core of the loyalty system so having a record of when they became a loyalty member, including the beginning date, will let the client know the number of loyalty members and it's frequency. Also, knowing what type of customer they are can benefit the client in knowing how to make her system more appealing to the customers.
--This report displays a customers first and last name as well as what sort of customer they are, when they joined the membership, where they joined, and if they are still active members.
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
