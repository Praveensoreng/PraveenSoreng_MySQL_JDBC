create database ECommerce;
use ECommerce;
show tables;
----------------- creating tables in ECommerce database--------------------------
/*---supplier table---*/
create table supplier(
supp_id int primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null
);
describe supplier;

/*---customer table---*/
create table customer(
cus_id int primary key,
cus_name varchar(20) not null,
cus_phone varchar(10) not null,
cus_city varchar(30) not null,
cus_gender char
);
describe customer;

/*---category table---*/
create table category(
cat_id int primary key,
cat_name varchar(20) not null
);
describe category;

/*---Product table---*/
create table product(
pro_id int primary key,
pro_name varchar(20) not null default 'Dummy',
pro_desc varchar(60),
cat_id int,
constraint fk_category foreign key(cat_id) references category(cat_id)
);
describe product;

/*--- supplier_pricing table--*/
create table supplier_pricing(
pricing_id int primary key,
pro_id int,
supp_id int,
supp_price int default 0,
constraint fk_product foreign key(pro_id) references product(pro_id),
constraint fk_supplier foreign key(supp_id) references supplier(supp_id)
);
describe supplier_pricing;

/*---- orders table --- */
create table orders(
ord_id int primary key,
ord_amount int not null,
ord_date date not null,
cus_id int,
pricing_id int,
constraint fk_customer foreign key(cus_id) references customer(cus_id),
constraint fk_supplier_pricing foreign key(pricing_id) references supplier_pricing(pricing_id)
);
describe orders;

/*---rating table---*/
create table rating(
rat_id int primary key,
ord_id int,
rat_ratStars int not null,
constraint fk_orders foreign key(ord_id) references orders(ord_id)
);
describe rating;

----------------- inserting values in the table--------------------------
/*---supplier table---*/

insert into supplier values
(1,'Rajesh Retails','Delhi','1234567890'),
(2,'Appario Ltd.','Mumbai','2589631470'),
(3,'Knome products','Banglore','9785462315'),
(4,'Bansal Retails','Kochi','8975463285'),
(5,'Mittal Ltd.','Lucknow','7898456532');

/*---customer table---*/
insert into customer values
(1,'AAKASH','9999999999','DELHI','M'),
(2,'AMAN','9785463215','NOIDA','M'),
(3,'NEHA','9999999999','MUMBAI','F'),
(4,'MEGHA',9994562399,'KOLKATA','F'),
(5,'PULKIT','7895999999','LUCKNOW', 'M');

/*---category table---*/
insert into category values
(1,'BOOKS'),
(2,'GAMES'),
(3,'GROCERIES'),
(4,'ELECTRONICS'),
(5,'CLOTHES');

/*---Product table---*/
insert into product values
(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),
(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),
(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4),
(4,'OATS','Highly Nutritious from Nestle',3),
(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),
(6,'MILK','1L Toned MIlk', 3),
(7,'Boat Earphones','1.5Meter long Dolby Atmos', 4),
(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),
(9,'Project IGI','compatible with windows 7 and above',2),
(10,'Hoodie','Black GUCCI for 13 yrs and above',5),
(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1),
(12,'Train Your Brain','By Shireen Stephen',1);


/*--- supplier_pricing table--*/
insert into supplier_pricing values
(1,1,2,1500),
(2,3,5,30000),
(3,5, 1,3000),
(4,2, 3,2500),
(5,4,1,1000),
(6,12,2,780),
(7,12,4,789),
(8,3,1,31000),
(9,1,5,1450),
(10,4,2,999),
(11,7,3,549),
(12,7,4,529),
(13,6,2,105),
(14,6,1,99),
(15,2,5,2999),
(16,5,2,2999);
 
 /*---- orders table --- */
 insert into orders values
 (101,1500,'2021-10-06',2,1),
 (102,1000,'2021-10-12',3,5),
 (103,30000,'2021-09-16',5,2),
 (104,1500,'2021-10-05',1,1),
 (105,3000,'2021-08-16',4,3),
 (106,1450,'2021-08-18',1,9),
 (107,789,'2021-09-01',3,7),
 (108,780,'2021-09-07',5,6),
 (109,3000,'2021-09-10',5,3),
 (110,2500,'2021-09-10',2,4),
 (111,1000,'2021-09-15',4,5),
 (112,789,'2021-09-16',4,7),
 (113,31000,'2021-09-16',1,8),
 (114,1000,'2021-09-16',3,5),
 (115,3000,'2021-09-16',5,3),
 (116,99,'2021-09-17',2,14);
 
 /*---rating table---*/
 insert into rating values
 (1,101,4),
 (2,102,3),
 (3,103,1),
 (4,104,2),
 (5,105,4),
 (6,106,3),
 (7,107,4),
 (8,108,4),
 (9,109,3),
 (10,110,5),
 (11,111,3),
 (12,112,4),
 (13,113,2),
 (14,114,1),
 (15,115,1),
 (16,116,0);
 
 /*--- showing table contents---*/
 select * from supplier;
 select * from customer;
 select * from category;
 select * from product;
 select * from supplier_pricing;
 select * from orders;
 select * from rating;

/*------Queries-----*/
/*---Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.--*/

select c.cus_gender as gender,count(c.cus_gender) as 'total customers orders of worth at least Rs.3000'
from customer c inner join orders o
on c.cus_id  = o.cus_id
where o.ord_amount >= 3000
group by(c.cus_gender);

/*---Display all the orders along with product name ordered by a customer having Customer_Id=2---*/

select c.cus_id as customerID, c.cus_name as 'customer name',p.pro_name as 'ordered products name'
from customer c inner join orders o 
on c.cus_id = o.cus_id inner join supplier_pricing s
on s.pricing_id = o.pricing_id inner join product p
on p.pro_id = s.pro_id
where c.cus_id = 2;

/*---Display the Supplier details who can supply more than one product.---*/

select s.*,count(*) as 'no of products supplied'
from supplier s inner join supplier_pricing sp
on s.supp_id = sp.supp_id
group by(sp.supp_id ) having count(*) > 1 order by count(*);

/*---Create a view as lowest_expensive_product and display the least expensive product from each category and print the table with category id, name, product name and price of the product.---*/


select c.cat_name,c.cat_id,min(s.supp_price) as 'least expensive product'
from product p inner join category c
on c.cat_id = p.cat_id inner join supplier_pricing s
on s.pro_id = p.pro_id
group by c.cat_name,c.cat_id;




 /*---Display the Id and Name of the Product ordered after “2021-10-05”.---*/
 
 
 select pro_id as 'productID',pro_name as 'product name'
 from product
 where pro_id in(select pro_id from supplier_pricing where pricing_id 
                    in(select pricing_id from orders where  ord_date > '2021-10-05'));

/*---Display customer name and gender whose names start or end with character 'A'.---*/

select cus_name as 'customer name', cus_gender as 'gender'
from customer
where cus_name like 'A%' or cus_name like '%A';


/*---Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print
“Average Service” else print “Poor Service”. Note that there should be one rating per supplier.---*/

DELIMITER //
create procedure service_type()
begin
select s.supp_id,s.supp_name ,avg(r.rat_ratStars) as rating,
case 
when avg(r.rat_ratStars) = 5 then "Excellent Service"
when avg(r.rat_ratStars) > 4 then "Good Service"
when avg(r.rat_ratStars) > 2 then "Average Service"
else "Poor Service"
end as Type_of_Service
from customer c inner join orders o
on c.cus_id = o.cus_id inner join rating r
on r.ord_id = o.ord_id inner join supplier_pricing sp
on sp.pricing_id = o.pricing_id inner join supplier s
on s.supp_id = sp.supp_id
group by(s.supp_id) order by s.supp_id;
end //
DELIMITER ;
call service_type();