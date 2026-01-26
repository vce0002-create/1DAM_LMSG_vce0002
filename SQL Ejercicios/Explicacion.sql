use profesores;

select * from profesores;
select * from coordinadores;
select * from asignaturas;
select * from imparte;
select * from prepara;


-- 1. Muestra los datos de la asugnatura y el dni del profesor que la imparte. --
select * from asignaturas a join imparte i on a.codigo = i.asignatura;
select * from asignaturas a, imparte i where a.codigo = i.asignatura;

-- 2. Muestra los datos de los profesores que imparten alguna asignatura. --
select * from profesores p join imparte i on p.dni = i.dni ;
select * from profesores p join imparte i on p.dni = i.dni order by ingreso desc;

-- 3. Muestra los datos de los profesores que imparten alguna asignatura pero con natural join. --
select * from profesores natural join imparte;

-- Producto cartesiano(CROSS JOIN). --
select * from profesores, asignaturas;
select * from profesores cross join imparte;

-- 4. Suma de créditos que imparte cada profesor seguún su dni. --
select sum(creditos) as suma_creditos, dni from asignatura a join imparte i on a.codigo = i.asignatura group by dni;

-- 5. Mostrar el nombre de los profesores y cuantas asignaturas imparten cada uno. --
select nombre , count(asignatura) as n_asignatura from profesores natural join imparte group by nombre;

-- 6 Mostrar el nombre del profesor y la descripción de la asignatura que imparte. --
select * from profesores p join imparte i on p.dni = i.dni join asignaturas a join asignatura on a.codigo = i.asignatura;

-- 7. DNI y nombre del coordinador y la descripcion de la asignatura que coordina . --
select dni , nombre, descripcion from coordinadores c join asignaturas a on (c.asignatura = a.codigo);

-- 8. DNI del profesor y la suma de los creditos que prepara.--
select dni, sum(creditos) from prepara p join asignaturas a on a.codigo = p.asignatura group by dni;

-- 9. LEFT JOIN. Datos de todos los profesores, y si imparte alguna asignatura, los datos de ella.
select * from profesores p left join imparte i on (p.dni = i.dni);
select * from imparte i  right join profesores p on ( p.dni = i.dni);

-- 10. RIGHT JOIN. Datos de todos los profesores y si prepara alguna asignatura los datos de ella.
select * from prepara pr join profesores p on (pr.dni = p.dni);

-- SUBCONSULTAS 

-- 1. Mostrar tdos los datos de las asignaturas que tienen más creditos que la asignatura PC --
select * from asignaturas where creditos > (select creditos from asignaturaS where codigo = "PC");

-- 2. Mostrar la descripcion de las asignaturas que tienen más creditos que los demás. --
select descripcion from asignaturas where creditos =  (select max(creditos) from asignaturas);
select descripcion from asignaturas where creditos >= all (select creditos from asignaturas);-- es lo mismo que hemos echo arriba pero de forma diferente. 


-- 3. Nombre de las asignaturas que no son las que menos créditos tienen. --
select * from asignaturas where creditos > (select min(creditos) from asignaturas);
select * from asignaturas where creditos > any (select creditos from asignaturas);

-- 4. 