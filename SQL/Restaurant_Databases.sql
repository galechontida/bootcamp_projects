--table1
create table wineliste (
	wine_id INT PRIMARY key,
	name text,
  wine_year int,
  size real,
  price real
);

INSERT into wineliste VALUES
	(1,'Gewürztraminer & Riesling',2019,0.75,5.80),
  (2,'Rosé feinherb',2020,0.75,5.80),
  (3,'Gewürztraminer Auslese',2018,0.75,7.60),
  (4,'Riesling',2021,0.75,5.20),
  (5,'Ruländer',2021,0.75,5.20),
  (6,'Kerner',2019,0.75,4.20),
  (7,'Gewürztraminer & Roter Riesling',2021,0.75,6.10),
  (8,'Roter Riesling trocken',2021,0.75,6.10),
  (9,'Grauer Burgunder trocken',2020,0.75,6.10),
  (10,'Spätburgunder Blanc de Noir',2020,0.75,6.10);

--table2
create table customers (
	customer_id INT PRIMARY key,
	firstname text,
  lastname TEXT,
  gender text,
  age int
);

insert into customers VALUES
	(1,'Noah','Zimmermann','M',25),
  (2,'Louis','Scholz','M',49),
  (3,'Mila','Hahn','F',29),
	(4,'Jonas','Keller','M',36), 
  (5,'Nora','Fischer','F',55),
  (6,'Fiona','Stein','F',31);

--table3
create table employee (
	employee_id INT PRIMARY key,
	name text,
  level text
);

INSERT into employee VALUES
	(1,'Andreas','Manager'),
  (2,'Kerstin','Staff'),
  (3,'Christian','Staff'),
  (4,'Chontida','Staff'),
  (5,'Iwona','Staff');
    
--table4
create table payment (
	payment_id INT PRIMARY key,
	methods text
);

INSERT INTO payment VALUES
	(1, 'Cash'),
	(2, 'Debit card'),
	(3, 'Credit card'),
	(4, 'Cryptocurrency');

--table5
create table orders (
	order_id int PRIMARY key,
  order_date text,
  customer_id int,
  wine_id int,
  quantity int,
  employee_id int,
  payment_id int,
  FOREIGN key (customer_id) REFERENCES customers(customer_id),
  FOREIGN key (wine_id) REFERENCES wineliste(wine_id),
 	FOREIGN key (employee_id) REFERENCES employee(employee_id),
  FOREIGN key (payment_id) REFERENCES payment(payment_id)
);

insert into orders VALUES
 (1,'2020-05-11',3,1,4,3,4),
 (2,'2020-06-16',1,2,2,2,1),
 (3,'2020-08-21',6,5,3,1,2),
 (4,'2020-08-27',3,10,2,1,3),
 (5,'2020-10-21',4,6,2,2,2),
 (6,'2020-10-28',2,7,3,5,1),
 (7,'2020-11-08',1,7,1,2,1),
 (8,'2020-12-10',5,8,2,3,1),
 (9,'2021-01-10',5,9,1,5,1),
 (10,'2021-04-15',1,5,1,2,2),
 (11,'2021-04-20',4,1,1,1,3),
 (12,'2021-07-15',5,1,2,3,4), 
 (13,'2021-12-25',1,3,2,5,1),
 (14,'2021-12-26',1,2,1,4,1),
 (15,'2022-01-03',6,7,1,4,3),
 (16,'2022-02-12',3,8,1,2,2),
 (17,'2022-03-11',4,10,2,1,2),
 (18,'2022-03-29',2,10,1,5,1),
 (19,'2022-04-05',1,8,1,2,1),
 (20,'2022-06-01',6,3,5,3,3);

.mode markdown
.header on
  
-- Top 3 Wine
SELECT 
	W.name as wine_name,
  sum(O.quantity) as bottle
from orders O
JOIN wineliste W on O.wine_id=W.wine_id
group by O.wine_id
ORDER by 2 DESC
LIMIT 3; 

-- Top customer in 2022
with order_2022 as (
  select 
  O.order_id,
  O.customer_id,
  C.firstname,
  C.lastname,
  STRFTIME('%Y',order_date) as 'year'
  from orders O JOIN customers C
  WHERE O.customer_id=C.customer_id 
  and STRFTIME('%Y',order_date)='2022'
)
select 
	firstname||' ' || lastname as customer_fullname,
	count(customer_id) as frequency
from order_2022
GROUP by customer_id
ORDER by frequency desc
limit 1; 

-- Total sales in EUR by employee
SELECT 
    E.name as Employee,
    round(sum(quantity*W.price),1) as Total_sale
from orders O
Join employee E on E.employee_id=O.employee_id
Join wineliste W on O.wine_id=W.wine_id
GROUP by E.employee_id
order by Total_sale desc
;

--Top payment methods
SELECT 
	P.methods as payment_methods,
	count(P.payment_id) as frequency
from orders O join payment P on O.payment_id=P.payment_id
group by P.payment_id;