/*
AUTOR: EQUIPO 5
FECHA: 14/01/2023
DESCRIPCIÓN: Vistas de la tabla
*/

--1. Vista de todos los clientes donde tengan pago con paypal
SELECT * FROM personal.CLIENTE 
where tipo_Pago = 'P'
go

--2. Vista de los repartidores que si tienen licencia
SELECT * FROM personal.REPARTIDOR
where licencia = 'si'
GO
select *from 
--3. Vista de la encuesta del cliente con id 4
SELECT * FROM venta.ENCUESTA
where id_Cliente=10
GO