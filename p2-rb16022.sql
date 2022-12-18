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
            ('MN09876',	'Miguel Angel',	'Martínez Núñez',	'1995',	'4',	'1',	'M',	'mn09876@gmail.com',	'AE101');
            ('JL34500',	'Juan Luis',	'López Martínez',	'1995',	'4',	'1',	'M',	'jl34500@gmail.com', 'IC302');
            ('CM29302',	'Carmen María',	'Canales Martínez',	'1995',	'4',	'1',	'F',	'cm29302@gmail.com', 'IC302');

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
        ('PR001',	'LS06998');



---------------------ejercicio 1-----------------------------------------------------------
        update nota set nota = floor(random() * 10 + 1);

----------------------ejercicio 2--------------------------------------------------------
        select 
        estudiante.carnet, 
        concat(estudiante.nombres, estudiante.apellidos) as estudiante, 
        replace(age(replace(concat(estudiante.anio_nacimiento, '-', estudiante.mes_nacimiento,'-',estudiante.dia_nacimiento), ' ', '')::timestamp, current_date)::text, '-', '') as edad,
        carrera.nombre as carrera
        from estudiante
        inner join carrera 
        on carrera.codigo_carrera = estudiante.codigo_carrera
        group by estudiante.carnet, carrera.codigo_carrera;


      ------------------------devolver--------------------------
       select 
       estudiante.carnet, 
       concat(estudiante.nombres, estudiante.apellidos) as estudiante, 
       carrera.nombre as carrera,
       nota.nota as n
         from estudiante
            inner join carrera
            on carrera.codigo_carrera = estudiante.codigo_carrera
            inner join nota
            on nota.carnet = estudiante.carnet
            where nota.codigo_materia = 'MT001' and nota.nota >= 6 
            and nota.codigo_materia = 'FA001' and nota.nota >= 6
            and nota.codigo_materia = 'PR001' and nota.nota >= 6        
            order by nota.nota desc;
-- Mostrar la lista de estudiantes que pasaron todas sus materias con el siguiente formato: (carnet, nombre_completo, nombre_carrera, nota_mate_I, nota_fisica_I, nota_progra_I)


---mostrar le promedio de notas de todas las materias------------------
select
estudiante.carnet,
concat(estudiante.nombres, estudiante.apellidos) as estudiante,
carrera.nombre as carrera,
string_agg(nota.nota, ',') as notas

select * from crosstab('select carnet, materia, nota from nota')
as final_result(carnet text, materia text, nota int);

SELECT *
FROM crosstab( 'select student, subject, evaluation_result from evaluations order by 1,2')
     AS final_result(Student TEXT, Geography NUMERIC,History NUMERIC,Language NUMERIC,Maths NUMERIC,Music NUMERIC);



------------------------------------------estudiantes que dejaron alguna de las materias (carnet, estudiante, carreram nota_mate_i, nota_fisica_i, nota_progra_i-------------------------------------------------------
select DISTINCT estudiante.carnet, 

concat(estudiante.nombres , ' ' , estudiante.apellidos)  as estudiante, 

carrera.nombre as carrera,

(select nota.nota from nota where nota.codigo_materia = 'MT001' and nota.carnet = estudiante.carnet and nota.nota < 6) as nota_mate_I,

(select nota.nota from nota where nota.codigo_materia = 'FA001' and nota.carnet = estudiante.carnet and nota.nota < 6 ) as nota_fisica_I,

(select nota.nota from nota where nota.codigo_materia = 'PR001' and nota.carnet = estudiante.carnet and nota.nota < 6) as nota_progra_I,

avg(
    (SELECT nota.nota from nota where nota.codigo_materia = 'MT001' and nota.carnet = estudiante.carnet and nota.nota < 6)
    +(select nota.nota from nota where nota.codigo_materia = 'FA001' and nota.carnet = estudiante.carnet and nota.nota < 6)
    +(select nota.nota from nota where nota.codigo_materia = 'PR001' and nota.carnet = estudiante.carnet and nota.nota < 6)
) as promedio

from estudiante
INNER JOIN carrera ON carrera.codigo_carrera = estudiante.codigo_carrera
INNER JOIN nota ON nota.carnet = estudiante.carnet
WHERE nota.nota < 6

GROUP BY estudiante.carnet, carrera.nombre, nota.nota;


-------------------------------------ejercicio 3-------------------------------------------------------
select DISTINCT estudiante.carnet,
concat(estudiante.nombres , ' ' , estudiante.apellidos)  as estudiante,
carrera.nombre as carrera,
(select nota.nota from nota where nota.codigo_materia = 'MT001' and nota.carnet = estudiante.carnet and nota.nota >= 6) as nota_mate_I,
(select nota.nota from nota where nota.codigo_materia = 'FA001' and nota.carnet = estudiante.carnet and nota.nota >= 6 ) as nota_fisica_I,
(select nota.nota from nota where nota.codigo_materia = 'PR001' and nota.carnet = estudiante.carnet and nota.nota >= 6) as nota_progra_I
from estudiante
    inner join carrera
    on carrera.codigo_carrera = estudiante.codigo_carrera
    inner join nota
    on nota.carnet = estudiante.carnet
    where nota.codigo_materia = 'MT001' and nota.nota >= 6 
    and nota.codigo_materia = 'FA001' and nota.nota >= 6
    and nota.codigo_materia = 'PR001' and nota.nota >= 6 
    group by estudiante.carnet, carrera.codigo_carrera;



    SELECT * FROM (
SELECT es.carnet, CONCAT(es.nombres, ' ', es.apellidos) AS nombre_completo, car.nombre AS nombre_carrera,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'MT001' AND carnet = es.carnet) AS nota_mate_I,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'FA001' AND carnet = es.carnet) AS nota_fisica_I,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'PR001' AND carnet = es.carnet) AS nota_progra_I, 
ROUND((SELECT AVG(nota) FROM nota WHERE carnet = es.carnet)) AS nota_ciclo
FROM estudiante es
INNER JOIN carrera car ON es.codigo_carrera = car.codigo_carrera
WHERE car.codigo_carrera = 'SI505' or car.codigo_carrera = 'IC302' or car.codigo_carrera = 'AE101') 
AS Datos WHERE nota_mate_I > 6 OR nota_fisica_I > 6 OR nota_progra_I > 6;


SELECT * FROM (
SELECT es.carnet, CONCAT(es.nombres, ' ', es.apellidos) AS nombre_completo, car.nombre AS nombre_carrera,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'MT001' AND carnet = es.carnet) AS nota_mate_I,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'FA001' AND carnet = es.carnet) AS nota_fisica_I,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'PR001' AND carnet = es.carnet) AS nota_progra_I, 
ROUND((SELECT AVG(nota) FROM nota WHERE carnet = es.carnet)) AS nota_ciclo
FROM estudiante es
INNER JOIN carrera car ON es.codigo_carrera = car.codigo_carrera
WHERE car.codigo_carrera = 'SI505' or car.codigo_carrera = 'IC302' or car.codigo_carrera = 'AE101') 
AS Datos WHERE nota_mate_I > 6 and  nota_fisica_I > 6 and nota_progra_I > 6;


SELECT count(*) FROM (
SELECT es.carnet, CONCAT(es.nombres, ' ', es.apellidos) AS nombre_completo, car.nombre AS nombre_carrera,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'MT001' AND carnet = es.carnet) AS nota_mate_I,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'FA001' AND carnet = es.carnet) AS nota_fisica_I,
(SELECT MIN(nota) FROM nota WHERE codigo_materia = 'PR001' AND carnet = es.carnet) AS nota_progra_I, 
ROUND((SELECT AVG(nota) FROM nota WHERE carnet = es.carnet)) AS nota_ciclo
FROM estudiante es
INNER JOIN carrera car ON es.codigo_carrera = car.codigo_carrera
WHERE car.codigo_carrera = 'SI505' or car.codigo_carrera = 'IC302' or car.codigo_carrera = 'AE101') 
AS Datos WHERE nota_mate_I < 6 OR nota_fisica_I < 6 OR nota_progra_I < 6;