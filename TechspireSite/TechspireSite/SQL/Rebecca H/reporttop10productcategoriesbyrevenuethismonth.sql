--Rebecca Hutchinson
--Top 10 product categories by revenue this month
--TThis report is for the client to show the top 10 products categories by revenue. The client can use this to understand how her store is bringing in revenue in a way that allows her to put effort into the areas that are high ranking.
--Display the product category name ordered by the total revenue.
--Product Category name, Total Revenue
--,right


Select Top 10  pt.product_type_name,(concat('$', cast(sum(ol.total_price) AS decimal(18,2)))) as TotalRevenue
From OrderLine as ol
Left join "Order" as o on ol.order_id=o.id
Left join product as p on ol.product_id=p.id
inner join productstatus as ps on p.product_status_id=ps.id and ps.is_active=1
Left join producttype as pt on pt.id=p.product_type_id
Group by pt.product_type_name
Order by sum(ol.total_price) desc
