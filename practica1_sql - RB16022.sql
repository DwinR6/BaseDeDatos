
create table customers(
    customer_id smallserial,
    name varchar(50),
    primary key(customer_id)
);
create table orders(
    order_id smallserial,
    order_date date,
    customer_id smallserial,
    primary key(order_id),
    foreign key(customer_id) references customers(customer_id)
);
create table addresses(
    address_id smallserial,
    house_number varchar(50),
    municipality varchar(50),
    department varchar(50),
    country varchar(50),
    country_code varchar(50),
    reference varchar(255),
    customer_id int,
    primary key(address_id),
    foreign key(customer_id) references customers(customer_id)
);

create table articles(
    article_id smallserial,
    article_number int not null,
    name varchar(50),
    price real,
    primary key(article_id)
);

create table order_details(
    order_id smallserial,
    article_id smallserial,
    quantity smallint,
    primary key(order_id, article_id),
    foreign key(order_id) references orders(order_id),
    foreign key(article_id) references articles(article_id)
);


insert into customers(name) values('Pedro');
insert into customers(name) values('Alexia');
insert into customers(name) values('Carlos');

insert into addresses(house_number, municipality, department, country, country_code, reference, customer_id) values('1', 'Usulutan', 'Usulutan', 'El Salvador', '503', 'Calle 1', 1);
insert into addresses(house_number, municipality, department, country, country_code, reference, customer_id) values('2', 'Quelepa', 'San Miguel', 'El Salvador', '503', 'Calle 2', 2);
insert into addresses(house_number, municipality, department, country, country_code, reference, customer_id) values('3', 'Ciudad de Guatemala', 'Guatemala', 'Guatemala', '502', 'Calle 3', 3);

insert into articles (article_number, name, price) values(2501, 'Proteina', 50.0);
insert into articles (article_number, name, price) values(3607, 'Gatorade', 5.0);
insert into articles (article_number, name, price) values(5705, 'AMP', 0.75);
insert into articles (article_number, name, price) values(1130, 'Bamda Elasstica', 3.0);
insert into articles (article_number, name, price) values(4044, 'Agua Embotellada', 0.85);

insert into orders (order_date, customer_id) values('2022-03-23', 1);
insert into orders (order_date, customer_id) values('2022-03-22', 2);
insert into orders (order_date, customer_id) values('2022-03-22', 3);
insert into orders (order_date, customer_id) values('2022-04-22', 1);
insert into orders (order_date, customer_id) values('2022-04-25', 2);
insert into orders (order_date, customer_id) values('2022-04-26', 3);
insert into orders (order_date, customer_id) values('2022-05-01', 1);

insert into order_details (order_id, article_id, quantity) values(1, 1, 1);
insert into order_details (order_id, article_id, quantity) values(1, 2, 3);
insert into order_details (order_id, article_id, quantity) values(1, 3, 1);
insert into order_details (order_id, article_id, quantity) values(2, 4, 3);
insert into order_details (order_id, article_id, quantity) values(3, 5, 1);
insert into order_details (order_id, article_id, quantity) values(3, 1, 4);
insert into order_details (order_id, article_id, quantity) values(3, 2, 1);
insert into order_details (order_id, article_id, quantity) values(4, 3, 2);
insert into order_details (order_id, article_id, quantity) values(4, 4, 1);
insert into order_details (order_id, article_id, quantity) values(5, 5, 5);
insert into order_details (order_id, article_id, quantity) values(5, 1, 1);
insert into order_details (order_id, article_id, quantity) values(5, 2, 3);
insert into order_details (order_id, article_id, quantity) values(5, 3, 4);
insert into order_details (order_id, article_id, quantity) values(6, 4, 2);
insert into order_details (order_id, article_id, quantity) values(6, 5, 1);
insert into order_details (order_id, article_id, quantity) values(7, 1, 3);


select * from customers join orders on customers.customer_id = orders.customer_id join order_details on orders.order_id = order_details.order_id join articles on order_details.article_id = articles.article_id;

select * from order_details join orders on order_details.order_id = orders.order_id join articles on order_details.article_id = articles.article_id join customers on orders.customer_id = customers.customer_id where extract(month from orders.order_date) = 03;


select customers.name, orders.order_date, sum(order_details.quantity * articles.price) as total from order_details join orders on order_details.order_id = orders.order_id join articles on order_details.article_id = articles.article_id join customers on orders.customer_id = customers.customer_id where extract(month from orders.order_date) = 03 GROUP BY customers.name, orders.order_date;

----------------------------------------------daily order_detail summary using left join----------------------------------------------------

select orders.order_id, customers.name, orders.order_date, sum(order_details.quantity * articles.price) as total_order, string_agg(articles.name, ',') as articles_list
from orders
inner join customers
on orders.customer_id = customers.customer_id
left join order_details
on orders.order_id = order_details.order_id
left join articles
on order_details.article_id = articles.article_id
group by orders.order_id, customers.name, orders.order_date;
order by orders.order_id;

------------------------------------------------------explicacion del funcionamiento de join-------------------------------------------------------

select 
orders.order_id, ----------------- aqui seleccionamos los campos de la tabla orders
customers.name, ----------------- aqui seleccionamos los campos de la tabla customers
sum(
    order_details.quantity * articles.price ---------------------- obtenemos la cantidad de articulos multiplicada por el precio del articulo
) as total_order, -------------------------al resultado de la funcion sum se le asigna el nombre total_order
string_agg(
    articles.name, ',' -------------------------obtenemos una lista de articulos separados por comas
) as articles_list -------------------------al resultado de la funcion string_agg se le asigna el nombre articles_list

from orders ------------------------- de la tabla orders obtendremos el order_id y el order_date
inner join customers ------------------------- la tabla orders tiene una relacion con customers, por lo tanto, obtenemos dicha relacion con inner join
on orders.customer_id = customers.customer_id --------sabemos que el customer_id de la tabla orders es igual al customer_id de la tabla customers, por lo tanto, obtenemos dicha relacion con inner join
left join order_details ------------------------- necesitamos el order_id de la tabla order_details, por lo tanto, obtenemos dicha relacion con left join
on orders.order_id = order_details.order_id ------------------------- sabemos que el order_id de la relacion que se obtuvo en el paso anterior es igual al order_id de la tabla order_details, por lo tanto, obtenemos dicha relacion con left join
left join articles ------------------------- necesitamos el article_id de la tabla articles, por lo tanto, obtenemos dicha relacion con left join
on order_details.article_id = articles.article_id ------------------------- sabemos que el article_id de la relacion que se obtuvo en el paso anterior es igual al article_id de la tabla articles, por lo tanto, obtenemos dicha relacion con left join
group by orders.order_id, customers.name, orders.order_date ------------------------- agrupamos por order_id, name y order_date porque 
order by orders.order_id; ------------------------- ordenamos por order_id

-----------------------------------------uso de group by 
