------------------ using postgresql --------------------------------------------------

se van explicar el uso de algunas funciones de postgresql


create table carrera (
    codigo_carrera char(5),
    anio_pensum char(4),
    nombre varchar(30),
    PRIMARY KEY(codigo_carrera)
);

insert into carrera(codigo_carrera, anio_pensum, nombre) values('SI505', '2019', 'Ing. de Sistemas Informáticos');
insert into carrera(codigo_carrera, anio_pensum, nombre) values('IC302', '2009', 'Ing. Civil');
insert into carrera(codigo_carrera, anio_pensum, nombre) values('AE101', '2014', 'Administración de Empresas');

create table estudiante (
    carnet char(8),
    nombres varchar(30),
    apellidos varchar(30),
    anio_nacimiento char(4),
    mes_nacimiento char(4),
    dia_nacimiento char(4),
    genero char(1),
    email varchar(30),
    codigo_carrera char(5),
    PRIMARY KEY(carnet),
    FOREIGN KEY(codigo_carrera) REFERENCES carrera(codigo_carrera)
);

insert into estudiante(carnet, nombres, apellidos, anio_nacimiento, mes_nacimiento, dia_nacimiento, genero, email, codigo_carrera)
            values
            

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

create table materia(
    codigo_materia char(5),
    nombre varchar(15),
    PRIMARY KEY(codigo_materia)
);

insert into materia(codigo_materia, nombre) values('MT001',	'Matemáticas I');
insert into materia(codigo_materia, nombre) values('FA001',	'Física I');
insert into materia(codigo_materia, nombre) values('PR001',	'Programación I');

create table nota(
    id_nota smallserial,
    codigo_materia char(5),
    nota smallint DEFAULT 0,
    carnet char(8),
    PRIMARY KEY(id_nota),
    FOREIGN KEY(codigo_materia) REFERENCES materia(codigo_materia),
    FOREIGN KEY(carnet) REFERENCES estudiante(carnet)
);

insert into nota(codigo_materia, carnet)
        values
        ('MT001',	'HJ09003'),
        ('FA001',	'HJ09003'),
        ('PR001',	'HJ09003'),
        ('MT001',	'GH10114'),
        ('FA001',	'GH10114'),
        ('PR001',	'GH10114'),
        ('MT001',	'MX30089'),
        ('FA001',	'MX30089'),
        ('PR001',	'MX30089'),
        ('MT001',	'AV04008'),
        ('FA001',	'AV04008'),
        ('PR001',	'AV04008'),
        ('MT001',	'BM12366'),
        ('FA001',	'BM12366'),
        ('PR001',	'BM12366'),
        ('MT001',	'LS06998'),
        ('FA001',	'LS06998'),
        ('PR001',	'LS06998'),
        ('MT001',	'JL34500'),
        ('FA001',	'JL34500'),
        ('PR001',	'JL34500'),
        ('MT001',	'CM29302'),
        ('FA001',	'CM29302'),
        ('PR001',	'CM29302'),
        ('MT001',	'FH07663'),
        ('FA001',	'FH07663'),
        ('PR001',	'FH07663'),
        ('MT001',	'JH02376'),
        ('FA001',	'JH02376'),
        ('PR001',	'JH02376'),
        ('MT001',	'LR56762'),
        ('FA001',	'LR56762'),
        ('PR001',	'LR56762'),
        ('MT001',	'PV06532'),
        ('FA001',	'PV06532'),
        ('PR001',	'PV06532'),
        ('MT001',	'BV08765'),
        ('FA001',	'BV08765'),
        ('PR001',	'BV08765'),
        ('MT001',	'SC16023'),
        ('FA001',	'SC16023'),
        ('PR001',	'SC16023'),
        ('MT001',	'VO14087'),
        ('FA001',	'VO14087'),
        ('PR001',	'VO14087');



------------uso de conflict------------------------------------------------------
insert into estudiante 
(carnet, nombres, apellidos, anio_nacimiento, mes_nacimiento, dia_nacimiento, genero, email, codigo_carrera)
 values 
('HJ09003', 'Juan Antonio', 'Hidalgo Jiménez', '1995', '4', '1', 'M', 'hj@gmail.com','SI505')
on conflict (carnet) do update set nombres = 'Juan Antonio', apellidos = 'Hidalgo Jiménez', anio_nacimiento = '1995', mes_nacimiento = '4', dia_nacimiento = '1', genero = 'M', email = '';

-------------------------uso de returning--------------------------------------------------------------------------
insert into estudiante (carnet, nombres, apellidos, anio_nacimiento, mes_nacimiento, dia_nacimiento, genero, email, codigo_carrera) values ('HJ09003', 'Juan Antonio', 'Hidalgo Jiménez', '1995', '4', '1', 'M', 'hj@gmil.com', 'SI505') returning carnet;


-------------------------uso de like/ilike------------------------------------------
select * from estudiante where nombres like 'J%';
select * from estudiante where nombres like '%4';
select * from estudiante where nombres like '%J%';

select * from estudiante where nombres ilike 'h%';
select * from estudiante where nombres ilike '%a';
select * from estudiante where nombres ilike '%H%';


--------------------------uso de is/is not------------------------------------------
select * from estudiante where nombres is null;
select * from estudiante where nombres is not null;




--------------------------uso de coalesce--------------------------------------------

select nombres, apellidos, coalesce(genero, 'Indefinido') from estudiante;

select * from estudiante where nombres = coalesce(nombres, 'Juan Antonio');
select * from estudiante where nombres = coalesce(nombres, 'Juan Antonio', 'Juan');






--------------------------uso de nullif---------------------------------------------
select nombres, apellidos, nullif(nombres, 'Juan Antonio') from estudiante;

select * from estudiante where nombres = nullif(nombres, 'Juan Antonio');






--------------------------uso de greatest---------------------------------------------
select greatest(1,2,3,4,5); --devuelve el mayor de los valores


----------------------------uso de least---------------------------------------------
select least(1,2,3,4,5); --devuelve el menor de los valores

--------------------------bloques anoniimos------------------------------------------

select *, case when año_nacimiento > 1995 then 'Joven' else 'Viejo' end from estudiante;


--------------------------uso de group by---------------------------------------------
select genero, avg(anio_nacimiento::int) from estudiante group by genero;
select codigo_carrera, count(codigo_carrera) from estudiante group by codigo_carrera;
select genero, anio_nacimiento, avg(anio_nacimiento::int), count(genero) from estudiante group by genero, anio_nacimiento;


----------agrupar personas cuyo año de nacimiento sea mayor a 1995 como promedio using having-------------------
select nombres, año_nacimiento from estudiante group by nombres, año_nacimiento having avg(año_nacimiento::int) > 1992 order by anio_nacimiento desc;


select * from (
select es.carnet, CONCAT(es.nombres, ' ', es.apellidos) as nombre_completo, car.nombre as nombre_carrera,
(select MIN(nota) from nota where codigo_materia = 'MT001' and carnet = es.carnet) as nota_mate_I,
(select MIN(nota) from nota where codigo_materia = 'FA001' and carnet = es.carnet) as nota_fisica_I,
(select MIN(nota) from nota where codigo_materia = 'PR001' and carnet = es.carnet) as nota_progra_I, 
ROUND((select AVG(nota) from nota where carnet = es.carnet)) as nota_ciclo
from estudiante es
inner join carrera car ON es.codigo_carrera = car.codigo_carrera
where car.codigo_carrera = 'SI505' or car.codigo_carrera = 'IC302' or car.codigo_carrera = 'AE101') 
as Datos where nota_mate_I < 6 OR nota_fisica_I < 6 OR nota_progra_I < 6;

select * from (
select es.carnet, CONCAT(es.nombres, ' ', es.apellidos) as nombre_completo, car.nombre as nombre_carrera,
(select MIN(nota) from nota where codigo_materia = 'MT001' and carnet = es.carnet) as nota_mate_I,
(select MIN(nota) from nota where codigo_materia = 'FA001' and carnet = es.carnet) as nota_fisica_I,
(select MIN(nota) from nota where codigo_materia = 'PR001' and carnet = es.carnet) as nota_progra_I, 
ROUND((select AVG(nota) from nota where carnet = es.carnet)) as nota_ciclo
from estudiante es
inner join carrera car ON es.codigo_carrera = car.codigo_carrera
where car.codigo_carrera = 'SI505' or car.codigo_carrera = 'IC302' or car.codigo_carrera = 'AE101') 
as Datos where nota_mate_I > 6 and nota_fisica_I > 6 and nota_progra_I > 6;

----------------numero de estudiantes donde la nota de matematica sea mayor a 6 ----------------------------
select genero, count(genero) from estudiante inner join nota on estudiante.carnet = nota.carnet where codigo_materia = 'MT001' and nota > 6 and  group by genero;


--------------------------numero estudiantes que aprobaron todas las materias----------------------------
select count(genero) from(
    (select nota from nota where codigo_materia = 'MT001' and carnet = es.carnet) as nota_mate_I
    (select nota from nota where codigo_materia = 'FA001' and carnet = es.carnet) as nota_fisica_I
    (select nota from nota where codigo_materia = 'PR001' and carnet = es.carnet) as nota_progra_i
    from estudiante es
    ) as notas where nota_mate_I > 6 and nota_fisica_I > 6 and nota_progra_i > 6 group by genero;


select genero, count(genero) as aprobados from (
select es.carnet, es.genero as genero,
(select MIN(nota) from nota where codigo_materia = 'MT001' and carnet = es.carnet) as nota_mate_I,
(select MIN(nota) from nota where codigo_materia = 'FA001' and carnet = es.carnet) as nota_fisica_I,
(select MIN(nota) from nota where codigo_materia = 'PR001' and carnet = es.carnet) as nota_progra_I
from estudiante es
inner join carrera car ON es.codigo_carrera = car.codigo_carrera
where car.codigo_carrera = 'SI505' or car.codigo_carrera = 'IC302' or car.codigo_carrera = 'AE101') 
as Datos where nota_mate_I > 6 and nota_fisica_I > 6 and nota_progra_I > 6 group by genero;

select count(*) from nota where nota.nota > 6 and codigo_materia = 'MT001';
select count(*) from nota where nota.nota > 6 and codigo_materia = 'FA001';
select count(*) from nota where nota.nota > 6 and codigo_materia = 'PR001';
select count(*) from nota where nota.nota >6;
select 16*3;

