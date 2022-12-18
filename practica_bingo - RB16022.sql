---------------juego de bingo RB16022 -------------

-------------tabla de juego de bingo -----------------

create table bingo(col1 int,col2 int,col3 int,col4 int);

---------------------insertar valor aleatorio entre 1 y 12 en cada campo ---------------------------

insert into bingo values(floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1));
insert into bingo values(floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1));
insert into bingo values(floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1));
insert into bingo values(floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1), floor(random() * 12 + 1));




------extraer el mes de (mi fecha de nacimiento + los meses de la fecha actual) y verificar si coincide con algun campo de la tabla--------------------------------

select 'bingo' from bingo where col1  = extract (month from timestamp '29-12-1996' +  (concat(extract (month from current_date), ' month'))::interval) or col2 = extract (month from timestamp '29-12-1996' +  (concat(extract (month from current_date), ' month'))::interval) or col3 = extract (month from timestamp '29-12-1996' +  (concat(extract (month from current_date), ' month'))::interval) or col4 = extract (month from timestamp '29-12-1996' +  (concat(extract (month from current_date), ' month'))::interval);
('4')::smallint;

