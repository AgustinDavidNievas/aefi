
CREATE SCHEMA AEFI AUTHORIZATION gd;

GO


CREATE TABLE [AEFI].[TL_Usuario](
	[ID_Usuario] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
	[Username] NVARCHAR(255) NOT NULL, /*UNIQUE: ESTO LO VAMOS A TENER QUE VERIFICAR EN EL PROGRAMA PARA NO PERDER DATOS */
	[Password] NVARCHAR(64) NOT NULL,
	[Pass_Temporal] bit DEFAULT 1, /*1 VERDADERO, 0 FALSO */
	[Habilitado] bit DEFAULT 1
	/*[ID_Reserva] int*/

);


CREATE TABLE [AEFI].[TL_Tipo_Documento](
		[ID_Tipo_Documento] NUMERIC(18,0) IDENTITY (1,1) PRIMARY KEY,
		[Descripcion] NVARCHAR(40)
);

	
CREATE TABLE [AEFI].[TL_Cliente](
	
		[ID_Cliente] NUMERIC (18,0) IDENTITY (1,1) PRIMARY KEY,
		[Nombre] NVARCHAR(255) NOT NULL,
		[Apellido] NVARCHAR(255) NOT NULL,
		[ID_Tipo_Documento] NUMERIC(18,0) NOT NULL,
		[Mail] nvarchar(255), /*UNIQUE: QUITE ESTO PORQUE HAY MAILS REPETIDOS Y NO PODEMOS PERDER DATOS */
		[Direccion] NVARCHAR (255),
		[Nro_Documento] NVARCHAR(255) UNIQUE NOT NULL,
/* TENEMOS QUE VER SI "TELEFONO Y DIRECCION" VAN EN LA TABLA*/
		[Fecha_Nacimiento] datetime NOT NULL,
		[Nacionalidad] NVARCHAR(255),
	
		FOREIGN KEY (ID_Tipo_Documento) REFERENCES [AEFI].[TL_Tipo_Documento] (ID_Tipo_Documento)
		);
	


CREATE TABLE [AEFI].[TL_Rol](
	[ID_Rol] int IDENTITY (1,1) PRIMARY KEY,
	[Descripcion] nvarchar (255) UNIQUE NOT NULL,
	[Activo] bit NOT NULL DEFAULT 1

);	



CREATE TABLE [AEFI].[TL_Funcionalidad](
	[ID_Funcionalidad] int IDENTITY (1,1) PRIMARY KEY,
	[Descripcion] nvarchar (255) UNIQUE NOT NULL,
	[Restriccion] int DEFAULT NULL, /*si esta en NULL no hay restriccion, si tiene un numero es el numero del rol al que puede ser asignado*/
);

CREATE TABLE [AEFI].[TL_Regimen] (
		[ID_Regimen] int IDENTITY (1,1) PRIMARY KEY,
		[Descripcion] NVARCHAR(255),
		[Precion_Base] int,
		[Estado] int DEFAULT 1 /*1 activo 0 no activo */
);		

CREATE TABLE [AEFI].[TL_Hotel](
		[ID_Hotel] int IDENTITY PRIMARY KEY,
		[Mail] nvarchar(60),
		[Telefono] int,
		[Calle] nvarchar(255),
		[Cantidad_Estrellas] int,
		[Recarga_Estrellas] int,
		[Ciudad] nvarchar(255),
		[Pais] nvarchar(255),
		[Fecha_Creacion] datetime,
		[Nro_Calle] numeric(18,0),
		[Recarga_Estrella] int,
		[Primer_Ingreso] bit DEFAULT 1, /*1 primer ingreso*/
);
		
CREATE TABLE [AEFI].[TL_Habitacion](

		[ID_Habitacion] int IDENTITY (1,1) PRIMARY KEY,
		[Numero] numeric(18,0),
		[Piso] numeric (18,0),
		[Vista] nvarchar(50),
		[Tipo_Habitacion] nvarchar(255),
		[Tipo_Codigo] numeric(18,0),
		[Tipo_Porcentual] numeric(18,0),
		[Tipo_Comodidades] nvarchar(255),
		[Cantidad_Huespedes_Total] int,
		[ID_Hotel] int,
		FOREIGN KEY (ID_Hotel) REFERENCES [AEFI].[TL_Hotel] (ID_Hotel)
		);

CREATE TABLE [AEFI].[TL_Reserva](

		[ID_Reserva] int IDENTITY (1,1) PRIMARY KEY,
		[Fecha_Reserva] datetime,
		[Fecha_Desde] datetime,
		[Fecha_Hasta] datetime,
		[Cantidad_Huespedes] int,
		[Cantidad_Noches] NUMERIC(18,0), 
		[ID_Regimen] int NOT NULL,
		[ID_Habitacion] int NOT NULL,
		[ID_Cliente] NUMERIC(18,0),
		FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente),
		FOREIGN KEY (ID_Habitacion) REFERENCES [AEFI].[TL_Habitacion] (ID_Habitacion),
		FOREIGN KEY (ID_Regimen) REFERENCES [AEFI].[TL_Regimen] (ID_Regimen)	
		
);

		
		
CREATE TABLE [AEFI].[TL_Cancelacion](
		
		[ID_Cancelacion] int IDENTITY (1,1) PRIMARY KEY, /*ver bien que tipo es*/
		[Motivo] nvarchar(255),
		[ID_Reserva] int,
		[Fecha] datetime,
		[ID_Usuario] NUMERIC(18,0),		
		FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario] (ID_Usuario), /*Usuario que hizo la cancelación*/
		FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva] (ID_Reserva)
);

CREATE TABLE [AEFI].[TL_Item]( /*Item es el ex-Consumible*/

		[ID_Item] int IDENTITY (1,1) PRIMARY KEY,
		[Descripcion] NVARCHAR(255),
		[Precio] int
);		
		
		
CREATE TABLE [AEFI].[TL_Estadia](
		
		[ID_Estadia] int IDENTITY (1,1) PRIMARY KEY,
		[Estado] bit,
		[Fecha_Inicio] datetime,
		[Cantidad_Noches] int,
		[ID_Reserva] int,
		[ID_Item] int,
		FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva](ID_Reserva),
		FOREIGN KEY (ID_Item) REFERENCES [AEFI].[TL_Item] (ID_Item)
		);

CREATE TABLE [AEFI].[TL_FormaDePago] (
	[ID_FormaDePago] int IDENTITY (1,1) PRIMARY KEY,
	[Descripcion] NVARCHAR(50)
);

		
CREATE TABLE [AEFI].[TL_Factura](

		[ID_Factura] int IDENTITY (1,1) PRIMARY KEY,
		[Numero] int,
		[Fecha] datetime,
		[Total] int,
		[ID_FormaDePago] int,
		[ID_Cliente] NUMERIC(18,0),
		FOREIGN KEY (ID_FormaDePago) REFERENCES [AEFI].[TL_FormaDePago] (ID_FormaDePago),
		FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente)
		
);

CREATE TABLE [AEFI].[TL_Registro_Pago](
		[ID_Factura] int,
		[ID_Cliente] NUMERIC(18,0),
		[Fecha] DATETIME,
		PRIMARY KEY (ID_Factura, ID_Cliente),
		FOREIGN KEY (ID_Factura) REFERENCES [AEFI].[TL_Factura] (ID_Factura),
		FOREIGN KEY (ID_Cliente) REFERENCES [AEFI].[TL_Cliente] (ID_Cliente)
);
		
		
/* TABLA MUCHOS A MUCHOS*/
CREATE TABLE [AEFI].[TL_Funcionalidad_Rol] (
	[ID_Rol] int,
	[ID_Funcionalidad] int,
	PRIMARY KEY (ID_Rol, ID_Funcionalidad),
	FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_ROL] (ID_Rol),
	FOREIGN KEY (ID_Funcionalidad) REFERENCES [AEFI].[TL_Funcionalidad] (ID_Funcionalidad)
);
	
/*TABLA MUCHOS A MUCHOS*/	
CREATE TABLE [AEFI].[TL_Usuario_Por_Rol](

		[ID_Rol] int,
		[ID_Usuario] NUMERIC(18,0),
		PRIMARY KEY (ID_Usuario, ID_Rol),
		FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario] (ID_Usuario),
		FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol] (Id_Rol)
);
		
/*TABLA MUCHOS A MUCHOS */
CREATE TABLE [AEFI].[TL_Item_Por_Factura](
	[ID_Item] int,
	[ID_Factura] int,
	PRIMARY KEY (ID_Factura, ID_Item),
	FOREIGN KEY (ID_Factura) REFERENCES [AEFI].[TL_Factura] (ID_Factura),
	FOREIGN KEY (ID_Item) REFERENCES [AEFI].[TL_Item] (ID_Item)
);

/*TABLA MUCHOS A MUCHOS */
CREATE TABLE [AEFI].[TL_Regimen_Por_Hotel](
	[ID_Hotel] int,
	[ID_Regimen] int,
	PRIMARY KEY (ID_Hotel, ID_Regimen),
	FOREIGN KEY (ID_Hotel) REFERENCES [AEFI].[TL_Hotel] (ID_Hotel),
	FOREIGN KEY (ID_Regimen) REFERENCES [AEFI].[TL_Regimen] (ID_Regimen)
);