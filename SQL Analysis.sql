##Set up the environments
use sales;

##Data Exploration
SELECT * FROM transactions
order by sales_amount asc; -- The sales_amount got negative amount, this could be data collection error
select count(*) from date;
select * from markets;
select * from transactions
where market_code in ("Mark097","Mark999"); -- Paris and NewYork could be new markets where no trnsaction has been done yet
select count(distinct(product_type)) as product_type_volume, count(distinct(product_code)) as product_code_volume
 from products;
 
 
##Data Analysis
#sales by year
select * from transactions limit 4;
select date_format(order_date,"%Y") as year,  sum(if(currency = "INR",sales_amount,sales_amount*74)) as sales
from  transactions
where sales_amount >=1
group by year;
#sales by market
select * from tr limit 4 ;
select b.markets_name as Market, sales
from
(select  market_code,  sum(if(currency = "INR",sales_amount,sales_amount*74)) as sales
from transactions
where sales_amount >=1
group by market_code) as a
inner join
markets as b 
on b.markets_code = a.market_code;



















