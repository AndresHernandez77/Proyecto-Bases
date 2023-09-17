






select * from catalogo.CATEGORIA

BEGIN TRAN

	insert into catalogo.CATEGORIA(id_Categoria,nombre,descripcion)
	values (1,'Postres','Todo lo que buscas en postres para disfrutar'),  
	       (2,'Tortas','Tortas de diferentes especialidades'), 
	       (3,'Hamburguesas','Hamburguesas de diferentes especialidades'),
		   (4,'Bebidas','Todo las bebidas para saciar tu sed'), 
	       (5,'Comida corrida','Comida corrida en distintos platos'),
		   (6,'Comida mexicana','Todo tipo de comida mexicana tipica'), 
	       (7,'Comida asiatica','Comida para disfutar lo oriental'),
		   (8,'Ensaladas','Comida saludable'),
		   (9,'Tacos','Todo lo que buscas en tacos para disfrutar')
	select * from catalogo.CATEGORIA

commit TRAN

delete from catalogo.FRANQUICIA


BEGIN TRAN

	insert into catalogo.FRANQUICIA(nombre,descripcion)
	values ('La Casa de Toño','Variedad de antojitos mexicanos'),  
	       ('PF Changs','Cadena de auténtica comida asiática'), 
	       ('KFC','Cadena de restaurantes de pollo frito'),
		   ('Burger King','Cadena de comida rápida estadounidense'), 
	       ('Taco Bell','Comida rápida en cocina Tex-Mex'),
		   ('Starbucks','Café elaborado, bebidas y  bocadillos')
	
	select * from catalogo.FRANQUICIA

commit TRAN

DBCC CHECKIDENT ('catalogo.Franquicia', NORESEED);
go

DBCC CHECKIDENT ('catalogo.Franquicia', RESEED,5);
go

BEGIN TRAN

	insert into catalogo.TIENDA(nombre,telefono,correo,menu,id_Franquicia)
	values ('El antojo',5566341211,'elantojo12@gmail.com','Pator,Suadero,Campechano',10),  
	       ('La taquiza',5546249010,'Taquiza27@gmail.com','Suadero,Carnitas,Birria',10), 
	       ('krustaceo Hamburgoso',5516642034,'Krustaceo5@gmail.com','Hawaina,Cubana,Pierna,Milanesa,Costeña',9), 
		   ('Hamburguesas Cuñado',5526340081,'HambCuñad@gmail.com','Hawaina,Cubana,Pierna,Milanesa,Colombiana,Mexicana',9), 
		   ('Sushito',5524678094,'sushito@gmail.com','Sushi,Pad Thai,Ramen,Bibimbap,Pollo al curry',7), 
		   ('Asiatic Food',5564678084,'FoodAsiat@gmail.com','Sushi,Ramen,Pollo al curry',7), 
		   ('Comida padrino',5522628024,'padrinoFo@gmail.com','Tacos,Pozole,Mole,Enchiladas,Chilaquiles,Flautas',6), 
		   ('Independencia',5599628921,'Indepen@gmail.com','Pozole,Mole,Enchiladas,Chilaquiles,Flautas,Pambazos,Tamales',6), 
		   ('El cafesin',5539321121,'cafesin56@gmail.com','Cafe,Pan,Malteada,Pastel',11), 
		   ('Pollo Cruji',5529381220,'pollocruj@gmail.com','Pollo,Bisquet,Bolillos,Papas Francesas',8),
		   ('Pollos Arracheros',5589281020,'arracher@gmail.com','Pollo,Bisquet,Papas Francesas',8)
	select * from catalogo.TIENDA

commit TRAN



BEGIN TRAN

	insert into pago.FACTURA(rfc,uso,correo,tipo_persona)
	values ('JGJ321231950A','Justificar en SAT','jos267@gmail.com','F'),
	       ('EFS421283959B','Validar en el Banco','Saul78@gmail.com','F'),
	       ('TLK781201950A','Justificar en SAT','Karla88@gmail.com','F'),
		   ('ERF731001950C','Requisito de Empresa','Fernando4@gmail.com','M'),
		   ('RHS101206950D','Justificar en SAT','samantfe@gmail.com','M'),
		   ('PGD731001950C','Requisito de Banco','danibrr@gmail.com','F'),
		   ('RHJ101206950D','Justificar en SAT','junito9@gmail.com','M')
	select * from pago.FACTURA

commit TRAN

-------Falta terminar de agregar a los clientes, reeseteear el indice primero.

DBCC CHECKIDENT ('personal.Cliente', NORESEED);
GO 
select * from personal.CLIENTE

DBCC CHECKIDENT ('personal.Cliente', RESEED,0);
go


BEGIN TRAN

	insert into personal.CLIENTE(paterno,materno,nombre, edad,username,contrasena,correo,telefono,rfc,sexo,tipo_Pago)
	values ('Juarez','Gonzalez','Jose','25','Jose27','ABfg113*o','jos267@gmail.com',5561235678,'JGJ321231950A','Masculino','P'),
	       ('Escobar','Fernandez','Saul','30','EscSaul','ACf31k3p$','Saul78@gmail.com',5578230078,'EFS421283959B','Masculino','T'),
	       ('Tamez','Lopez','Karla','18','KarlaLP','5Cf3Hk39$','Karla88@gmail.com',5508292073,'TLK781201950A','Femenino','T'),
		   ('Pilar','Tapia','Fernando','18','Fer23','FERg167&$','Fer76@gmail.com',5578295602,'ERF731001950C','Masculino','P'),
	       ('Estrada','Linares','Samanta','20','EstSaman','Samf31k8p$','samantfe@gmail.com',5528134478,'RHS101206950D','Femenino','E'),
		   ('Perez','Garcia','Daniel','32','Daniprr','Df93Hk38$','danibrr@gmail.com',5599239378,'PGD731001950C','Masculino','T'),
		   ('Ramirez','Hernandez','Josefina','17','Josefin456','JSfF1k90p*','junito9@gmail.com',5588031179,'RHJ101206950D','Femenino','E')
	
	select * from personal.CLIENTE

commit TRAN


DBCC CHECKIDENT ('personal.Repartidor', NORESEED);
GO 


DBCC CHECKIDENT ('personal.Repartidor', RESEED,0);
go



BEGIN TRAN

	insert into personal.REPARTIDOR(paterno,materno,nombre, zona,username,contrasena,correo,telefono,rfc,licencia,fecha_contrato,noEntregas)
	values ('Perez','Gonzalez','Julio','Norte de la Ciudad','Julio22','ACKg213**','jULIO267@gmail.com',5571995278,'PGJ321531960A','si','2019-01-27',76),
	       ('Salina','Fausto','Samuel','Centro de la Ciudad','SmuelF56','13fA1L3p$','Samu98@gmail.com',5530261178,'SFS421283959B','no','2020-05-02',62),
	       ('Garay','Lopez','Carlos','Sur de la Ciudad','Carlosfr','5yf1Hk39$','KCarlos88@gmail.com',5528262773,'GLC788801455A','si','2020-08-12',53),
		   ('Ponce','Montes','Fernanda','Sur de la Ciudad','Fer23','FEkg568&$','Ferdr76@gmail.com',5534295282,'PCF731371850C','si','2019-04-29',98),
	       ('Escutia','Cruz','Sonia','Este de la Ciudad','ESonia','S4Jn31k8p$','soniade45@gmail.com',5529235488,'ESC107276951D','no','2015-02-18',347),
		   ('Perez','Garcia','Demian','Oeste de la Ciudad','Demianfg','Df67Hl37$','demi56@gmail.com',5597235388,'PGD636052480C','si','2017-09-15',259),
		   ('Ruiz','Salas','Amanda','Sur de la Ciudad','JAmanda456','JTfD6O90K*','AMNDFER9@gmail.com',5508061329,'RSA107291620D','si','2022-12-25',27)
	
	select * from personal.REPARTIDOR
commit TRAN



	insert into personal.CLIENTE(paterno,materno,nombre, edad,username,contrasena,correo,telefono,rfc,sexo,tipo_Pago)
	values ('Juarez','Gonzalez','Jose','25','Jose27','ABfg113*o','jos267@gmail.com',5561235678,'JGJ321231950A','Masculino','P'),
	       ('Escobar','Fernandez','Saul','30','EscSaul','ACf31k3p$','Saul78@gmail.com',5578230078,'EFS421283959B','Masculino','T'),
	       ('Tamez','Lopez','Karla','18','KarlaLP','5Cf3Hk39$','Karla88@gmail.com',5508292073,'TLK781201950A','Femenino','T'),
		   ('Pilar','Tapia','Fernando','18','Fer23','FERg167&$','Fer76@gmail.com',5578295602,'ERF731001950C','Masculino','P'),
	       ('Escobar','Linares','Samanta','20','EstSaman','Samf31k8p$','samantfe@gmail.com',5528134478,'RHS101206950D','Femenino','E'),
		   ('Perez','Garcia','Daniel','32','Daniprr','Df93Hk38$','danibrr@gmail.com',5599239378,'PGD731001950C','Masculino','T'),
		   ('Ramirez','Hernandez','Josefina','17','Josefin456','JSfF1k90p*','junito9@gmail.com',5588031179,'RHJ101206950D','Femenino','E')
	
	select * from personal.CLIENTE

commit TRAN

BEGIN TRAN

	insert into pago.EFECTIVO(id_Cliente,nombre)
	values (5,'Samanta Escobar'),  
	       (7,'Josefina Ramirez')
	select * from pago.EFECTIVO

commit TRAN

BEGIN TRAN

	insert into pago.PAYPAL(id_Cliente,saldo_disponible)
	values (1,1500),  
	       (4,25000)
	select * from pago.PAYPAL

commit TRAN


BEGIN TRAN

	insert into pago.TARJETA(id_Cliente,no_Cuenta,saldo_disponible)
	values (2,'12657846583657865890',7020),  
	       (3,'56431264795764356437',2588),
		   (6,'22427264595664350439',85788)
	select * from pago.TARJETA

commit TRAN

select *from personal.CLIENTE

BEGIN TRAN

	insert into venta.PEDIDO( id_Pedido,fecha,id_Cliente)
	values (53,'2020-01-21',1),
	       (45,'2021-04-17',2),
		   (51,'2018-08-15',3),
		   (54,'2022-09-27',4),
		   (15,'2019-10-22',5),
		   (14,'2017-11-30',6),
		   (78,'2020-05-25',7),
		   (17,'2019-07-16',5),
		   (22,'2019-08-01',1),
		   (79,'2018-01-09',4)
	       
	select * from venta.PEDIDO

commit TRAN



BEGIN TRAN

	insert into venta.ENCUESTA( id_Cliente,calificacion,uniforme,descripcion,prod_noEncontrado)
	values (1,'5','Si',null,null),
	       (2,'5','Si','Excelente servicio,me gusto',null),
		   (3,'3','No',null,'pizza peperoni'),
	       (4,'1','Si','pesimo servicio',null),
		   (5,'4','Si','Servicio muy regular',null),
	       (6,'1','No',null,'Camarones'),
		   (7,'5','Si','Excelente servicio',null)
	
	select * from venta.Encuesta

commit TRAN



select * from catalogo.TIENDA

insert into personal.direccioncLIENTE(id_cliente,calle,colonia,ciudad,codigo_postal,pais,no_Interior,no_Exterior) 
values
(1,'Nicloas Romero','Xalpa','Ciudad de Mexico','12453','Mexico','Mz37','Lt46'),
(2,'Tlatelolco','La paz','Jalisco','07493','Mexico','Mz34','Lt89'),
(3,'Guanabana','Mere de la Cruz','Ciudad de Mexico','07053','Mexico','Mz20','Lt13'),
(4,'La rosa','Nueva era','Tapachula','67353','Mexico','Mz34','Lt13'),
(5,'Roma','La Tipica','Ciudad de Mexico','66453','Mexico','Mz02','Lt09'),
(6,'Rio frio','10 de mayo','Texcoco','12453','Mexico','Mz17','Lt19'),
(7,'arboleda','Santa Maria','Ciudad de Mexico','00453','Mexico','Mz20','Lt92')
go

insert into personal.direccionTIENDA(id_Tienda,calle,colonia,ciudad,codigo_postal,pais,no_Interior,no_Exterior) 
values
(2,'Nicloas Romero','Aroa de Belen','Ciudad de Mexico','45453','Mexico','Mz12','Lt49'),
(3,'av Iman','La venida','Jalisco','0903','Mexico','Mz12','Lt09'),
(4,'Granada','Meridilla','Ciudad de Mexico','78053','Mexico','Mz10','Lt13'),
(5,'Lopez Farias ','Nerudo','Tapachula','20353','Mexico','Mz14','Lt23'),
(6,'Dinamarca','La bombonera','Ciudad de Mexico','16453','Mexico','Mz12','Lt29'),
(7,'Raiz','10 de mayo','Texcoco','12453','Mexico','Mz11','Lt30'),
(8,'arcos','Santa Lucia','Ciudad de Mexico','20453','Mexico','Mz90','Lt12'),
(9,'Lopez Portillo ','Rosa','Tapachula','25583','Mexico','Mz11','Lt20'),
(10,'Delia','La Quinta','Ciudad de Mexico','26853','Mexico','Mz10','Lt11'),
(11,'Clavel','Guanabana','Texcoco','11423','Mexico','Mz02','Lt05'),
(12,'Mango','Santa clara','Ciudad de Mexico','21153','Mexico','Mz40','Lt11')

go


-----------

select * from catalogo.TIENDA

BEGIN TRAN

	insert into venta.ORDEN( id_Pedido,precio_unitario,precio_Final,descuento,id_Franquicia,id_repartidor,id_Tienda)
	values (53,120,360,10,6,1,2),
	       (45,20,460,10,7,2,3),
		   (51,70,370,0,8,3,5),
		   (54,220,600,20,9,4,7),
		   (15,30,60,10,10,5,8),
		   (14,70,160,10,11,6,9),
		   (78,80,460,15,9,0,10),
		   (17,100,960,20,11,3,11),
		   (22,15.7,160,10,6,4,12),
		   (79,130,260,10,8,6,2)
	       
	select * from venta.ORDEN

commit TRAN


select * from catalogo.CATEGORIA
BEGIN TRAN

	insert into catalogo.PRODUCTO(nombre,id_Tienda,id_Categoria)
	values ('pozole',7,6),
	       ('Orden de Pastor',2,9),
		   ('Hamburguesa Cubana',4,3),
		   ('Hamburguesa Milanesa',4,3),
		   ('Cafe Americano',10,4),
		   ('Sushi',7,7),
		   ('Mole',9,6),
		   ('Pollo Arrachero',11,5),
		   ('Birria',3,6),
		   ('Enchiladas',8,6)
	       
	select * from catalogo.PRODUCTO

commit TRAN


BEGIN TRAN

	insert into venta.CESTAVIRTUAL( id_Pedido,productos,tiempo,precio_final,noProductos)
	values (53,'pollo,taco de pastor,cafe','2020-01-21',679,5),
	       (45,'sushi,cafe','2021-04-17',320,7),
		   (51,'Birria, refresco','2018-08-15',144,3),
		   (54,'Hamburguesa de Minlena,Hamburguesa de pierna','2022-09-27',260,8),
		   (15,'Papas,Malteadas','2019-10-22',60,2),
		   (14,'Flautas,Clilaquiles','2017-11-30',50,6),
		   (78,'Tacos de Suadero','2020-05-25',20,1)
		       
	select * from venta.CESTAVIRTUAL

commit TRAN


select * from personal.REPARTIDOR
