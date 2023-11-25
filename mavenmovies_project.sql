/*--1)Display the actors name in Capital letters--*/

select upper(first_name),upper(last_name)
from actor;

/*--2)Display all films whose title length is greater than 10 characters--*/

select * from film
where length(title)>10; .

/*--3)Display the first eight characters of the film title--*/

select substring(title,1,8) as lenth8
from film;

/*--4)Combine first name and last name of all actors and display with a ‘-’ between them--*/

select concat(first_name,'_',last_name) as NAME
from actor;

/*--5)What is the smallest rental duration--*/

 select film_id,title,min(rental_duration) as Smallest 
 from film;

/*--6)What is the highest replacement cost amongst all the films--*/
 
 select film_id,title,max(distinct(rental_duration)) as Smallest 
 from film;

/*--7)What is the average length of the movie--*/

select film_id,title,avg(length) from film;

/*--8)How many films did the actor with actor id 1 work in ?--*/

select count(*) from film_actor where actor_id=1;

/*--9)What is the total replacement cost of the movies whose rating is G--*/

select sum(replacement_cost) from film
where rating= 'G';

/*--10)Given a date '2023-03-23', write the query to add 10 days to it.--*/

select date_add('2023-03-23',interval 10 day);

/*--11)Display the first 10 records from customer table--*/

select * from customer
limit 10;

/*--12)Display the first 3 records from the customer table whose first name starts with ‘b’.--*/

select * from customer
where first_name like 'b%' limit 3;

/*--13)Display the names of the first 5 movies which are rated as ‘G’--*/

select title,rating from film
where rating = 'G' limit 5;

/*--14)Find all customers whose first name starts with "a"--*/

select * from customer
where first_name like 'a%';


/*--15)Display the list of first 4 cities which start and end with ‘a’--*/

SELECT * FROM city
where city like 'a%a';

/*--16)Find all customers whose first name have "NI" in any position--*/

select * from customer
where first_name like '%NI%';

/*--17)Find all customers whose first name have "r" in the second position--*/

select first_name from customer
where first_name like '_r%' ;

/*--18)Find all customers whose first name starts with "a" and are at least 5 characters in length--*/

select first_name from customer
where first_name like 'a%' and length(first_name)=5;


/*--19)Find all customers whose first name starts with "a" and ends with "o"--*/

select * from customer
where first_name like 'a%o';

/*--20)Pull a list of the first name, last name, and email of each customer in order to send a mailer to 
all your staff members to notify them regarding a management change.--*/

SELECT first_name,last_name, email from staff;

/*--21)Display all the cities in India--*/

select c.city 
from city c inner join country co
on c.country_id = co.country_id
where co.country = 'India';

/*--22)Display the names of actors and the names of the films they have acted in.--*/

select actor.first_name ,film.title from actor 
inner join film_actor on actor.actor_id=film_actor.actor_id
inner join film on film_actor.film_id = film.film_id;

/*--23)Display the film names and the category of the films they fall into.--*/

select film.title,category.name from film 
inner join film_category on film.film_id=film_category.film_id
inner join category on film_category.category_id=category.category_id;
 
 
 /*--24)Display the list of films, their actors where the length of the film is greater than 100 mins--*/

select film.title, actor.first_name
from film
inner join film_actor ON film.film_id = film_actor.film_id
inner join  actor ON film_actor.actor_id = actor.actor_id
where film.length > 100;

/*--25)Display all the actor’s names who worked in either Animation or Children movies--*/

SELECT  actor.first_name,category.name
FROM actor
inner join film_actor  ON actor.actor_id = film_actor.actor_id
inner join film_category  ON film_actor.film_id = film_category.film_id
inner join category ON film_category.category_id = category.category_id
WHERE category.name IN ('Animation', 'Children');

/*--26)Display the cities from India whose names start with ‘B’--*/

select * from city;
select * from country;

select city.city,country.country from city
inner join country on city.country_id = country.country_id
where country.country='India' and city.city like 'B%';

/*--27)Display all the customers whose name starts with A and lives in India--*/

select * from customer;
/*1.name  2.address_id*/
select * from address;
/*1.address_id 2.city_id*/
select * from city;
/*1.city_id 2.city 3.country_id*/
select * from country;
/*country_id 2.country_name*/

select customer.first_name,address.city_id,city.city,country.country from customer
inner join address on customer.address_id=address.address_id
inner join city on city.city_id=address.city_id
inner join country on country.country_id=city.country_id
where customer.first_name like 'A%' and  country.country='India';


/*--28)Display the count of addresses in Australia--*/

select * from address;
/*city_id*/
select * from city;
/*city_id county_id*/
select * from country;
/*country_id country*/

select count(address.address)/*,city.city,country.country*/ from address
inner join city on address.city_id=city.city_id
inner join country on city.country_id=country.country_id
where country='Australia';

/*--29)Display all number of films in the category ‘Action’--*/

select count(*) from film 
inner join film_category on film.film_id=film_category.film_id
inner join category on film_category.category_id=category.category_id
where category.name ='action';

/*--30)Display the names of customers who are from France--*/

select * from customer;
/*1.first_name  2.address_id*/

select customer.first_name AS NAME,country.country from customer
inner join address on customer.address_id=address.address_id
inner join city on address.city_id=city.city_id
inner join country on city.country_id=country.country_id
where country.country='France';

/*--31)Display all cities from India which start with the letter A--*/

select city.city,country.country from city
inner JOIN country on city.country_id=country.country_id
where country.country='India' and city.city like'A%' ;

/*--32)Display the names and addresses of the customer whose first name starts with ‘A’ from 
countries which starts with the letter ‘C‘ and are active.--*/

select * from customer;
/*name address_id*/
select * from address;
/*address_id  address   city_id*/
select * from city;
/*city_id   country_id*/
select * from country;
/*country_id   country_name*/

select customer.first_name,address.address,country.country,customer.active from customer
inner join address on customer.address_id=address.address_id
inner join city on address.city_id=city.city_id
inner join country on city.country_id=country.country_id
where customer.first_name like 'A%' and customer.active=1 and country.country like 'C%' ;

/*--33)Create a quick reference of a list of distinct titles and their descriptions available in inventory at 
store 2 to provide easy information about titles.--*/

select * from inventory;
select * from film;
select * from store;

select distinct film.title,film.description,inventory.store_id from inventory
inner join store on inventory.store_id=store.store_id
inner join film on  film.film_id=inventory.film_id
where inventory.store_id=2;


/*--34)/*List down the managers’ names at each store with the full address of each property*/

select staff.first_name,staff.last_name,address.address,address.district,city.city,country.country from staff
inner join store on staff.store_id=staff.store_id
inner join address on address.address_id=staff.address_id
inner join city on city.city_id=address.city_id
inner join country on country.country_id=city.country_id
where staff.staff_id=store.manager_staff_id;

/*--35)Provide list of each inventory item, including store_id, inventory_id, title, film’s rating, rental rate, and replacement cost--*/

select inv.inventory_id,inv.store_id,f.title,f.rating,f.rental_rate,f.replacement_cost from inventory inv
left  join film f  on inv.film_id=f.film_id;

/*--36)List of all customer names, which store they go to, active or inactive, full address--*/

select * from  customer;
/*first name  store_id*/
select * from store;
/*store_id address_id*/
select * from address;
/*address_id store_id*/

select customer.first_name,customer.last_name,customer.store_id,customer.active ,
address.address,address.district,
city.city,country.country
from customer
left join address on customer.address_id=address.address_id
left join city on address.city_id=city.city_id
left join country on city.country_id=country.country_id;

/*--37)Understand the replacement cost of your film — Identify replacement costs for films that are
1) least expensive to replace,
2) most expensive to replace, and
3) the average replacement cost of all the films in store.--*/

select * from film;
select min(replacement_cost) AS LEAST_EXPENSIVE_TO_REPLACE,
max(replacement_cost) AS MAX_EXPENSIVE_TO_REPLACE,
avg(replacement_cost) AVG_REPLACEMENT_COST from film;


/*--38).Write a SQL query to count the number of characters except for the spaces for each actor.
Return the first 10 actors' name lengths along with their names.--*/

/*1.length of character except space
2.first 10 actors name */

select concat(first_name,' ',last_name)  NAME,
length(trim(concat(first_name,last_name)))  LENGTH  
from actor limit 10;


/*--39).List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names.--*/

/*1.oscar awardees with their names
2.lenth of names*/

select * from actor;
/*actor_id  name*/
select * from actor_award;
/*actor_id   awards*/

select concat(a.first_name,' ',a.last_name)  NAME, length(concat(a.first_name,a.last_name)) LENGTH,
aw.awards AWARDS from actor  a
inner join actor_award aw on a.actor_id=aw.actor_id
where aw.awards like '%oscar%'
order by name asc;


/*--40)Find the actors who have acted in the film ‘Frost Head.’--*/

select * from film;
/*film_id   film_name*/
select * from film_actor;
/*film_id  actor_id*/
select * from actor;
/*actor_id   actor_name*/

select f.title MOVIE,
concat(a.first_name,' ',a.last_name) ACTORS_NAME from film f
inner join film_actor fa on f.film_id=fa.film_id
inner join actor a on fa.actor_id=a.actor_id
where f.title = 'Frost Head';


/*41.Pull all the films acted by the actor ‘Will Wilson.’*/

select * from actor;
/*actor_id   actor_name*/
select * from film_actor;
/*film_id  actor_id*/
select * from film;
/*film_id   film_name*/

select concat(a.first_name,' ',a.last_name) ACTOR,f.title MOVIE from actor a
inner join film_actor fa on a.actor_id=fa.actor_id
inner join film f on fa.film_id=f.film_id
where concat(a.first_name,' ',a.last_name) = 'Will Wilson';


/*42).Pull all the films which were rented and return them in the month of May.*/

select * from rental;
/*rental date   return_date   inventory_id*/
select * from inventory;
/*inventory_id    film_id*/
select * from film;
/*film_id  film_name*/

select f.title AS FILMS,rn.rental_date AS RENTAL_MAY,rn.return_date AS RETURN_MAY from film  f
inner join inventory iv on f.film_id=iv.film_id
inner join rental rn on iv.inventory_id=rn.inventory_id
where extract(month from rn.rental_date)=5 and extract(month from rn.return_date)=5; 


/*--43).Pull all the films with ‘Comedy’ category.--*/

select * from film;
/*films name    film_id*/
select * from film_category;
/*film_id    category_id*/
select * from category;
/*category_id   category name*/

select f.title FILM_NAME ,c.name CATEGORY from film f
inner join film_category fc on f.film_id=fc.film_id
inner join category c on fc.category_id=c.category_id
where c.name='Comedy';

/*--44).Write a SQL query to find the actors who played a role in the movie 'Annie IDENTITY’. Return all the fields of the actor table.--*/

select * from actor
where actor_id in (select actor_id from film_actor
where film_id=(select film_id from film
where title='Annie IDENTITY'));

/*--45).Which customer has the highest customer ID number, whose first name starts with an 'E' and has an address ID lower than 500?--*/

select first_name,last_name,address_id from customer
where first_name regexp '^E' and address_id in (select address_id from address where address_id<500)
order by customer_id desc limit 1;


/*--46).Find the customers who paid a sum of 100 dollars or more, for all the rentals taken by them.--*/

select c.first_name, c.last_name, sum(amount) from payment p
inner join customer c on c.customer_id = p.customer_id
group by c.customer_id
having sum(amount) > 100
order by sum(amount) desc;


/*--47).Construct a query against the film table that uses a filter condition with a noncorrelated subquery 
against the category table to find all action films.--*/

select title from film
where film_id in (select film_id from film_category
where category_id=(select category_id from category
where name='action'));

/*--48)Write a query to group the rental data by customer_id.--*/

select * from rental
group by customer_id;


/*--49)Modify the above query to order the customers based on the number of rentals in descending order.--*/

select customer_id ,count(*) num_of_rental from rental
group by customer_id
order by  num_of_rental desc;

/*--50)Write a query to count the number of payments made by each customer. Show the customer id, the number of rentals and 
the total amount paid for each customer.--*/

select customer_id,rental_id,count(payment_id) num_of_payment,sum(amount) total_amount_paid from payment
group by customer_id
order by total_amount_paid desc;


/*--51)Using roll up, modify the above query to find the total count for each distinct actor i.e. find the total number of 
films each actor has acted along with the count of different ratings.--*/

select fa.actor_id,f.rating,count(f.rating) from film_actor fa
inner join film f on fa.film_id=f.film_id
group by fa.actor_id,f.rating with rollup;

/*--52)Get the movies which has gold in its title.--*/
 
 select * from film 
 where title regexp 'gold';
 
 /*--53)Get the customer first and last name whose postal code starts with 9 and ends with 5.--*/

select c.first_name,c.last_name,a.postal_code from customer c
inner join address  a on c.address_id=a.address_id
where a.postal_code regexp '^9.*5$';

/*--54)Get the films which are based on the subject ‘student’.--*/
	
select * from film
where description regexp 'student';

/*--55)Find the customers whose last name does not contain w, j and b characters --*/
 
 select * from customer
 where last_name not regexp '[wjb]'; 


/*--56)Find the customers whose address starts with 1 and ends with parkway--*/

select c.first_name,c.last_name,a.address from customer c
inner join address  a on c.address_id=a.address_id
where a.address regexp '^1.*parkway$';

/*--57)Construct a query against the film table that uses a filter condition with a noncorrelated subquery against 
the category table to find all Horror films.--*/

 select * from film
 where film_id in (SELECT film_id FROM film_category where category_id=11);


/*--58)Write a query that returns all cities that are not in China.--*/

select city  from  city
where country_id  IN (select country_id from country where country<>'China');


/*--59)Write a query that returns all cities that are in India or Pakistan.--*/

select * from  city
where country_id in (select country_id from country
where country IN ('India','Pakistan'));

/*--60)Write a query to find all customers who have never gotten a free film rental.
 (ie the zero amount paid for a rental). Use the all operator.--*/
 
 select * from customer
 where customer_ID <>ALL(
 select CUSTOMER_ID from payment
 where amount=0);
 
/*--61)Write a query to count the number of film rentals for each customer and the containing query then retrieves 
those customers who have rented exactly 30 films.--*/

select * from customer c
where (select count(*) from rental r where r.customer_id=c.customer_id)=30;

/*--62)Write a query to find all the customers who rented at least one film prior to 
June 01 2005 without regard for how many films were rented--*/

select * from customer c
where exists (select * from rental r where r.customer_id = c.customer_id and
date(r.rental_date) < '2005-06-01');

/*--63)Construct a query against the film table that uses a filter condition with a correlated subquery 
against the category table to find all Horror films.*/

select * from film f
where exists  (select fc.film_id from film_category fc
where f.film_id=fc.film_id and category_id=(select c.category_id from category c where fc.category_id=c.category_id and name='horror'));


/*--64)Write a query to find the names of all the customers who rented out a film that was
 also rented out by the customer with customer_id 20.--*/
 
select first_name,last_name from customer where customer_id in (
select distinct(rn.customer_id) as cust_id from inventory inv
join rental rn on inv.inventory_id=rn.inventory_id
where film_id in (select film_id from inventory
where inventory_id in (select inventory_id from rental
where customer_id=20))) and customer_id<>20;
 
 /*--65)Write a query to get each customer along with their total payments, number of payments and average payment--*/

with cte as
(select customer_id,sum(amount) as Total_Payment from payment
group by customer_id),
cte2 as
(select customer_id,count(amount) As No_Of_Payment from payment
group by customer_id),
cte3 as
(select customer_id,avg(amount) As avg_Payment from payment
group by customer_id)
select c.first_name,c1.Total_payment,c2.No_of_payment,c3.avg_payment from customer c
join cte c1 on c.customer_id=c1.customer_id
join cte2 c2 on c1.customer_id=c2.customer_id
join cte3 c3 on c2.customer_id=c3.customer_id;

/*--66)Write a query to create a single row containing the number of films based on the ratings (G, PG and NC17)--*/

SELECT
    COUNT(CASE WHEN rating = 'G' THEN 1 END) AS count_G,
    COUNT(CASE WHEN rating = 'PG' THEN 1 END) AS count_PG,
    COUNT(CASE WHEN rating = 'NC17' THEN 1 END) AS count_NC17
FROM
    film;

/*--66)Create a CTE with two named subqueries. The first one gets the actors with last names starting with s. 
The second one gets all the pg films acted by them. Finally show the film id and title.-*/

with cte as
(select actor_id from actor where last_name like 's%'),
cte2 as
(select film_id,title,rating from film where rating='PG')
select fa.film_id,c2.title from film_actor fa
join cte2 c2 on fa.film_id=c2.film_id
join cte c1 on fa.actor_id=c1.actor_id
order by fa.film_id ;

/*--67)Add one more subquery to the previous CTE to get the revenues of those movies--*/

with cte as
(select actor_id from actor where last_name like 's%'),
cte2 as
(select film_id,title,rating from film where rating='PG'),
cte3 as 
(SELECT inv.film_id,sum(p.amount) as revenue FROM inventory inv
inner join rental r on r.inventory_id=inv.inventory_id
inner join payment p on r.rental_id=p.rental_id
group by inv.film_id)
select fa.film_id,c2.title,c3.revenue from film_actor fa
join cte2 c2 on fa.film_id=c2.film_id
join cte c1 on fa.actor_id=c1.actor_id
join cte3 c3 on c2.film_id=c3.film_id
order by fa.film_id ;

/*--68)Write a query to find the titles of all the films that have never been rented out. --*/

select title from film
where film_id not in (
select distinct film_id from inventory
where inventory_id in (select inventory_id from rental));


/*--69)Add one more subquery to the previous CTE(in 67 question) to get the revenues generated by these actors--*/

with cte as
(select actor_id,first_name,last_name from actor where last_name like 's%'),
cte2 as
(select film_id,title,rating from film where rating='PG'),
cte3 as 
(SELECT inv.film_id,sum(p.amount) as revenue FROM inventory inv
inner join rental r on r.inventory_id=inv.inventory_id
inner join payment p on r.rental_id=p.rental_id
group by inv.film_id)
select c1.first_name,c1.last_name ,sum(c3.revenue) as d from film_actor fa
join cte2 c2 on fa.film_id=c2.film_id
join cte c1 on fa.actor_id=c1.actor_id
join cte3 c3 on c2.film_id=c3.film_id
group by c1.first_name ,c1.last_name order by d desc;

/*--70)Find the films which are rented by both Indian and Pakistani customers. (Hint: You can use CTE’s)--*/

with india as(
select customer_id,inv.inventory_id,inv.film_id,f.title as title from rental rn
join customer_list csl on rn.customer_id=csl.id
join inventory inv  on rn.inventory_id=inv.inventory_id
join film f on inv.film_id=f.film_id where country='india'),
Pakistan as(
select customer_id,inv.inventory_id,inv.film_id,f.title as title from rental rn
join customer_list csl on rn.customer_id=csl.id
join inventory inv  on rn.inventory_id=inv.inventory_id 
join film f on inv.film_id=f.film_id where country='Pakistan')
select title from India intersect select title from Pakistan;

/*--71)Find the films (if any) which are rented by Indian customers and not rented by Pakistani customers.--*/

with india as(
select customer_id,inv.inventory_id,inv.film_id,f.title as title from rental rn
join customer_list csl on rn.customer_id=csl.id
join inventory inv  on rn.inventory_id=inv.inventory_id
join film f on inv.film_id=f.film_id where country='india'),
Pakistan as(
select customer_id,inv.inventory_id,inv.film_id,f.title as title from rental rn
join customer_list csl on rn.customer_id=csl.id
join inventory inv  on rn.inventory_id=inv.inventory_id 
join film f on inv.film_id=f.film_id where country='Pakistan')
select title from India except select title from pakistan;


 







