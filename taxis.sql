--------------------------------database to taxi service--------------------------------

create database taxi_service;

------------------------------table customers--------------------------------
create table customers(
    customer_id smallserial,
    name varchar(50),
    primary key(customer_id)
);

-------------------------------table drivers--------------------------------
create table drivers(
    driver_id smallserial,
    name varchar(50),
    primary key(driver_id)
);

----------------------------------trip--------------------------------------
create table trip(
    trip_id smallserial,
    trip_date date,
    driver_id smallserial,
    customer_id smallserial,
    start_date date,
    end_date date,
    primary key(trip_id),
    foreign key(driver_id) references drivers(driver_id),
    foreign key(customer_id) references customers(customer_id)
);

-------------------------------trip_info-------------------------------
create table trip_info(
    trip_id smallserial,
    address_id smallserial,
    trip_amount real,
    trip_distance real,
    trip_time real,
    primary key(trip_id, address_id),
    foreign key(trip_id) references trip(trip_id),
    foreign key(address_id) references addresses(address_id)
);

----------------------------------location---------------------------------
create table location(
    type varchar(50), ---------------initial location or final location (start | end | stop | intermediate)
    location_id smallserial,
    trip_id smallserial,
    latitude real,
    longitude real,
    primary key(location_id),
    foreign key(trip_id) references trip(trip_id)
);

----------------------------------payment-----------------------------------
create table payment(
    payment_id smallserial,
    trip_id smallserial,
    payment_date date,
    payment_type varchar(50),
    payment_amount real,
    primary key(payment_id),
    foreign key(trip_id) references trip(trip_id)
);

insert into customers(name) values('Pedro');
insert into customers(name) values('Alexia');
insert into customers(name) values('Carlos');
insert into customers(name) values('Juan');
insert into customers(name) values('Maria');
insert into customers(name) values('Jorge');
insert into customers(name) values('Luis');

insert into drivers(name) values('Melvin');
insert into drivers(name) values('Bryan');
insert into drivers(name) values('Albery');

insert into trip(trip_date, driver_id, customer_id) values('2022-03-23', 1, 1);
insert into trip(trip_date, driver_id, customer_id) values('2022-03-22', 2, 2);
insert into trip(trip_date, driver_id, customer_id) values('2022-03-21', 3, 3);
insert into trip(trip_date, driver_id, customer_id) values('2022-03-20', 3, 4);


insert into trip_info(trip_id, address_id, trip_amount, trip_distance, trip_time) values(1, 1, 8.60, 12, 15);
insert into trip_info(trip_id, address_id, trip_amount, trip_distance, trip_time) values(1, 2, 5.50, 8, 10);
insert into trip_info(trip_id, address_id, trip_amount, trip_distance, trip_time) values(1, 3, 3.50, 5, 7);
insert into trip_info(trip_id, address_id, trip_amount, trip_distance, trip_time) values(1, 4, 2.50, 3, 5);


insert into location(type, location_id, trip_id, latitude, longitude) values('start', 1, 1, -34.60, -58.38);
insert into location(type, location_id, trip_id, latitude, longitude) values('start', 2, 1, -44.60, -68.38);
insert into location(type, location_id, trip_id, latitude, longitude) values('start', 3, 1, -54.60, -45.38);
insert into location(type, location_id, trip_id, latitude, longitude) values('start', 4, 1, -64.60, -59.38);

insert into location(type, location_id, trip_id, latitude, longitude) values('end', 1, 1, -34.60, -58.38);
insert into location(type, location_id, trip_id, latitude, longitude) values('end', 2, 1, -44.60, -68.38);
insert into location(type, location_id, trip_id, latitude, longitude) values('end', 3, 1, -54.60, -45.38);
insert into location(type, location_id, trip_id, latitude, longitude) values('end', 4, 1, -64.60, -59.38);


insert into payment(payment_date, payment_type, payment_amount, trip_id) values('2022-03-23', 'cash', 8.60, 1);
insert into payment(payment_date, payment_type, payment_amount, trip_id) values('2022-03-22', 'cash', 5.50, 1);
insert into payment(payment_date, payment_type, payment_amount, trip_id) values('2022-03-21', 'cash', 3.50, 1);
insert into payment(payment_date, payment_type, payment_amount, trip_id) values('2022-03-20', 'cash', 2.50, 1);





