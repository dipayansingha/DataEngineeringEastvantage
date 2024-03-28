select c.customer_id, c.age, i.item_name,
sum(case when o.quantity is null then 0 else o.quantity end) as Quantity
from customers c 
join sales s on c.customer_id = s.customer_id
join orders o on o.sales_id = s.sales_id
join items i on i.item_id = o.item_id
where c.age between 18 and 35
group by c.customer_id, i.item_name
having Quantity > 0
order by c.customer_id

