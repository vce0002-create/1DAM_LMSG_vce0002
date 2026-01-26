use liga;
select * from equipo;
select * from jugador;
select * from partido;

-- 1.Datos del jugador más alto de la liga.--
select * from jugador where altura = (select max(altura) from jugador);
-- 2.Datos de todos los jugadores que pertenecen al Caja Laboral.--
select * from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre = "Caja Laboral";
-- 3. Suma de las alturas de los jugadores que sean al CAI Zaragoza o del Real Madrid.--
select * from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre = "CAI Zaragoza" or e.nombre = "Real Madrid";
-- 4. Datos de los jugadores que miden más que todos los jugadores del Caja Laboral.--
select j.* from jugador j  join equipo e on j.equipo = e.id_equipo where j.altura > (select j.altura from jugador j join equipo e on j.equipo = e.id_equipo 
where e.nombre = "Caja Laboral" order by j.altura desc limit 1);
select * from jugador where altura > (select max(altura) from jugador j join equipo e on j.equipo = e.id_equipo where e.nombre ="Caja Laboral");
-- 5. Datos de los jugadores mejor pagado y peor pagado de la liga.--

-- 6.  Datos del jugador más antiguo, es decir, el que lleva más tiempo dado de alta en un equipo.--

-- 7. Datos de los equipos que tienen más de tres jugadores registrados.--

-- 8. Mostrar el nombre del jugador, el nombre del equipo al que pertenece y su posición.--

-- 9. Mostrar el nombre de cada equipo y el nombre de su capitán o capitanes.--

-- 10. Datos de los equipos y el número de partidos que han jugado como locales.--

-- 11.Datos de los jugadores cuyos equipos hayan jugado al menos tres partidos como visitantes.--

-- 12. Datos de los equipos y el salario máximo de sus jugadores.--

-- 13. Datos de los equipos que hayan jugado algún partido contra el Valencia en casa.--

-- 14. Datos de los jugadores de equipos que hayan jugado algún partido contra el Valencia en casa.--

-- 15. Datos de los equipos que no tienen ningún jugador registrado.--

-- 16.Mostrar el salario medio de los jugadores de cada equipo.--

-- 17.Datos de los jugadores que cobran más que la media salarial de su equipo.--
