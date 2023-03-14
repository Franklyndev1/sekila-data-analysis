#Using the Sakila database answer the following:

#1. First, Last name and Email address of customers from Store

#2. movie with rental rate of $0.99

#3. Which rating do we have the most films in?

#4. Which rating is most prevalant in each store?

#5. List of films by Film Name, Category, Language

#6. Most Spending Customer so that we can send him/her rewards or debate points

-- solve 
use sakila;
#1. First, Last name and Email address of customers from Store
select first_name, last_name, email from customer c;

#2. movie with rental rate of $0.99
select * from film where rental_rate = "0.99";
select * from film;

#3. Which rating do we have the most films in?
select rating,count(*) from film group by rating;

#4. Which rating is most prevalant in each store?
select f.rating, s.store_id, count(f.film_id) from film f inner join inventory i
on f.film_id = i.film_id inner join store s on s.store_id = i.store_id
group by 1,2;

#5. List of films by Film Name, Category, Language
select f.title, c.name cate, l.name "language cate" from film f inner join film_category fc
on f.film_id = fc.film_id inner join category c on fc.category_id = c.category_id
join language l on f.language_id = l.language_id;

#6. Most Spending Customer so that we can send him/her rewards or debate points
select c.first_name, c.last_name, sum(p.amount) from customer c inner join payment p 
on p.customer_id = c.customer_id group by 1;

 