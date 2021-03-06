CREATE SCHEMA AEFI AUTHORIZATION gd;

GO


CREATE TABLE [AEFI].[TL_Usuario](
	[ID_Usuario] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
	[Username] NVARCHAR(255) NOT NULL UNIQUE,
	[Password] NVARCHAR(64) NOT NULL,
	[Pass_Temporal] bit DEFAULT 1, /*1 VERDADERO, 0 FALSO */
	[Habilitado] bit DEFAULT 1,
		[Nombre] NVARCHAR(255),
		[Apellido] NVARCHAR(255),
		[ID_Tipo_Documento] nvarchar(255),
		[Documento_Nro] NUMERIC(18,0),	
		[Mail] nvarchar(255) UNIQUE, 
		[Telefono]nvarchar(20),		
		[Calle] NVARCHAR (255),
		[Calle_Nro] NUMERIC(18,0),
		[Piso] NUMERIC(18,0),
		[Dpto] NVARCHAR(50),
		[Fecha_Nacimiento] datetime

);



		
CREATE TABLE [AEFI].[TL_Cliente](
	
		[ID_Cliente] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[Nombre] NVARCHAR(255),
		[Apellido] NVARCHAR(255),
		[ID_Tipo_Documento] nvarchar(255),
		[Documento_Nro] NUMERIC(18,0),
		[Mail] nvarchar(255), /*UNIQUE: QUITE ESTO PORQUE HAY MAILS REPETIDOS Y NO PODEMOS PERDER DATOS */
		[Calle] NVARCHAR (255),
		[Calle_Nro] NUMERIC(18,0),
		[Piso] NUMERIC(18,0),
		[Dpto] NVARCHAR(50),
		[Telefono] nvarchar(20),		
		[Fecha_Nacimiento] datetime,
		[Nacionalidad] NVARCHAR(255),
		[Localidad] NVARCHAR(255), 
		[PaisOrigen] NVARCHAR(255)
		);
	


CREATE TABLE [AEFI].[TL_Rol](
	[ID_Rol] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
	[Descripcion] nvarchar (255) UNIQUE NOT NULL,
	[Activo] bit NOT NULL DEFAULT 1

);	



CREATE TABLE [AEFI].[TL_Funcionalidad](
	[ID_Funcionalidad] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
	[Descripcion] nvarchar (255) UNIQUE NOT NULL,
	[Restriccion] int DEFAULT NULL, /*si esta en NULL no hay restriccion, si tiene un numero es el numero del rol al que puede ser asignado*/
);

CREATE TABLE [AEFI].[TL_Regimen] (
		[ID_Regimen] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[Descripcion] NVARCHAR(255),
		[Precio_Base] NUMERIC(18,2),
		[Estado] bit DEFAULT 1 /*1 activo 0 no activo */
);		

CREATE TABLE [AEFI].[TL_Hotel](
		[ID_Hotel] NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
		[Nombre] nvarchar(55),	
		[Mail] nvarchar(255),	
		[Telefono] nvarchar(20),
		[Calle] nvarchar(255),
		[Nro_Calle] NUMERIC(18,0),
		[Cantidad_Estrellas] NUMERIC(18,0),
		[Recarga_Estrellas] NUMERIC(18,0),
		[Ciudad] nvarchar(255),
		[Pais] nvarchar(255),
		[Fecha_Creacion] datetime,
		[Estado] varchar(50)
		
		);
		
CREATE TABLE [AEFI].[TL_Habitacion](

		[ID_Habitacion] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[ID_Tipo_Habitacion] NUMERIC(18,0),
		[Numero] numeric(18,0),
		[Piso] numeric (18,0),
		[Vista] nvarchar(50),
		[Estado] varchar(255),
		[Disponible] nvarchar(2),
		[ID_Hotel] NUMERIC(18,0),
		FOREIGN KEY (ID_Hotel) REFERENCES [AEFI].[TL_Hotel] (ID_Hotel)
		);


CREATE TABLE [AEFI].[TL_Tipo_Habitacion](
		[ID_Tipo_Habitacion] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY, /*EX TIPO_CODIGO DE HABITACION*/
		[Descripcion] NVARCHAR(255),
		[Porcentual] NUMERIC(18,2),
		[Cantidad_Huespedes_Total] NUMERIC(18,0),
		);

CREATE TABLE [AEFI].[TL_Baja_Hotel](
		[ID_Baja] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY, /* Nueva tabla para las bajas de hoteles */
		[Fecha_Inicio] datetime,
		[Fecha_Fin] datetime,
		[Descripcion] varchar(255),
		[ID_Hotel] NUMERIC (18,0),
		FOREIGN KEY (ID_Hotel) REFERENCES [AEFI].[TL_Hotel] (ID_Hotel)
		);
		
		
		
CREATE TABLE [AEFI].[TL_Reserva](

		[ID_Reserva] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY, /*EX RESERVA CODIGO*/
		[Fecha_Reserva] datetime,
		[Fecha_Desde] datetime,
		[Cantidad_Huespedes] NUMERIC(18,0),
		[Cantidad_Noches] NUMERIC(18,0), 
		[ID_Regimen] NUMERIC(18,0) NOT NULL,
		[ID_Habitacion] NUMERIC(18,0) NOT NULL,
		[ID_Cliente] NUMERIC(18,0) NOT NULL,
		[Estado] varchar(255),
		FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente),
		FOREIGN KEY (ID_Habitacion) REFERENCES [AEFI].[TL_Habitacion] (ID_Habitacion),
		FOREIGN KEY (ID_Regimen) REFERENCES [AEFI].[TL_Regimen] (ID_Regimen)	
		
);

		
		
CREATE TABLE [AEFI].[TL_Cancelacion](
		
		[ID_Cancelacion] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY, /*ver bien que tipo es*/
		[Motivo] nvarchar(255),
		[ID_Reserva] NUMERIC(18,0),
		[Fecha] datetime,
		[ID_Usuario] NUMERIC(18,0),		
		FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario] (ID_Usuario), /*Usuario que hizo la cancelación*/
		FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva] (ID_Reserva)
);

CREATE TABLE [AEFI].[TL_Consumible](

		[ID_Consumible] NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,/*ex codigo*/
		[Descripcion] NVARCHAR(255),
		[Precio] NUMERIC(18,2)
);		
		
		
CREATE TABLE [AEFI].[TL_Factura](

		[ID_Factura] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[Fecha] datetime,
		[Total] NUMERIC(18,2),
		[ID_Cliente] NUMERIC(18,0),
		FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente)
		
);
	


CREATE TABLE [AEFI].[TL_Estadia](
		
		[ID_Estadia] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[Estado] bit, /*1 activo, 0 finalizado*/
		[Fecha_Inicio] datetime,
		[Cantidad_Noches] NUMERIC(18,0),
		[ID_Reserva] NUMERIC(18,0),
		[ID_Factura] NUMERIC(18,0),
		FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva](ID_Reserva),
		FOREIGN KEY (ID_Factura) REFERENCES [AEFI].[TL_Factura](ID_Factura)
				);




CREATE TABLE [AEFI].[TL_Tipo_Documento](
		[ID_Tipo_Documento] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[Descripcion] NVARCHAR(40)
);


CREATE TABLE [AEFI].[TL_Registro_Pago](
		[ID_Factura] NUMERIC(18,0),
		[ID_Cliente] NUMERIC(18,0),
		[Fecha] DATETIME,
		[FormaDePago] NVARCHAR(55),
		[ID_Tarjeta] NUMERIC(18,0)
		PRIMARY KEY (ID_Factura, ID_Cliente),
		FOREIGN KEY (ID_Factura) REFERENCES [AEFI].[TL_Factura] (ID_Factura),
		FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente)
);
		
CREATE TABLE [AEFI].[TL_Tarjeta](
	[ID_Tarjeta] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
	[Numero] NUMERIC(18,0) UNIQUE,
	[Fecha_Vto] DATETIME,
	[ID_Cliente] NUMERIC(18,0),
	FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente)
);

		
/* TABLA MUCHOS A MUCHOS*/
CREATE TABLE [AEFI].[TL_Funcionalidad_Rol] (
	[ID_Rol] NUMERIC(18,0),
	[ID_Funcionalidad] NUMERIC(18,0),
	PRIMARY KEY (ID_Rol, ID_Funcionalidad),
	FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_ROL] (ID_Rol),
	FOREIGN KEY (ID_Funcionalidad) REFERENCES [AEFI].[TL_Funcionalidad] (ID_Funcionalidad)
);
	
/*TABLA MUCHOS A MUCHOS*/	
CREATE TABLE [AEFI].[TL_Usuario_Por_Rol](

		[ID_Rol] NUMERIC(18,0),
		[ID_Usuario] NUMERIC(18,0),
		PRIMARY KEY (ID_Usuario, ID_Rol),
		FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario] (ID_Usuario),
		FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol] (Id_Rol)
);
		
/*TABLA MUCHOS A MUCHOS */
CREATE TABLE [AEFI].[TL_Item_Por_Factura](
	[ID_Item_Por_Factura] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
	[ID_Consumible] NUMERIC(18,0),
	[Cantidad] NUMERIC(18,0),
	[ID_Factura] NUMERIC(18,0),
	[ID_Estadia] NUMERIC(18,0),
	[Monto] NUMERIC(18,2),
	[Descripcion] NVARCHAR(55),
	FOREIGN KEY (ID_Factura) REFERENCES [AEFI].[TL_Factura] (ID_Factura),
	FOREIGN KEY (ID_Consumible) REFERENCES [AEFI].[TL_Consumible] (ID_Consumible),
	FOREIGN KEY (ID_Estadia) REFERENCES [AEFI].[TL_Estadia](ID_Estadia)
	
);

/*TABLA MUCHOS A MUCHOS */
CREATE TABLE [AEFI].[TL_Regimen_Por_Hotel](
	[ID_Hotel] NUMERIC(18,0),
	[ID_Regimen] NUMERIC(18,0),
	PRIMARY KEY (ID_Hotel, ID_Regimen),
	FOREIGN KEY (ID_Hotel) REFERENCES [AEFI].[TL_Hotel] (ID_Hotel),
	FOREIGN KEY (ID_Regimen) REFERENCES [AEFI].[TL_Regimen] (ID_Regimen)
);

/*TABLA MUCHOS A MUCHOS */
CREATE TABLE [AEFI].[TL_Usuario_Por_Hotel](
	[ID_Usuario_Hotel] NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
	[ID_Hotel] NUMERIC(18,0),
	[ID_Usuario] NUMERIC(18,0),
	[ID_Rol] NUMERIC(18,0),
	FOREIGN KEY (ID_Hotel) REFERENCES [AEFI].[TL_Hotel] (ID_Hotel),
	FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario] (ID_Usuario),
	FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol] (ID_Rol)
	
);
  
/*TABLA MUCHOS A MUCHOS */
CREATE TABLE [AEFI].[TL_Consumible_Por_Estadia](
	[ID_Consumible_Por_Estadia] NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY,
	[ID_Consumible] NUMERIC(18,0),
	[Cantidad] NUMERIC(18,0),
	[ID_Estadia] NUMERIC(18,0),
	FOREIGN KEY (ID_Consumible) REFERENCES [AEFI].[TL_Consumible] (ID_Consumible),
	FOREIGN KEY (ID_Estadia) REFERENCES [AEFI].[TL_Estadia] (ID_Estadia)
);

CREATE TABLE [AEFI].[TL_Puntos_Por_Factura] (
 [ID_Factura] NUMERIC(18,0),
 [ID_Cliente] NUMERIC(18,0),
 [Fecha] DATETIME,
 [Puntos] NUMERIC(18,0), 
 PRIMARY KEY (ID_Factura, ID_Cliente), 
 FOREIGN KEY (ID_Factura) REFERENCES [AEFI].[TL_Factura] (ID_Factura),
 FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente)
 
 );
 
 CREATE TABLE [AEFI].[TL_Registro_Evento](
 [ID_Registro]  NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
 [ID_Estadia] NUMERIC(18,0),
 [Descripcion] NVARCHAR(55), 
 [ID_Usuario] NUMERIC(18,0),
 [Fecha] DATETIME,
 FOREIGN KEY (ID_Estadia) REFERENCES [AEFI].[TL_Estadia] (ID_Estadia),
 FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario] (ID_Usuario)
 
 
 );
 