-------------------------------------------ejercicio 4-------------------------------------------------------
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
) as nota_ciclo

from estudiante
INNER JOIN carrera ON carrera.codigo_carrera = estudiante.codigo_carrera
INNER JOIN nota ON nota.carnet = estudiante.carnet
WHERE nota.nota < 6

GROUP BY estudiante.carnet, carrera.nombre, nota.nota;