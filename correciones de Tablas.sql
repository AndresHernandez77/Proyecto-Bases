

alter table personal.CLIENTE
add paterno varchar(30) not null,materno varchar(30) not null,contrasena varchar(12) not null, username varchar(40)
go


alter table personal.repartidor
add paterno varchar(30) not null,materno varchar(30) not null,contrasena varchar(12) not null, username varchar(40)
go

alter table personal.repartidor
drop column licencia
go

alter table personal.repartidor
add licencia char(2) not null
go

alter table pago.paypal
drop column nombre,correo
go


alter table pago.Tarjeta
drop column nombre
go

alter table pago.Tarjeta
drop column no_cuenta
go

alter table pago.tarjeta
add no_cuenta char(20) not null
go

alter table venta.Orden
drop column nombre_Tienda
go


alter table venta.Orden
drop column nombre_Comp
go

alter table venta.Encuesta
drop column prod_noEncontrado
go

alter table venta.Encuesta
add prod_noEncontrado varchar(50) null
go


alter table venta.CESTAVIRTUAL
drop column tiempo
go

alter table venta.cestavirtual
add tiempo date not null
go


drop table catalogo.PRODUCTO

CREATE TABLE catalogo.PRODUCTO(
   id_Producto   tinyint       NOT NULL  identity(1,1)  CONSTRAINT pk_Producto PRIMARY KEY CLUSTERED (id_Producto),
   nombre        varchar(20)   NOT NULL,
   id_Tienda     tinyint       NOT NULL  CONSTRAINT rel_Tienda FOREIGN KEY (id_Tienda) REFERENCES catalogo.Tienda(id_Tienda),
   id_Categoria  tinyint       NOT NULL  CONSTRAINT rel_Categoria FOREIGN KEY (id_Categoria) REFERENCES catalogo.Categoria(id_Categoria)

)
go





