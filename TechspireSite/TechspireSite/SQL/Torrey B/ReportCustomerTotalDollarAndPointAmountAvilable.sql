--Torrey Brett
--Customer Total Dollar Spent and Point Amount Available Report
--This report will allow the client to view the loyalty customers and their dollar spending totals to understand which customers have spent the most money at the bakeries and their point total. In addition, the information provided in this report can be used to understand which high spending customers are maximizing the utility of their points. The facts gathered from this report can be used as a talking point with the customer and provide a better customer experience by acknowledging their spending and point totals. 
--Included in this report is the customer first and last name, their spending totals, their points used, and the employee name and information that took the customer order. 
--Row Number,First Name,Last Name,Spending Total,Point Total
--,,,right,right

SELECT ROW_NUMBER() OVER(ORDER BY Totals.total desc) AS Num_Row,
Customer.first_name AS First_Name, Customer.last_name AS Last_Name, (concat('$', cast(Totals.total  AS decimal(18,2)))) AS Customer_Spending_Total, Points.total AS Customer_Total_Points
FROM (SELECT
SUM ("ORDER".final_total) AS total, "Order".customer_id
FROM "ORDER"
GROUP BY "Order".customer_id)
AS Totals
INNER JOIN Customer 
ON Customer.id = Totals.customer_id
INNER JOIN CustomerStatus
ON CustomerStatus.id = Customer.customer_status_id
INNER JOIN (SELECT
SUM (PointLog.points_amount) AS total, PointLog.customer_id
FROM PointLog
GROUP BY PointLog.customer_id)
AS Points 
ON Points.customer_id = Totals.customer_id
WHERE Customer.point_total > 0 AND Customer.customer_status_id = 1
ORDER BY Totals.total desc
