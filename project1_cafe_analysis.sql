-- Project 1: Cafe Sales & Profit Analysis

create database cafe_analysis;
Use cafe_analysis;
create table cafe_sales (
order_id int,
order_date date,
product varchar(50),
category varchar(20),
quantity int,
price int,
cost int,
payment_type varchar(20)
);
select* from cafe_sales;
insert into cafe_sales values
(1, '2025-10-02','Cappuccino','Beverages',2,180,90,'UPI'),
(2,'2025-10-02','Latte','Beverage',1,200,100,'Card'),
(3,'2025-10-03','Cold Coffee','Beverage',3,220,120,'UPI'),
(4,'2025-10-03','Chocolate Cake','Dessert',2,250,140,'Cash'),
(5,'2025-10-04','Grilled Sandwich','Food',2,300,180,'UPI'),
(6,'2025-10-05','Pasta','Food',1,350,220,'Card'),
(7,'2025-11-01','Cappuccino','Beverage',3,180,90,'UPI'),
(8,'2025-11-02','Latte','Beverage',2,200,100,'UPI'),
(9,'2025-11-02','Brownie','Dessert',2,220,130,'Cash'),
(10,'2025-11-03','Grilled Sandwich','Food',3,300,180,'Card'),
(11,'2025-11-04','Cold Coffee','Beverage',2,220,120,'UPI'),
(12,'2025-11-05','Pasta','Food',2,350,220,'UPI'),
(13,'2025-12-01','Cappuccino','Beverage',4,180,90,'Card'),
(14,'2025-12-02','Latte','Beverage',3,200,100,'UPI'),
(15,'2025-12-02','Chocolate Cake','Dessert',1,250,140,'Cash'),
(16,'2025-12-03','Brownie','Dessert',3,220,130,'UPI'),
(17,'2025-12-04','Grilled Sandwich','Food',1,300,180,'UPI'),
(18,'2025-12-05','Pasta','Food',3,350,220,'Card');
select* from cafe_sales;

-- Revenue and profit by product
select product,
sum(quantity * price) as total_revenue,
sum(quantity * (price-cost)) as total_profit
from cafe_sales
group by product
order by total_profit desc;

-- Revenue and profit by month
select date_format(order_date, '%Y-%m') as month,
sum(quantity * price) as total_revenue,
sum(quantity * (price-cost)) as total_profit
from cafe_sales
group by month
order by month;

-- Profit percenatge by product
select product,
round (sum(quantity * (price-cost)) * 100.0 / 
sum(quantity * price),
2 ) as profit_margin_percentage
from cafe_sales
group by product
order by profit_margin_percentage desc;
