DROP DATABASE IF EXISTS cliente;
create database cliente;
use cliente;

CREATE TABLE cliente(
dni int PRIMARY KEY auto_increment,
nombre varchar(100) not null,
apellidos varchar (100) not null,
dirección varchar (150),
fecha_nac date not null
);

CREATE TABLE producto (
codigo int PRIMARY KEY auto_increment,
nombre varchar(100),
precio_unit decimal (10,2)
);

CREATE TABLE proveedor(
nif int PRIMARY KEY auto_increment,
nombre varchar (100),
direccion varchar (150)
);

CREATE TABLE cliente_compra_producto(
dni_cliente int,
codigo_producto int,
FOREIGN KEY (dni_cliente) REFERENCES CLIENTE (dni),
FOREIGN KEY (codigo_producto) REFERENCES PRODUCTO (codigo)
);