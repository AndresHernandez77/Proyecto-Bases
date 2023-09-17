--Creador: EQUIPO 5
--fecha: 13/01/2023
--Estad�sticas del proyecto

--1. �Qu� edad utiliza m�s esta aplicaci�n?
select edad, count (edad) from personal.CLIENTE
group by edad

--2. Promedio del dinero pagado en los pedidos
select AVG(all precio_Final) FROM venta.ORDEN

--3. Cantidad de hombres y mujeres que utilizan la aplicaci�n
select sexo, count(sexo) from personal.CLIENTE
group by sexo

--4. Calificaciones de usuarios
select calificacion, count(calificacion) FROM venta.ENCUESTA
group by calificacion
ORDER By calificacion
