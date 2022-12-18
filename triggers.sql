-----------------------------triggers on postgresql-----------------------------
--Los triggers son una forma de escuchar eventos en la base de datos.
--Por ejemplo, un trigger se ejecuta cuando una tabla se modifica.
--Los triggers pueden ser definidos en la base de datos o en un archivo de texto.


create or replace function display_customers() returns record language plpgsql as 
$$
    declare
        rec record;
        counter int := 0;
    begin
        for rec in select * from customer loop
            raise notice 'El cliente se llama %', rec.name;
            counter := counter + 1;
            
        end loop;

            raise notice 'Se encontraron % clientes', counter;

        return counter;
    end;
$$;

select display_customers();

--- trigger lanzador de eventos segun se cumplan algunas condiciones sobre: insert, update, delete, etc.------------------------
-- usando uso de after, before, instead of, instead of all
-- uso de new y old

create or replace function display_customers() returns trigger language plpgsql as 
$$
    declare
        rec record;
        counter int := 0;
    begin
        for rec in select * from customer loop
            raise notice 'El cliente se llama %', new.name;
            counter := counter + 1;
            
        end loop;

            raise notice 'Se encontraron % clientes', counter;

        return old;
    end;
$$;


create trigger trigger_display_after 
    after insert  
    on customer
    for each row 
    execute function display_customers();