CREATE TABLE Estudiante (
    cn CHAR(7) PRIMARY KEY,
    nombre VARCHAR(25),
    edad SMALLINT,

);

INSERT INTO Estudiante(cn, nombre, edad) 
 VALUES('MD15001','Monkey D. Luffy',17),
       ('SG09165','Son Gokú',18),
       ('LY18045','Light Yagami',16),
       ('EL16025','Elle Lawliet',20),
       ('IU11003','Itachi Uchiha',23);

CREATE TABLE Curso (
    cc SMALLSERIAL PRIMARY KEY,
    nombreCurso VARCHAR(20),

);

INSERT INTO Curso(nombreCurso) 
 VALUES('JavaScript'),
       ('PHP'),
       ('C++'),
       ('CCNA'),
       ('MTCNA'),
       ('Postgresql');

CREATE TABLE Inscripcion (
    cn CHAR(7),
    cc SMALLINT,
    fechaInscripcion DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY(cn,cc),
    FOREIGN KEY(cn) 
        REFERENCES Estudiante(cn) 
        ON DELETE CASCADE ON UPDATE CASCADE, 
        
    FOREIGN KEY(cc) 
        REFERENCES Curso(cc) 
        ON DELETE CASCADE ON UPDATE CASCADE
        
);

INSERT INTO Inscripcion(cn, cc) 
 VALUES('MD15001', 1),
       ('SG09165', 2),
       ('LY18045', 3),
       ('EL16025', 4),
       ('IU11003', 5),
       ('MD15001', 6);

alter table Inscripcion add constraint fk_inscripcion_estudiante foreign key (cn) references Estudiante(cn) on delete cascade on update cascade;

alter table Inscripcion add constraint fk_inscripcion_curso foreign key (cc) references Curso(cc) on delete cascade on update cascade;

------------------------------------------------------ 1 --------------------------------------------
 select * from Estudiante where nombre like 'S%' and nombre like '%ú';

------------------------------------------------------ 2 --------------------------------------------
 delete from Estudiante where edad > 20 and edad < 25;


------------------------------------------------------ 3 --------------------------------------------

 update Estudiante set cn = 'ME01001' where cn like 'M%' and edad < 18;


------------------------------------------------------ 4 --------------------------------------------

alter table Estudiante add column dui CHAR(10);

update Estudiante set dui = '05480412-1' where edad > 18;

