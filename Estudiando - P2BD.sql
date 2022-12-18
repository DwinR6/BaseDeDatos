----------------------------estudiando para parcial 2 de base de datos

-------------------------using postgresql-------------------------------

------------------------table cliente-------------------------------
create table cliente (
    id_cliente serial primary key,
    nombre_cliente varchar(50) not null 
);

------------------------table direccion cliente-------------------------------

create table direccion_cliente (
    id_cliente smallint not null,
    departamento varchar(50) not null,
    municipio varchar(50) not null,
    numero_casa smallint not null,
    codigo_pais smallint not null,
    primary key (id_cliente),
    foreign key (id_cliente) references cliente(id_cliente)
);


-------------------------table articulo-------------------------------

create table articulo (
    numero_articulo smallint not null,
    nombre varchar(50) not null,
    precio float not null,
    primary key(numero_articulo)
);

---------------------------table orden-------------------------------

create table orden (
    id_orden serial primary key,
    id_cliente smallint noct null,
    fecha_orden date not null,
    foreign key(id_cliente) references cliente(id_cliente)
);

---------------------------table detalle orden-------------------------------

create table detalle_orden (
    id_detalle_orden serial primary key,
    id_orden smallint not null,
    numero_articulo smallint not null,
    cantidad smallint not null,
    foreign key(id_orden) references orden(id_orden),
    foreign key(numero_articulo) references articulo(numero_articulo)
);

insert into cliente values (1101, 'Juan');
insert into cliente values (2003, 'Alexia');
insert into cliente values (3112, 'Carlos');

insert into direccion_cliente(codigo_pais, departamento, municipio, numero_casa, id_cliente) values (503, 'Usulutan', 'Usulutan', 123, 1101);
insert into direccion_cliente(codigo_pais, departamento, municipio, numero_casa, id_cliente) values (503, 'San Miguel', 'San Miguel', 123, 2003);
insert into direccion_cliente(codigo_pais, departamento, municipio, numero_casa, id_cliente) values (504, 'Guatemala', 'Guatemala', 123, 3112);

insert into articulo values (2501, 'Proteína', 10.0);
insert into articulo values (3607, 'Gatorade', 5.0);
insert into articulo values (5704, 'AMP', 0.75);
insert into articulo values (1130, 'Banda Elástica', 3.0);
insert into articulo values (4044, 'Agua Embotellada', 0.85);

insert into orden values (1201, 1101, '2022-03-23');
insert into orden values (1034, 2003, '2020-03-22');
insert into orden values (1145, 3112, '2020-03-22');

insert into detalle_orden(id_orden, numero_articulo, cantidad) values (1201, 2501, 2);
insert into detalle_orden(id_orden, numero_articulo, cantidad) values (1201, 3607, 1);
insert into detalle_orden(id_orden, numero_articulo, cantidad) values (1034, 3607, 1);
insert into detalle_orden(id_orden, numero_articulo, cantidad) values (1034, 5704, 1);
insert into detalle_orden(id_orden, numero_articulo, cantidad) values (1145, 3607, 1);
insert into detalle_orden(id_orden, numero_articulo, cantidad) values (1145, 4044, 1);


select * from cliente full join  orden on cliente.id_cliente = orden.id_cliente;


select cliente.nombre_cliente, orden.fecha_orden, sum(detalle_orden.cantidad * articulo.precio) as total from cliente full join orden on cliente.id_cliente = orden.id_cliente full join detalle_orden on orden.id_orden = detalle_orden.id_orden full join articulo on detalle_orden.numero_articulo = articulo.numero_articulo group by cliente.nombre_cliente, orden.fecha_orden;


----------------------------obtener el total de productos vendidos-------------------

select cons.* from (select numero_articulo, sum(cantidad) as cantidad from detalle_orden group by numero_articulo) as cons inner join articulo on cons.numero_articulo = articulo.numero_articulo;

------------------------------------format precio to euro----------------------------
select precio / 1.13 as precio_euro from articulo;