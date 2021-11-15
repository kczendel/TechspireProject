--Torrey Brett
--Active Loyalty Customer Order History Report
--The client will utilize this report to show active loyalty customers information and the orders they placed beginning with the most recent order. This information is useful for the client to ensure there is a record of active loyalty customer orders in case there is a dispute, issue, or need for proof in the future.
--The Active Customer Order History report displays the Active Loyalty Customer order information, name informatin, and contact information. Along with the store information, the report contains the order date and individual product price of the item that was purchased in an order.
--Row Number, Order Date, Product Name, Product Description, Quantity, Product Price, Order Total, First Name, Last Name, Customer Phone Number, Customer Email, Store Name, Store Phone 
--,,,,right,right,right,,,phone,,,phone

SELECT ROW_NUMBER() OVER(ORDER BY ("Order".order_date) desc) AS Num_Row,
"Order".order_date AS Order_Date, Product.product_name AS Product_Name, Product.Product_desc AS Product_Description, Orderline.quantity AS Quantity, (concat('$', cast(STR(Product.product_price,20,2) AS decimal(18,2)))) AS Product_Price, (concat('$', cast(STR("Order".final_total,20,2) AS decimal(18,2)))) AS Order_Total, Customer.first_name AS First_Name, Customer.last_name AS Last_Name, Customer.phone_number AS Customer_Phone_Number,
Customer.email_address AS Customer_Email, Store.store_name AS Store_Name, STR(Store.phone_number,40,0) AS Store_Phone
From Customer
INNER JOIN CustomerSocialMedia
ON Customer.id = CustomerSocialMedia.customer_id
INNER JOIN SocialMediaType
ON CustomerSocialMedia.social_media_type_id = SocialMediaType.id
INNER JOIN "Order"
ON Customer.id = "Order".customer_id
INNER JOIN OrderLine
ON "Order".id = OrderLine.order_id
INNER JOIN Product
ON OrderLine.product_id = Product.id
INNER JOIN CustomerStatus
ON Customer.customer_Status_id = CustomerStatus.id
INNER JOIN Store
ON Store.id = "Order".store_id
WHERE CustomerStatus.status_name = 'Active'
