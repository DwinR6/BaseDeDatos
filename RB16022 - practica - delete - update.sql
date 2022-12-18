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