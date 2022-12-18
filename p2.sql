create table carrera (
    codigo_carrera char(5),
    año_pensum char(4),
    nombre varchar(30),
    PRIMARY KEY(codigo_carrera)
);

insert into carrera(codigo_carrera, año_pensum, nombre) values('SI505', '2019', 'Ing. de Sistemas Informáticos');
insert into carrera(codigo_carrera, año_pensum, nombre) values('IC302', '2009', 'Ing. Civil');
insert into carrera(codigo_carrera, año_pensum, nombre) values('AE101', '2014', 'Administración de Empresas');

create table estudiante (
    carnet char(8),
    nombres varchar(30),
    apellidos varchar(30),
    año_nacimiento char(4),
    mes_nacimiento char(4),
    dia_nacimiento char(4),
    genero char(1),
    email varchar(30),
    codigo_carrera char(5),
    PRIMARY KEY(carnet),
    FOREIGN KEY(codigo_carrera) REFERENCES carrera(codigo_carrera)
);

insert into estudiante(carnet, nombres, apellidos, año_nacimiento, mes_nacimiento, dia_nacimiento, genero, email, codigo_carrera)
            values
            ('HJ09003',	'Juan Antonio',	'Hidalgo Jiménez', '1995',	'4',	'1',	'M',	'hj@mail.com',	'SI505'),
            ('GH10114',	'Kenia Guadalupe',	'Gómez Hernández',	'1996',	'8',	'13',	'F',	'gh@mail.com',	'SI505'),
            ('MX30089',	'Mario Fernando',	'Milla Ximenez',	'1994',	'3',	'25',	'M',	'mx@mail.com',	'IC302'),
            ('AV04008',	'Claudia María',	'Álvarez Valdés',	'1999',	'11',	'16',	'F',	'av@mail.com',	'AE101'),
            ('BM12366',	'Mauro Antonio',	'Baltazar Milla',	'1993',	'2',	'2',	'M',	'bm@mail.com',	'AE101'),
            ('LS06998',	'Luis Gustavo',	'López Salazar',	'1992',	'1',	'30',	'M',	'ls@mail.com',	'SI505');

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


        update nota set nota = 



