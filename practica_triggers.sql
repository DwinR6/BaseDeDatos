-----------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                Practica de Funciones - RB16022 - Edwin Noel Ramos Bonila                                             --
-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Indicacion: Mas abajo esta la practica de triggers



create table usuario(
    id_usuario serial primary key,
    nombre varchar(50) not null,
    usuario varchar(50) not null,
    password varchar(50) not null,
    email varchar(50) not null
);

create table sesion(
    id_sesion serial primary key,
    id_usuario integer references usuario(id_usuario),
    fecha_ingreso date default now(),
    hora_ingreso time default now(),
    fecha_hora_logout timestamp default now()
);
create table acciones(
    id_accion serial primary key,
    id_sesion integer references sesion(id_sesion),
    accion varchar(50) not null
);

create table log (
    id_log serial primary key,
    id_sesion integer references sesion(id_sesion),
    nombre varchar(50) not null,
    fecha_ingreso date default now(),
    hora_ingreso time default now(),
);



insert into usuario(nombre, usuario, password, email) values('Kenia Hernandez', 'keniaH', '123', 'keniah@gmail.com');
insert into usuario(nombre, usuario, password, email) values('Luis Gustavo', 'luisG', '123', 'luisG@gmail.com');
insert into usuario(nombre, usuario, password, email) values('Juan Luis', 'juanL', '123', 'juanL@gmail.com');
insert into usuario(nombre, usuario, password, email) values('Carmen Maria', 'carmenM', '123', 'carmenM@gmail.com');
insert into usuario(nombre, usuario, password, email) values('Fermina Olivia', 'ferminaO', '123', 'ferminaO@gmail.com');
insert into usuario(nombre, usuario, password, email) values('Juan Hector', 'juanH', '123', 'juanH');
insert into usuario(nombre, usuario, password, email) values('Marilin Olimpia', 'marilinO', '123', 'marilinO');
insert into usuario(nombre, usuario, password, email) values('Brenda Liliana', 'brendaL', '123', 'brendaL');
insert into usuario(nombre, usuario, password, email) values('Hector Danilo', 'hectorD', '123', 'hectorD');
insert into usuario(nombre, usuario, password, email) values('Steffany Carolina', 'steffanyC', '123', 'steffanyC');
insert into usuario(nombre, usuario, password, email) values('Larissa de la Paz', 'larissaP', '123', 'larissaP');


insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(1, '2022-01-01', '04:40:00', '2022-01-01 04:59:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(2, '2022-01-01', '05:30:00', '2022-01-01 05:59:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(3, '2022-01-01', '12:20:00', '2022-01-01 03:40:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(4, '2022-01-01', '11:10:00', '2022-01-01 01:59:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(5, '2022-01-01', '03:50:00', '2022-01-01 04:10:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(6, '2022-01-01', '09:50:00', '2022-01-01 11:47:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(7, '2022-01-01', '04:20:00', '2022-01-01 05:59:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(8, '2022-01-01', '10:40:00', '2022-01-01 11:59:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(9, '2022-01-01', '10:45:00', '2022-01-01 12:40:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(10, '2022-01-01', '09:40:00', '2022-01-01 02:59:00');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(11, '2022-01-01', '09:40:00', '2022-01-01 02:59:00');


insert into acciones(id_sesion, accion) values(1, 'Creo el archivo kenia.txt');
insert into acciones(id_sesion, accion) values(1, 'Agrego 30 palabras nuevas en kenia.txt');
insert into acciones(id_sesion, accion) values(1, 'Corrigio la ortografia de kenia.txt');
insert into acciones(id_sesion, accion) values(1, 'Elimino la palabra que no se usa en kenia.txt');
insert into acciones(id_sesion, accion) values(2, 'Creo el archivo luis.txt');
insert into acciones(id_sesion, accion) values(2, 'Agrego 400 palabras nuevas en luis.txt');
insert into acciones(id_sesion, accion) values(2, 'Corrigio la ortografia de luis.txt');
insert into acciones(id_sesion, accion) values(2, 'Elimino la palabra que no se usa en luis.txt');
insert into acciones(id_sesion, accion) values(3, 'Creo el archivo juan.txt');
insert into acciones(id_sesion, accion) values(3, 'Agrego 500 palabras nuevas en juan.txt');
insert into acciones(id_sesion, accion) values(3, 'Corrigio la ortografia de juan.txt');
insert into acciones(id_sesion, accion) values(3, 'Elimino la palabra que no se usa en juan.txt');
insert into acciones(id_sesion, accion) values(4, 'Creo el archivo carmen.txt');
insert into acciones(id_sesion, accion) values(4, 'Agrego 600 palabras nuevas en carmen.txt');
insert into acciones(id_sesion, accion) values(4, 'Corrigio la ortografia de carmen.txt');
insert into acciones(id_sesion, accion) values(4, 'Elimino la palabra que no se usa en carmen.txt');
insert into acciones(id_sesion, accion) values(5, 'Creo el archivo fermina.txt');
insert into acciones(id_sesion, accion) values(6, 'Creo el archivo jose.txt');
insert into acciones(id_sesion, accion) values(7, 'Creo el archivo marilin.txt');
insert into acciones(id_sesion, accion) values(8, 'Creo el archivo brenda.txt');
insert into acciones(id_sesion, accion) values(9, 'Creo el archivo hector.txt');
insert into acciones(id_sesion, accion) values(10, 'Creo el archivo steffany.txt');
insert into acciones(id_sesion, accion) values(11, 'Creo el archivo larissa.txt');


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                              Ejercicio 1. Vist de Usuarios que estuvieron conectados mas de una hora en cualquier dia de 2022                                             --
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
create materialized view connected_users as
select nombre, email, fecha_ingreso, hora_ingreso, fecha_hora_logout
from usuarioedwin123

inner join sesion on usuario.id_usuario = sesion.id_usuario
where ((
        extract(hour from fecha_hora_logout) * 60 + 
        extract (minute from fecha_hora_logout)) - (
        extract (hour from hora_ingreso) * 60 + 
        extract (minute from hora_ingreso)

    )) > 60 and extract(year from fecha_ingreso) = '2022';




select * from connected_users;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                   Ejercicio 2. Funcion que escriba en mensaje las acciones realizadas por un usuario dado su id y una fecha                                      --
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create function get_user_actions(id_usuario integer, fecha date) returns void as $$
$
    declare
        rw record;
        usr alias for $1;
        fecha alias for $2;
        
        begin
            for rw in select nombre, hora_ingreso,  fecha_hora_logout as fecha_desconexion, string_agg(accion, ', ') as acciones
                from usuario
                inner join sesion on usuario.id_usuario = sesion.id_usuario
                inner join acciones on sesion.id_sesion = acciones.id_sesion
                where sesion.id_usuario = usr and fecha = fecha
                group by nombre, hora_ingreso, fecha_hora_logout loop
                
                    raise notice '% se conectó a las % y realizó las acciones: ', rw.nombre, rw.hora_ingreso, rw.acciones;                    

            end loop;
        end;
$$ language plpgsql;



select * from get_user_actions(1, '2022-01-01');




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--                                                Practica Triggers - Edwin Noel Ramos Bonilla                                                                                 --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Using triggers. 
-- Si una sesión ocurre después de las 18:59:59 pm insertar en una vista log_tmp(id_sesion, nombre, hora_ingreso, fecha_ingreso) 
-- Si la sesion ocurre antes de las 18:59:59 pm insertar en una table  log(id_sesion, nombre, hora_ingreso, fecha_ingreso)





--vista para los log 
create view log_tmp as select id_sesion, nombre, hora_ingreso, fecha_ingreso
from usuario
inner join sesion on usuario.id_usuario = sesion.id_usuario 
group by id_sesion, nombre, hora_ingreso, fecha_ingreso;


-- Trigger para guardar en vista log_tmp o en tabla log.
create trigger insert_logs_trigger
after insert on sesion
for each row
execute procedure insert_log();


-- Funcion para insertar en la vista log_tmp o en la tabla log.
create or replace function insert_log() returns trigger as 
$$
    declare
        rw record;
        hora time := new.hora_ingreso;
        begin   
            for rw in select id_sesion, nombre, hora_ingreso, fecha_ingreso
                from usuario
                inner join sesion on usuario.id_usuario = sesion.id_usuario 
                where id_sesion = new.id_sesion loop

                    if(hora > '18:59:59') then
                        insert into log_tmp(id_sesion, nombre, hora_ingreso, fecha_ingreso)
                        values(rw.id_sesion, rw.nombre, rw.hora_ingreso, rw.fecha_ingreso);
                    else
                        insert into log(id_sesion, nombre, hora_ingreso, fecha_ingreso)
                        values(rw.id_sesion, rw.nombre, rw.hora_ingreso, rw.fecha_ingreso);
                    end if;
                    
                end loop;
                return new;
        end;
$$ language plpgsql;



create trigger insert_logs_tmp_trigger 
instead of insert on log_tmp
for each row
execute procedure insert_log_tmp();


create or replace function insert_log_tmp() returns trigger as
$$
    declare
        rw record;
        begin
            raise notice '% se conectó a las %', new.nombre, new.hora_ingreso;
        return new;
        end;
        
$$ language plpgsql;


--test triggers
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(1, '2022-01-07', '04:40:00', '2022-01-01 19:59:59');
insert into sesion(id_usuario, fecha_ingreso, hora_ingreso, fecha_hora_logout) values(3, '2022-01-06', '19:59:59', '2022-01-01 19:59:00'); 


select * from log_tmp;
select * from log;

