/*
Lenguaje de control de Datos


*/




----creacion de roles
create role cliente
go 
create role repartidor
go


-----------------------------------------------------------------------------------
---creacion de administradores

-- se crea el login 
create login AdministradorPrin with password = '1234zaq*',
	default_database = Emp_Entrega_Comida2,
	check_expiration = OFF,
	check_policy = OFF
go

create user Administrador4 for login AdministradorPrinci
WITH DEFAULT_SCHEMA=sqluser
go
CREATE SCHEMA sqluse AUTHORIZATION Administrador4
GO
EXEC sp_addrolemember 'db_ddladmin', 'sqluse';
EXEC sp_addrolemember 'db_datareader', 'sqluse';
EXEC sp_addrolemember 'db_datawriter', 'sqluse';
GO





---------------------------------------

--Creacion de un trigger para  verificar la contraseña, campos null,registros repetidos y crea el login para el usuario cliente, ademas de darle acceso a ciertas consultas o actualizaciones al personal detipo cliente

CREATE or ALTER TRIGGER personal.REGISTRADO on personal.cliente instead of insert as
BEGIN
	--Declaracion de variables
	declare @paterno varchar(30),@materno varchar(30),@nombre varchar(30), @Contrasena varchar(12), @correo varchar(20),
			@Username varchar(40), @rfc char(13), @sexo varchar(10), @tipoPago char(1),@newUserCommand varchar(256), @newUserCommand2 varchar(256),
		    @newUserCommand3 varchar(256),@newUserCommand4 varchar(256),@newUserCommand5 varchar(256),@newUserCommand6 varchar(256),@newUserCommand7 varchar(256),@newUserCommand8 varchar(256),@newUserCommand9 varchar(256),@newUserCommand10 varchar(256),@newUserCommand11 varchar(256);

	select @paterno= paterno, @materno = materno,@nombre = nombre,@Contrasena = contrasena,@correo = correo,@Username = username, @rfc = rfc,@sexo = sexo,
	@tipoPago = tipo_Pago from inserted;

	if(((len(@Contrasena) <=12 and len(@Contrasena)>=8) 
	     and (@Contrasena like '%*%' or @Contrasena like '%$%' or @Contrasena like '%&%') 
		 and (@Contrasena like '%[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]%') 
		 and (@Contrasena like '%[abcdefghijklmnñopqrstuvwxyz]%') 
		 and (@Contrasena like '%[0-9]%'))) 
	BEGIN
		if(@materno is not null and @paterno is not null and @nombre is not null and @Contrasena is not null and @correo is not null and @Username 
		is not null  and @sexo is not null and @tipoPago in ('P','T','E')) ---verifica que no haya campos null
		BEGIN
			--En el siguiente if se verifica que no exista el curp, username y contraseña en la tabla
			if((not exists(select rfc from personal.CLIENTE where rfc=@rfc)) and (not exists(select username from personal.CLIENTE where username=@Username))
			and (not exists(select contrasena from personal.CLIENTE where contrasena = @Contrasena)) and (@tipoPago in('P','T','E')))
			BEGIN
				insert into personal.CLIENTE(paterno,materno,nombre, edad,contrasena,correo,telefono,username,rfc,sexo,tipo_Pago)
				(select paterno,materno,nombre, edad,contrasena,correo,telefono,username,rfc,sexo,tipo_Pago from inserted);--Se inserta el registro
				
				set @newUserCommand = 'create login '+@Username+' with password ='''+@contrasena+''',
	                                   default_database = [Emp_Entrega_Comida2],  CHECK_EXPIRATION=OFF'
	
	                                 execute (@newUserCommand)
	
	             set @newUserCommand2 = CONCAT('CREATE USER "',@Username,'" for login "',@Username,'"')
	
	             execute (@newUserCommand2)

				 set @newUserCommand3 = 'alter role cliente add member '+@Username
				execute(@newUserCommand3)

				
				set @newUserCommand4 = 'Grant select ON catalogo.categoria from '+ @Username +' with grant option'
				execute(@newUserCommand4)

				set @newUserCommand5 = 'Grant select ON catalogo.Franquincia from '+ @Username +' with grant option'
				execute(@newUserCommand5)

				set @newUserCommand6 = 'Grant select ON catalogo.producto from '+ @Username +' with grant option'
				execute(@newUserCommand6)

				set @newUserCommand7 = 'Grant select ON catalogo.tienda from '+ @Username +' with grant option'
				execute(@newUserCommand7)

				set @newUserCommand8 = 'Grant select ON catalogo.direcciontienda from '+ @Username +' with grant option'
				execute(@newUserCommand8)

				set @newUserCommand9 = 'Grant select, insert, delete ON venta.CESTAVIRTUAL from '+ @Username +' with grant option'
				execute(@newUserCommand9)

				set @newUserCommand10 = 'Grant select, insert ON venta.ORDEN from '+ @Username +' with grant option'
				execute(@newUserCommand10)

				set @newUserCommand11 = 'Grant select, insert ON venta.Encuesta from '+ @Username +' with grant option'
				execute(@newUserCommand11)

			END
		END
	END
END

GO

----------------------------
--Creacion de un trigger para  verificar la contraseña, campos null,registros repetidos y crea el login para el usuario cliente, ademas de darle acceso a ciertas consultas o actualizaciones al personal de tipo repartidor
--lo mismo que el anterior pero para el repartidor 

CREATE or ALTER TRIGGER personal.REGISTRO_REPARTIDOR on personal.repartidor instead of insert as
BEGIN
	--Declaracion de variables
	declare @paterno varchar(30),@materno varchar(30),@nombre varchar(30), @Contrasena varchar(12), @correo varchar(20),
			@Username varchar(40), @rfc char(13),@zona varchar(50),@fecha date, @newUserCommand varchar(256), @newUserCommand2 varchar(256),
		    @newUserCommand3 varchar(256),@newUserCommand4 varchar(256),@newUserCommand5 varchar(256),@newUserCommand6 varchar(256),@newUserCommand7 varchar(256),@newUserCommand8 varchar(256),@newUserCommand9 varchar(256),@newUserCommand10 varchar(256),@newUserCommand11 varchar(256),@newUserCommand12 varchar(256);

	select @paterno= paterno, @materno = materno,@nombre = nombre,@Contrasena = contrasena,@correo = correo,@Username = username, @rfc = rfc,@zona=zona,@fecha=fecha_contrato
	 from inserted;

	if(((len(@Contrasena) <=12 and len(@Contrasena)>=8) 
	     and (@Contrasena like '%*%' or @Contrasena like '%$%' or @Contrasena like '%&%') 
		 and (@Contrasena like '%[ABCDEFGHIJKLMNÑOPQRSTUVWXYZ]%') 
		 and (@Contrasena like '%[abcdefghijklmnñopqrstuvwxyz]%') 
		 and (@Contrasena like '%[0-9]%'))) 
	BEGIN
		if(@materno is not null and @paterno is not null and @nombre is not null and @Contrasena is not null and @correo is not null and @Username 
		is not null  and @fecha is not null and @zona is not null)  ---verifica que no haya campos null
		BEGIN
			--En el siguiente if se verifica que no exista el curp, username y contraseña en la tabla
			if((not exists(select rfc from personal.REPARTIDOR where rfc=@rfc)) and (not exists(select username from personal.REPARTIDOR where username=@Username))
			and (not exists(select contrasena from personal.REPARTIDOR where contrasena = @Contrasena)))
			BEGIN
				insert into personal.REPARTIDOR(paterno,materno,nombre,contrasena,correo,telefono,username,rfc,zona,fecha_contrato,licencia,noEntregas)
				(select paterno,materno,nombre,contrasena,correo,telefono,username,rfc,zona,fecha_contrato,licencia,noEntregas from inserted);--Se inserta el registro
				
				set @newUserCommand = 'create login '+@Username+' with password ='''+@contrasena+''',
	                                   default_database = [Emp_Entrega_Comida2],  CHECK_EXPIRATION=OFF'
	
	                                 execute (@newUserCommand)
	
	             set @newUserCommand2 = CONCAT('CREATE USER "',@Username,'" for login "',@Username,'"')
	
	             execute (@newUserCommand2)

				 set @newUserCommand3 = 'alter role repartidor add member '+@Username
				
				execute(@newUserCommand3)

			    set @newUserCommand4 = 'Grant select ON catalogo.categoria from '+ @Username +' with grant option'
				execute(@newUserCommand4)

				set @newUserCommand5 = 'Grant select ON catalogo.Franquincia from '+ @Username +' with grant option'
				execute(@newUserCommand5)

				set @newUserCommand6 = 'Grant select ON catalogo.producto from '+ @Username +' with grant option'
				execute(@newUserCommand6)

				set @newUserCommand7 = 'Grant select ON catalogo.tienda from '+ @Username +' with grant option'
				execute(@newUserCommand7)

				set @newUserCommand8 = 'Grant select ON catalogo.direcciontienda from '+ @Username +' with grant option'
				execute(@newUserCommand8)

				set @newUserCommand9 = 'Grant select ON catalogo.direccioncliente from '+ @Username +' with grant option'
				execute(@newUserCommand9)

				set @newUserCommand10 = 'Grant select ON venta.ORDEN from '+ @Username +' with grant option'
				execute(@newUserCommand10)

				set @newUserCommand11 = 'Grant select ON venta.Encuesta from '+ @Username +' with grant option'
				execute(@newUserCommand11)

				set @newUserCommand12 = 'Grant select ON venta.Pedido from '+ @Username +' with grant option'
				execute(@newUserCommand12)

			END
		END
	END
END

GO