DROP DATABASE IF exists mentor;
create database mentor;
use mentor;

create	table aula (
  cod int primary key auto_increment,
  nombre varchar(100) not null,
  dirreción varchar(100) not null
);

create table administrador_aula(
  dni varchar(10) PRIMARY KEY ,
  nombre varchar(50) not null,
  email varchar (100) not null
);

create table administrador_administra_aula (
  dni_administrador varchar(10) not null,
  cod_aula int,
  PRIMARY KEY (dni_administrador, cod_aula),
  FOREIGN KEY (dni_administrador) references ADMINISTRADOR_AULA(dni),
  FOREIGN KEY (cod_aula) references AULA(cod)
);

create table alumno (
  email varchar(100) PRIMARY KEY,
  dni varchar(10) not null,
  nombre varchar(100) not null,
  direccion varchar(150) not null,
  telefono varchar(15) not null,
  espanol boolean not null,
  cod_aula INT,
  FOREIGN KEY (cod_aula) REFERENCES AULA(cod)
);

create table curso (
  nombre varchar(100) PRIMARY KEY ,
  url varchar(200) not null,
  libro varchar(50) not null
);

create table alumno_matricula_curso (
  fecha_inicio date not null,
  fecha_fin date null,
  email_alumno varchar(100) ,
  nombre_curso varchar(100) ,
  PRIMARY KEY (email_alumno, nombre_curso),
  FOREIGN KEY (email_alumno) REFERENCES ALUMNO(email),
  FOREIGN KEY (nombre_curso) REFERENCES CURSO(nombre)
);

create table tutor (
  dni varchar(10) PRIMARY KEY ,
  nombre VARCHAR(100) not null,
  email VARCHAR(100) not null
);

create table tutor_tutoriza_curso(
  dni_tutor varchar(10) ,
  nombre_curso varchar(100) ,
  PRIMARY KEY (dni_tutor, nombre_curso),
  FOREIGN KEY (dni_tutor) REFERENCES TUTOR(dni),
  FOREIGN KEY (nombre_curso) REFERENCES CURSO(nombre)
);

create table tutor_coordina_tutor (
  dni_tutor varchar(10),
  dni_coordinador varchar(10),
  PRIMARY KEY (dni_tutor, dni_coordinador),
  FOREIGN KEY (dni_tutor) REFERENCES TUTOR(dni),
  FOREIGN KEY (dni_coordinador) REFERENCES TUTOR(dni)
);
