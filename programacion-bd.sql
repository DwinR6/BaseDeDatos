-----------------views on psql-----------------------------------------------------
--Que son las vistas?----------
--Las vistas son una forma de agregar información a una base de datos.
--Por ejemplo, si tenemos una tabla de estudiantes y una tabla de notas,
--podemos crear una vista que contenga toda la información de estudiantes y notas.

-- sirven como snapshots de la base de datos. 

--Tipos de vistas: 
-- 1. Materialized views
-- 2. Temporary views
-- 3. External tables

---diferencia entre materialized views y temporary views 
-- materialized views: se crean y se mantienen en memoria, no se borran. Se pueden usar en cualquier momento. Se usa refresh para actualizar.
-- temporary views: se crean y se borran.

--Como se crean las vistas?
--Sentencia SQL:
 create view notas as select * from nota where codigo_materia = 'MT001';
 create view notas2 as select * from nota where codigo_materia = 'FA001';

 --temporary views:
    create temporary view notas as select * from nota where codigo_materia = 'MT001';
    create temporary view notas2 as select * from nota where codigo_materia = 'FA001';

    --materialized views:
    create materialized view notas as select * from nota where codigo_materia = 'MT001';
    create materialized view notas2 as select * from nota where codigo_materia = 'FA001';


---------------programacion----------------
do $$
    begin
         raise notice 'hola';
    end;
$$;

do $$
    declare v_carnet varchar:= 'JL34500';
    declare v_nota int:= 10;

    begin
         raise notice 'la nota del estudiante % = %', v_carnet, v_nota; 
    end;
$$;



do $$

    rw record;

    begin
        for rw in select * from estudiante loop
            raise notice 'El estudiante %, tiene el carnet %', rw.nombres, rw.carnet;
        end loop;
    end;
$$;


do $$

    rw record;

    begin
        for rw in select * from estudiante loop
            if rw.codigo_carrera = 'SI105' then 
                raise notice 'El estudiante %, tiene el carnet % y es de sistemas', rw.nombres, rw.carnet;
            else 
                raise notice 'El estudiante %, tiene el carnet % y no es de sistemas', rw.nombres, rw.carnet;
            end if;
        end loop;
    end;
$$;


do $$

    rw record;

    begin
        for rw in select * from estudiante loop
            if rw.codigo_carrera = 'SI105' then 
                raise notice 'El estudiante %, tiene el carnet % y es de sistemas', rw.nombres, rw.carnet;
            elsif rw.codigo_carrera = 'FA105' then
                raise notice 'El estudiante %, tiene el carnet % y es de Administracion ', rw.nombres, rw.carnet;
            else
                raise notice 'El estudiante %, tiene el carnet % y no se conoce su carrera', rw.nombres, rw.carnet;
            end if;
        end loop;
    end;
$$;



create function print(varchar) returns void as $$
    declare 
        carnet alias for $1;
        rw record;
    begin
        for rw in select * from estudiante where carnet = carnet loop
            if 
        end loop;
    end;
$$ language 'plpgsql';


print('SI105');



create function suma(x integer, y integer, out suma integer, out mult integer) returns record as $$
    begin
        suma = x + y;
        mult = x * y;
    end;
$$ language 'plpgsql';

select * from suma(5, 2);

('HJ09003',	'Juan Antonio',	'Hidalgo Jiménez', '1995',	'4',	'1',	'M',	'hj@mail.com',	'SI505'),
            ('GH10114',	'Kenia Guadalupe',	'Gómez Hernández',	'1996',	'8',	'13',	'F',	'gh@mail.com',	'SI505'),
            ('MX30089',	'Mario Fernando',	'Milla Ximenez',	'1994',	'3',	'25',	'M',	'mx@mail.com',	'IC302'),
            ('AV04008',	'Claudia María',	'Álvarez Valdés',	'1999',	'11',	'16',	'F',	'av@mail.com',	'AE101'),
            ('BM12366',	'Mauro Antonio',	'Baltazar Milla',	'1993',	'2',	'2',	'M',	'bm@mail.com',	'AE101'),
            ('LS06998',	'Luis Gustavo',	'López Salazar',	'1992',	'1',	'30',	'M',	'ls@mail.com',	'SI505'),            
            ('JL34500',	'Juan Luis',	'López Martínez',	'1996',	'4',	'1',	'M',	'jl34500@gmail.com', 'IC302'),
            ('CM29302',	'Carmen María',	'Canales Martínez',	'1993',	'4',	'1',	'F',	'cm29302@gmail.com', 'IC302'),
            ('FH07663', 'Fermina Olivia', 'Fuentes Hernández', '1994', '4', '1', 'F', 'fh07663@gmail.com', 'SI505'),
            ('JH02376', 'Juan Héctor', 'Hernández Martínez', '1995', '4', '1', 'M', 'jh02376@gmail.com', 'AE101'),
            ('LR56762', 'Marilin Olimpia', 'López Recinos', '1996', '1', '16', 'F', 'lr56762@gmail.com', 'IC302'),
            ('PV06532', 'Brenda Liliana', 'Pineda Villatoro', '1995', '5', '11', 'F', 'pv06532@gmail.com', 'SI505'),
            ('BV08765', 'Hector Danilo', 'Benitez Villatoro', '1994', '5', '11', 'M', 'bv08765@gmail.com', 'IC302'),
            ('SC16023', 'Steffany Carolina', 'Santos Cardona', '1996', '5', '11', 'F', 'sc16023@gmail.com', 'AE101'),
            ('VO14087', 'Larissa de la Paz', 'Villatoro Ortez', '1995', '5', '11', 'F', 'vo14087@gmail.com', 'SI505');


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



----------------------------------materialized view to connected users where  hour from ((hora from fecha_hora_logout) - (hora from hora_ingreso)) > 1

create materialized view connected_users as
select nombre, email, fecha_ingreso, hora_ingreso, fecha_hora_logout
from usuario
inner join sesion on usuario.id_usuario = sesion.id_usuario
where ((
        extract(hour from fecha_hora_logout) * 60 + 
        extract (minute from fecha_hora_logout)) - (
        extract (hour from hora_ingreso) * 60 + 
        extract (minute from hora_ingreso)

    )) > 60 and extract(year from fecha_ingreso) = '2022';



-----------------------------------function to get actions from a user----------------------------------------
create  function get_actions_from_user(id_usuario integer, fecha date) returns void as 
$$
    declare
        rw record;
        usr alias for $1;
        fecha alias for $2;
        
        begin
            for rw in select * from acciones where id_sesion in (select sesion.id_sesion from sesion where sesion.id_usuario = usr and fecha_ingreso = fecha)
            loop
                raise notice '%', rw.accion;
            end loop;
        end;
$$ language plpgsql;

get_actions_from_user(1, '2022-01-01');

            
            --select accion from acciones where id_sesion 
            --in (select id_sesion from sesion where id_usuario = user and fecha_ingreso = fecha) 
            --group by id_usuario loop





create  function get_actions_from_user(id_usuario integer, fecha date) returns void as 
$$
    declare
        rw record;
        usr alias for $1;
        fecha alias for $2;
        
        begin
            for rw in select  fecha_hora_logout as hora_desconexion, string_agg(accion, ', ') as acciones 
                from acciones 
                inner join sesion 
                on acciones.id_sesion = sesion.id_sesion 
                where sesion.id_usuario = 1 and sesion.fecha_ingreso = fecha
                group by fecha_hora_logout loop
                
                    raise notice '%', rw.acciones;
                    

            end loop;raise notice '%', rw.hora_desconexion;
        end;
$$ language plpgsql;

------------------using inner join to get the actions from a user------------------------------
select nombre, hora_ingreso,  fecha_hora_logout as fecha_desconexion, string_agg(accion, '\n') as acciones
from usuario
inner join sesion on usuario.id_usuario = sesion.id_usuario
inner join acciones on sesion.id_sesion = acciones.id_sesion
where sesion.id_usuario = 1
group by nombre, hora_ingreso, fecha_hora_logout;




create function get_sesiones(id_usuario integer, fecha date) returns void as $$ 
    declare 
    usuario alias for $1;
    fecha alias for $2;
    rw record;
    begin
    for rw in select * from sesiones where sesiones.id_usuario = usuario and fecha_ingreso = fecha loop
        raise notice 'Relizo la siguiente accion % y salio de la sesion a las % ', rw.acciones_realizadas, rw.fecha_hora_logout;
    end loop;
    end;
$$ language plpgsql;


create function get_user_actions(id_usuario integer, fecha date) returns void as $$
$
    declare
        rw record;
        usr alias for $1;
        fecha alias for $2;
        
        begin
            for rw in select nombre, hora_ingreso,  fecha_hora_logout as fecha_desconexion, string_agg(accion, '\n') as acciones
                from usuario
                inner join sesion on usuario.id_usuario = sesion.id_usuario
                inner join acciones on sesion.id_sesion = acciones.id_sesion
                where sesion.id_usuario = usr
                group by nombre, hora_ingreso, fecha_hora_logout loop
                
                    raise notice '% se conectó a las % y realizó las acciones: ', rw.nombre, rw.hora_ingreso, rw.acciones;
                    

            end loop;
        end;
$$ language plpgsql;
