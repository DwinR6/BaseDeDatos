------------------------------------------------------------------------------------------------------------------------------------------------------
--                                  practica Edwin Noel Ramos Bonilla                                                                               --
------------------------------------------------------------------------------------------------------------------------------------------------------

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
            ('LS06998',	'Luis Gustavo',	'López Salazar',	'1992',	'1',	'30',	'M',	'ls@mail.com',	'SI505');            
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
        ('PR001',	'VO14087')



--------------------------------insercion random de notas-------------------------------------------------------

 update nota set nota = floor(random() * (10 - 5 + 1) + 5) ;



----------------------------estudiantes que pasaron todas sus materias+----------------------------
select count(*) as aprobados from (
select e.carnet,
(select MIN(nota) from nota where codigo_materia = 'MT001' and carnet = e.carnet) as nota_mate_I,
(select MIN(nota) from nota where codigo_materia = 'FA001' and carnet = e.carnet) as nota_fisica_I,
(select MIN(nota) from nota where codigo_materia = 'PR001' and carnet = e.carnet) as nota_progra_I
from estudiante e) 
as notas where nota_mate_I > 6 and nota_fisica_I > 6 and nota_progra_I > 6;



------------------------------------estudiante que aprobaron todas las materias por genero------------------------------------
select genero, count(genero) as aprobados 
from (
    select e.carnet, e.genero as genero,
    (select MIN(nota) from nota where codigo_materia = 'MT001' and carnet = e.carnet) as nota_mate_I,
    (select MIN(nota) from nota where codigo_materia = 'FA001' and carnet = e.carnet) as nota_fisica_I,
    (select MIN(nota) from nota where codigo_materia = 'PR001' and carnet = e.carnet) as nota_progra_I
    from estudiante e
) as notas where nota_mate_I > 6 and nota_fisica_I > 6 and nota_progra_I > 6 group by genero;



-------------------------------------------numero de estudiantes por carrera y por genero----------------------------------------------
select carrera.nombre,
count(case estudiante.genero when 'F' then 'mujer' end) as Mujeres, 
count(case estudiante.genero when 'M' then 'hombres' end) as Hombres
from estudiante 
inner join carrera 
on carrera.codigo_carrera = estudiante.codigo_carrera
where carrera.codigo_carrera in('AE101','IC302','SI505')
group by carrera.nombre 
order by carrera.nombre;



--------------------------------------lista de estudiantes nacidos entre 1990 - 1995 y 1996 - 2000--------------------------------------
select * from estudiante where anio_nacimiento::int between 1990 and 1995 order by anio_nacimiento;

select * from estudiante where anio_nacimiento::int bteween 1996 and 2000 order  by anio_nacimiento;