


create database Emp_Entrega_Comida2
go

Use Emp_Entrega_Comida2
GO

--Creacion de esquemas

CREATE SCHEMA catalogo
go

CREATE SCHEMA personal
go

CREATE SCHEMA pago
go

CREATE SCHEMA venta
go

--Creacion de tablas
CREATE TABLE catalogo.FRANQUICIA(
   id_Franquicia   tinyint       NOT NULL  identity(1,1),
   nombre           varchar(20)   NOT NULL,
   descripcion      varchar(40)   NOT NULL,
  CONSTRAINT pk_Franquicia PRIMARY KEY CLUSTERED (id_Franquicia) 
)
go



CREATE TABLE catalogo.TIENDA(
   id_Tienda   tinyint       NOT NULL  identity(1,1),
   nombre      varchar(20)   NOT NULL,
   telefono    numeric(10,0) NOT NULL,
   correo      varchar(20)   NOT NULL,
   menu        VARCHAR(100)  NOT NULL,
   id_Franquicia tinyint     NOT NULL,
 CONSTRAINT pk_Tienda PRIMARY KEY CLUSTERED (id_Tienda),  
 CONSTRAINT rel_Franquincia FOREIGN KEY (id_Franquicia) REFERENCES catalogo.Franquicia(id_Franquicia)
)
go

CREATE TABLE personal.REPARTIDOR(
   id_Repartidor   tinyint       NOT NULL  identity(1,1),
   nombre      varchar(20)   NOT NULL,
   telefono    numeric(10,0) NOT NULL,
   correo      varchar(20)   NOT NULL,
   zona        varchar(50)   NOT NULL,
   fecha_contrato date       NOT NULL,
   licencia    varchar(10)   NOT NULL,
   noEntregas  int           NOT NULL,
   rfc         char(13)      NOT NULL CONSTRAINT UK_RFC UNIQUE (rfc), 
 CONSTRAINT id_Repartidor PRIMARY KEY CLUSTERED (id_Repartidor)
 
)
go

CREATE TABLE catalogo.CATEGORIA(
   id_Categoria     tinyint       NOT NULL,
   nombre           varchar(20)   NOT NULL CONSTRAINT UK_NOMBRE UNIQUE (nombre),
   descripcion      varchar(50)   NOT NULL,
  CONSTRAINT pk_Categoria PRIMARY KEY CLUSTERED (id_Categoria) 
)
go


CREATE TABLE catalogo.PRODUCTO(
   id_Producto   tinyint       NOT NULL  identity(1,1)  CONSTRAINT pk_Producto PRIMARY KEY CLUSTERED (id_Producto),
   nombre        varchar(20)   NOT NULL,
   id_Tienda     tinyint       NOT NULL  CONSTRAINT rel_Tienda FOREIGN KEY (id_Tienda) REFERENCES catalogo.Tienda(id_Tienda),
   id_Categoria  tinyint       NOT NULL  CONSTRAINT rel_Categoria FOREIGN KEY (id_Categoria) REFERENCES catalogo.Categoria(id_Categoria)

)
go

---- correcion de esta tabla
CREATE TABLE venta.ORDEN(
   id_Pedido       tinyint       NOT NULL  CONSTRAINT pk_Pedido PRIMARY KEY CLUSTERED (id_Pedido),
   id_Tienda       tinyint       NOT NULL   CONSTRAINT rel_TiendaOrd FOREIGN KEY (id_Tienda) REFERENCES catalogo.Tienda(id_Tienda),
   precio_unitario money         NOT NULL,
   precio_Final    money         NOT NULL,
   descuento       numeric(5,0)  NOT NULL,
   id_Franquicia   tinyint       NOT NULL CONSTRAINT rel_Franquincia FOREIGN KEY (id_Franquicia) REFERENCES catalogo.Franquicia(id_Franquicia),
   id_Repartidor    tinyint     NOT NULL CONSTRAINT rel_Repartidor FOREIGN KEY (id_Repartidor) REFERENCES personal.Repartidor(id_Repartidor)
)
go

CREATE TABLE pago.FACTURA(
   rfc              char(13)   NOT NULL   CONSTRAINT pk_rfc PRIMARY KEY CLUSTERED (rfc) ,
   uso              varchar(20)   NOT NULL,
   correo           varchar(20)   NOT NULL,
   tipo_persona      varchar(10)   NOT NULL  constraint ck_persona CHECK (tipo_persona in ('F','M'))

)
go


CREATE TABLE personal.CLIENTE(
   id_Cliente   tinyint       NOT NULL  identity(1,1)  CONSTRAINT id_Cliente PRIMARY KEY CLUSTERED (id_Cliente),
   nombre      varchar(30)   NOT NULL,
   sexo        varchar(10)   NOT NULL,
   edad        smallint      NOT NULL,
   correo      varchar(20)   NOT NULL,
-- foto        picture       NOT NULL,
   telefono    numeric(10,0) NOT NULL,
   rfc         char(13)      NULL CONSTRAINT rel_rfc FOREIGN KEY (rfc) REFERENCES pago.FACTURA(rfc),
   tipo_Pago   char(1)       NOT NULL  constraint ck_pago CHECK (tipo_pago in ('E','T','P'))
)
go

CREATE TABLE venta.ENCUESTA(
   id_Cliente       tinyint       NOT NULL,
   calificacion     char(1)       NOT NULL  constraint ck_calificacion CHECK (calificacion in ('1','2','3','4','5')),
   uniforme         varchar(2)    NOT NULL,
   prod_noEncontrado varchar(50)  NOT NULL,
   descripcion       varchar(50)      NULL,
  CONSTRAINT rel_cliente FOREIGN KEY (id_Cliente) REFERENCES personal.Cliente(id_Cliente),
  CONSTRAINT pk_Cliente PRIMARY KEY CLUSTERED (id_Cliente)
)
go

CREATE TABLE pago.EFECTIVO(
   id_Cliente       tinyint       NOT NULL,
   nombre           varchar(30)   NOT NULL,
  CONSTRAINT rel_cliente FOREIGN KEY (id_Cliente) REFERENCES personal.Cliente(id_Cliente),
  CONSTRAINT pk_Cliente PRIMARY KEY CLUSTERED (id_Cliente)
)
go

CREATE TABLE pago.TARJETA(
   id_Cliente       tinyint       NOT NULL ,
   no_cuenta        varchar(20)   NOT NULL,
   saldo_disponible  money        NOT NULL,
   nombre           varchar(20)   NOT NULL,
   CONSTRAINT pk_ClienteTarjeta PRIMARY KEY CLUSTERED (id_Cliente),
  CONSTRAINT rel_clienteTarjeta FOREIGN KEY (id_Cliente) REFERENCES personal.Cliente(id_Cliente)
  
)
go



CREATE TABLE pago.PAYPAL(
   id_Cliente       tinyint       NOT NULL,
   correo           varchar(20)   NOT NULL,
   saldo_disponible  money        NOT NULL,
   nombre           varchar(20)   NOT NULL,
  CONSTRAINT rel_clientePaypal FOREIGN KEY (id_Cliente) REFERENCES personal.Cliente(id_Cliente),
  CONSTRAINT pk_ClientePaypal PRIMARY KEY CLUSTERED (id_Cliente)
)
go




CREATE TABLE venta.PEDIDO(
   id_Pedido        tinyint       NOT NULL,
   fecha            date          NOT NULL,
   id_Cliente       tinyint       NOT NULL CONSTRAINT rel_clientePedido FOREIGN KEY (id_Cliente) REFERENCES personal.Cliente(id_Cliente),
  CONSTRAINT pk_PedidoVenta PRIMARY KEY CLUSTERED (id_Pedido) ,
  CONSTRAINT rel_pedidoVenta FOREIGN KEY (id_Pedido) REFERENCES venta.ORDEN(id_Pedido),
)
go

CREATE TABLE venta.CESTAVIRTUAL(
   id_Pedido        tinyint       NOT NULL,
   productos        varchar(100)  NOT NULL,
   tiempo           datetime      NOT NULL,
   precio_final     numeric(10,0) NOT NULL,
   noProductos      int           NOT NULL,
  CONSTRAINT pk_PedidoCesta PRIMARY KEY CLUSTERED (id_Pedido) ,
  CONSTRAINT rel_pedidoCesta FOREIGN KEY (id_Pedido)  REFERENCES venta.ORDEN(id_Pedido),
)
go

CREATE TABLE personal.DIRECCIONCLIENTE(
   id_Cliente       tinyint       NOT NULL,
   calle            varchar(15)   NOT NULL,
   colonia          varchar(15)   NOT NULL,
   ciudad           varchar(20)   NOT NULL,
   codigo_postal    varchar(5)    NOT NULL,
   pais             varchar(20)   NOT NULL,
   no_Interior      varchar(10)   NOT NULL,
   no_Exterior      varchar(10)   NOT NULL
   
  CONSTRAINT rel_clienteDireccion FOREIGN KEY (id_Cliente) REFERENCES personal.Cliente(id_Cliente),
  CONSTRAINT pk_ClienteDireccion PRIMARY KEY CLUSTERED (id_Cliente)
)
go


CREATE TABLE personal.DIRECCIONTIENDA(
   id_Tienda        tinyint       NOT NULL,
   calle            varchar(15)   NOT NULL,
   colonia          varchar(15)   NOT NULL,
   ciudad           varchar(20)   NOT NULL,
   codigo_postal    varchar(5)    NOT NULL,
   pais             varchar(20)   NOT NULL,
   no_Interior      varchar(10)   NOT NULL,
   no_Exterior      varchar(10)   NOT NULL
   
  CONSTRAINT rel_Tienda FOREIGN KEY (id_Tienda) REFERENCES catalogo.Tienda(id_Tienda),
  CONSTRAINT pk_Tienda PRIMARY KEY CLUSTERED (id_Tienda)
)
go