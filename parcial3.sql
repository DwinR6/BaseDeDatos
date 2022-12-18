DROP TABLE IF EXISTS cliente, detalle_cliente, cliente_temp;

CREATE TABLE cliente
    (
        id_cliente smallserial,
        nombre VARCHAR(25) NOT NULL,
        apellido VARCHAR(25) NOT NULL,
        saldo REAL,
        CONSTRAINT pk_cliente PRIMARY KEY(id_cliente)
    );
    
CREATE TABLE detalle_cliente
    (
        id_detalle smallserial,
        id_cliente smallint NOT NULL,
        fecha_ingreso TIMESTAMP NOT NULL,
        ultima_actualizacion TIMESTAMP,
        CONSTRAINT pk_detalleCliente PRIMARY KEY(id_detalle)
    );

CREATE TABLE cliente_temp
    (
        id_cliente smallint NOT NULL,
        nombre VARCHAR(25) NOT NULL,
        apellido VARCHAR(25) NOT NULL,
        saldo REAL NOT NULL,
        id_detalle smallint NOT NULL,
        fecha_ingreso TIMESTAMP NOT NULL,
        ultima_actualizacion TIMESTAMP NOT NULL
    );
    
/*

ESCRIBA AQUÍ SU SOLUCIÓN
PD: EN SU ARCHIVO .SQL QUE VA ENVIAR, SOLO DEBE ENVIAR ESTA PARTE Y LOS TEST

*/


-- TEST
-- Debe aparecer un cliente en la tabla clientes con el saldo nulo
INSERT INTO cliente(nombre, apellido, saldo) VALUES ('Diego', 'Herrera', NULL);
SELECT * FROM cliente;

/* Debe aparecer un cliente en la tabla clientes con saldo y
   ese mismo cliente en la tabla detalle_cliente con la fecha de ingreso actual
   y ultima_actualizacion vacía */
INSERT INTO cliente(nombre, apellido, saldo) VALUES ('Gokú', 'Son', 150);
SELECT * FROM cliente;
SELECT * FROM detalle_cliente;

-- Debe actualizarse el cliente objetivo en la tabla detalle_cliente.ultima_actualizacion
UPDATE cliente SET saldo=0 WHERE id_cliente=1;
SELECT * FROM detalle_cliente WHERE id_cliente=1;

-- Debe eliminar el cliente y ese cliente aparecerá en la tabla cliente_temp y creará el trigger para cliente_temp
DELETE FROM cliente WHERE id_cliente=1;
SELECT * FROM cliente_temp;

-- Debe eliminar el cliente de cliente_temp y ese cliente desaparecerá de la tabla detalle_cliente
DELETE FROM cliente_temp WHERE id_cliente=2;
SELECT * FROM detalle_cliente WHERE id_cliente=2;




create or replace function insertar_actualizar_cliente()
returns trigger as 
$$


	begin
		if old is null then
			raise notice 'Insert operation';
            --insert to into detalle_cliente
            insert into detalle_cliente(id_cliente, fecha_ingreso) values (new.id_cliente, now(), null);
		else
			raise notice 'Update operation';
            --update to detalle_cliente set ultima_actualizacion=now() where id_cliente=old.id_cliente;
            update detalle_cliente set ultima_actualizacion=now() where id_cliente=old.id_cliente;
		end if;
		if new.saldo is null or new.saldo = 0 then 
			raise notice 'el saldo es nulo';
		end if;
		return new;
	end;
$$ language plpgsql;


create trigger insert_update_cliente_trig
before insert or update on cliente
for each row
execute procedure insertar_actualizar_cliente();

INSERT INTO cliente(nombre, apellido, saldo) VALUES ('Diego', 'Herrera', NULL);

UPDATE cliente SET saldo=0 WHERE id_cliente=7;

delete from cliente;

select * from cliente;


create trigger delete_from_cliente_trig
before delete on cliente
for each row
execute procedure delete_from_cliente();

create function delete_from_cliente()
returns trigger as
$$
    rw record;
    begin
       --insert into cliente
    end;
$$ language plpgsql;

