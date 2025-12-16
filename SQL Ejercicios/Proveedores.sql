DROP DATABASE IF exists proveedores;
create database proveedores;
use proveedores;

CREATE TABLE proveedor(
codigo int PRIMARY KEY auto_increment,
direccion varchar(150),
ciudad varchar(20),
provincia varchar (20)
);

CREATE TABLE categoria (
codigo int PRIMARY KEY auto_increment,
nombre varchar(100) not null
);

CREATE TABLE pieza(
codigo int PRIMARY KEY auto_increment,
nombre varchar(100) not null,
color varchar(50),
precio decimal(10,2), /*numero decimal*/
categoria int,
FOREIGN KEY (categoria) REFERENCES CATEGORIA (codigo)
);

CREATE TABLE proveedor_suministra_pieza(
id_proveedor int,
id_pieza int,
cantidad int not null,
fecha date not null,
PRIMARY KEY (id_proveedor, id_pieza, fecha),
FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR (codigo),
FOREIGN KEY (id_pieza) REFERENCES PIEZA (codigo)
);
