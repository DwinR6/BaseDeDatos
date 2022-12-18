/*  "pasajesos": [{
        "pasajero": "Diego Herrera",
        "boleto": "A123456789",
        "dui": "123456789",
        "aerolinea": "Aerolinea A",
        "destino": "Cancun",
        "pais_destino": "Mexico",
        "aeropuerto": "Cancun",
        "horaSalida": "12:00",
        "fechaSalida": "2020-01-01",
        "horaLlegada": "13:00",
        "boletoUtilizado": 1,
        "fechaLlegada": "2020-01-01",
        "horasVuelo": "4",
    }]
*/

-----------------------------------crear la primer primera forma normal con los datos de los pasajeros----------------------------------
create table pasajeros(
    id_pasajero int not null auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dui varchar(10) not null,
    primary key(id_pasajero)

);

create table aerolineas(
    id_aerolinea int not null auto_increment,
    nombre varchar(50) not null,
    primary key(id_aerolinea)
    foreign key(id_aerolinea) references pasajeros(id_pasajero)
);

create table aeropuerto(
    id_aeropuerto int not null auto_increment,
    pais varchar(50) not null,
    nombre varchar(50) not null,
    primary key(id_aeropuerto)

);
create table origen(
    id_origen int not null auto_increment,
    id_aeropuerto int not null,
    foreign key(id_aeropuerto) references aeropuerto(id_aeropuerto),
);

create table destino(
    id_destino int not null auto_increment,
    id_aeropuerto int not null,
    foreign key(id_aeropuerto) references aeropuerto(id_aeropuerto),
);
create table boletos(
    id_boleto int not null auto_increment,
    boleto varchar(10) not null,
    utilizado smallint not null,
    primary key(id_boleto)

);
create table vuelos(
    id_vuelo int not null auto_increment,
    id_aerolinea int not null,
    id_origen int not null,
    id_destino int not null,
    horaSalida varchar(5) not null,
    fechaSalida date not null,
    horaLlegada varchar(5) not null,
    fechaLlegada date not null,
    horasVuelo int not null,
    primary key(id_vuelo)
    references aerolineas(id_aerolinea),
    references aeropuerto(id_aeropuerto),
    references origen(id_origen),
    references destino(id_destino),
    references boletos(id_boleto)

);

create table viaje_pasajero(
    id_viaje_pasajero int not null auto_increment,
    id_pasajero int not null,
    id_vuelo int not null,
    id_boleto int not null,
    primary key(id_viaje_pasajero)
    foreign key(id_pasajero) references pasajeros(id_pasajero),
    foreign key(id_vuelo) references vuelos(id_vuelo),
    foreign key(id_boleto) references boletos(id_boleto)


);


// trigger to set horaLlegada y fechaLlegada en base a las horasVuelo y fechaSalida y horaSalida

create function set_hora_llegada() returns trigger as
$$
    begin
        if (new.horasVuelo is not null) then
            --calcular la hora de llegada
            set new.horaLlegada = (new.horaSalida::timestamp + new.horasVuelo::time)::time;
            --calcular la fecha de llegada
            set new.fechaLlegada = ((new.fechaSalida::timestamp + new.horaSalida::interval)::timestamp + new.horasVuelo::interval)::date;

        end if;
        return new;
    end;
$$ language plpgsql;
 