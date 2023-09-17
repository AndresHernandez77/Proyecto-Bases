--Creador: EQUIPO 5
--fecha: 13/01/2023
--Estadísticas del proyecto

--1. ¿Qué edad utiliza más esta aplicación?
select edad, count (edad) from personal.CLIENTE
group by edad

--2. Promedio del dinero pagado en los pedidos
select AVG(all precio_Final) FROM venta.ORDEN

--3. Cantidad de hombres y mujeres que utilizan la aplicación
select sexo, count(sexo) from personal.CLIENTE
group by sexo

--4. Calificaciones de usuarios
select calificacion, count(calificacion) FROM venta.ENCUESTA
group by calificacion
ORDER By calificacion
