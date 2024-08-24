SELECT * FROM swiggy 

--1 HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?

select count(distinct(restaurant_no)) 
from swiggy 
where rating >4.5 

--2 WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?

select city,count(distinct(restaurant_no)) 
from swiggy 
group by city 
order by count desc 
limit 1

--3 HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?

select count(distinct(restaurant_no)) 
from swiggy 
where restaurant_name like '%Pizza%'

--4 WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
with cte as 
(
select distinct restaurant_name ,cuisine 
from swiggy
)
select cuisine,count(1) 
from cte 
group by cuisine
order by count(1) desc

--5 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY

select city, avg(rating) as average_rating
from swiggy group by city;

--6 WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?

with cte as
(
select restaurant_no,restaurant_name,menu_category,item,price, 
dense_rank()over(partition by restaurant_name order by price desc ) as rnk
from swiggy 
where menu_category='Recommended'
order by restaurant_name
)
select distinct restaurant_name,item,price,rnk from cte where rnk=1

--The DISTINCT keyword ensures that only unique rows are returned, 
--meaning if there are duplicate rows with the same restaurant_name, item, price, and rnk, 
--only one of those duplicates will be included in the result.'''

--7) FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.

with cte as
(
select *,dense_rank()over(order by cost_per_person desc) as rnk
from swiggy 
where cuisine !='Indian' 
)
select distinct restaurant_name,cost_per_person,rnk
from cte where rnk <=5
order by rnk

--8)FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.

with cte as
(
select distinct restaurant_name,cost_per_person from swiggy order by cost_per_person -- all restaurants with cost_per_person
)
select * from cte where cost_per_person >(select avg(cost_per_person)from cte )


--9)RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARELOCATED IN DIFFERENT CITIES.

select distinct t1.restaurant_name,t1.city,t2.city
from swiggy t1 join swiggy t2 
on t1.restaurant_name=t2.restaurant_name and
t1.city!=t2.city;

--10)WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE'CATEGORY

with cte as
(
select distinct restaurant_name,menu_category,item from swiggy where menu_category ='Main Course'
)

select restaurant_name,count(1) 
from cte 
group by restaurant_name
order by count(1) desc

--11)LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME

select restaurant_name,(sum(case when veg_or_nonveg='Veg' then 1 end))*100/count(1) as pct
from swiggy 
group by restaurant_name
having (sum(case when veg_or_nonveg='Veg' then 1 end))*100/count(1)=100
order by restaurant_name

--12)WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS? 

with cte as
(
select restaurant_name ,avg(price),dense_rank()over(order by avg(price)asc) as rnk
from swiggy 
group by restaurant_name
)

select * from cte where rnk=1

--13) WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?

with cte as
(
select restaurant_name, count(distinct (menu_category))as ct,dense_rank()over(order by count(distinct (menu_category))desc ) as rnk
from swiggy
group by restaurant_name
)
select * from cte where rnk <=5

--14 WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?

select restaurant_name,(count(case when veg_or_nonveg='Non-veg' then 1 end))*100/count(1) as pct
from swiggy 
group by restaurant_name
order by pct desc


