drop database if exists biblioteca;
create database biblioteca;
use biblioteca;

create table autor (
    cod_autor int(5) primary key,
    nombre varchar(50) not null
);

create table libro (
    isbn varchar(10) primary key,
    titulo varchar(100) not null,
    anio date not null,
    autor int(5),
    foreign key (autor) references autor(cod_autor)
);

create table socio (
    cod_socio int primary key,
    nombre varchar(15),
    apellidos varchar(20),
    telefono int(9)
);


create table prestamo (
    codigo int(7) auto_increment primary key,
    fecha_prestamo date not null,
    fecha_devolucion date,
    libro varchar(10),
    foreign key (libro) references libro(isbn)
);

alter table socio add direccion varchar(50);
alter table libro modify titulo varchar (150) not null;
alter table socio modify telefono varchar(9) not null;




