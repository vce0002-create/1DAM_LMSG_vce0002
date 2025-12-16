drop database if exists ONGS;
create database ONGS;
use ONGS;

create table asociacion (
cif char (9) primary key,
denominación varchar (20) not null,
direccion varchar (50),
provincia varchar (15),
tipo  enum ('Ecologista', 'Integracion', 'Desarollo') ,
utilidad_publica enum ('SI', 'NO')
);

create table socio (
DNI char (9) primary key, 
nombre varchar (30),
direccion varchar (60),
provincia varchar (30),
fecha_alta date not null,
cuota_mensual decimal (7,5) not null check (cuota_mensual >= 0),
aportacion_anual decimal (7,5) check (aportacion_anual >= 0),
CIF char (9),
foreign key (CIF) references asociacion (CIF) on delete set null on update cascade
);

create table trabajador (
DNI char (9) primary key,
nombre varchar(30) not null,
fingreso date not null,
tipo ENUM('Asalariado', 'Voluntario'),
irpf int check (irpf between 0 and 100), 
pagos decimal (9,2) check (pagos >= 0),
profesion varchar (30),
horas int check (horas >=0 and  horas <= 300), 
edad int  check (edad between 18 and 100)
);

create table proyecto (
id int auto_increment primary key,
pais varchar (20),
zona varchar (30),
objetivo varchar (100)
);

create table trabaja ( 
DNI char (9),
id_proyecto int,
primary key (DNI, id_proyecto),
foreign key (DNI) references trabajador (DNI),
foreign key (id_proyecto) references proyecto (id)
);

alter table proyecto add column nro_beneficiario int not null check (nro_beneficiario >=0);
alter table proyecto add CIF char(9) not null;
alter table proyecto add foreign key (CIF) references asociacion (CIF) on delete restrict on update cascade;