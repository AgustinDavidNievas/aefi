USE GD2C2014
BEGIN TRANSACTION
/****** ESQUEMA ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'AEFI')  
EXEC sys.sp_executesql N'CREATE SCHEMA [AEFI] AUTHORIZATION [gd]'
COMMIT

BEGIN TRANSACTION
CREATE TABLE [AEFI].[TL_Usuario](
	[ID_Usuario] int IDENTITY (1,1),
	[Username] nvarchar(255) UNIQUE NOT NULL,
	[Password] nvarchar (64) NOT NULL,
	[Intentos_Fallidos] int DEFAULT 0,
	[Pass_Temporal] bit DEFAULT 0,
	[Habilitado] bit DEFAULT 1,
	/*[Validar] bit DEFAULT 1,*/
	[ID_Reserva] int,
	CONSTRAINT pk_UsuarioID PRIMARY KEY (ID_Usuario),

);

INSERT INTO AEFI.TL_Usuario(Username, Password) VALUES ('admin','E6B87050BFCB8143FCB8DB0170A4DC9ED00D904DDD3E2A4AD1B1E8DC0FDC9BE7');
/*temporal la contraseña para probar, dsp hay q encriptarla y esas cosas*/	




CREATE TABLE [AEFI].[TL_Rol](
	[ID_Rol] int IDENTITY (1,1),
	[Descripcion] nvarchar (255) NOT NULL,
	[Activo] bit NOT NULL DEFAULT(1),
	CONSTRAINT pk_RolID PRIMARY KEY (ID_Rol)

);	

INSERT INTO AEFI.TL_Rol (Descripcion) VALUES ('Guest');
INSERT INTO AEFI.TL_Rol (Descripcion) VALUES ('Recepcionista');
INSERT INTO AEFI.TL_Rol (Descripcion) VALUES ('Administrador');
INSERT INTO AEFI.TL_Rol (Descripcion) VALUES ('AdministradorGeneral');


CREATE TABLE [AEFI].[TL_Funcionalidad](
	[ID_Funcionalidad] int IDENTITY (1,1),
	[Descripcion] nvarchar (255) NOT NULL,
	CONSTRAINT pk_FuncionalidadID PRIMARY KEY (ID_Funcionalidad)
	
);

INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('ABM de Rol');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('ABM de Usuario');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('ABM de Cliente (Huespedes)');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('ABM de Hotel');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('ABM de Habitacion');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('ABM de Regimen de Estadia');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('Generar o Modificar una Reserva');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('Cancelar Reserva');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('Registrar Estadía (check-in/check-out)');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('Registrar Consumibles');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('Facturar Estadia');
INSERT INTO AEFI.TL_Funcionalidad(Descripcion) VALUES ('Listado Estadistico');

CREATE TABLE [AEFI].[TL_Funcionalidad_Rol](
	[ID_Funcionalidad_Rol] int IDENTITY (1,1),
	[ID_Funcionalidad] int NOT NULL,
	[ID_Rol] int NOT NULL,
	CONSTRAINT pk_Funcionalidad_RolID PRIMARY KEY (ID_Funcionalidad_Rol)
	
);

INSERT INTO AEFI.TL_Funcionalidad_Rol (ID_Rol, ID_Funcionalidad) (
		(SELECT ID_Rol, ID_Funcionalidad 
		FROM AEFI.TL_Rol, AEFI.TL_Funcionalidad
		WHERE AEFI.TL_Rol.Descripcion = 'Administrador'
		AND (AEFI.TL_Funcionalidad.Descripcion = 'ABM de Rol'
		OR AEFI.TL_Funcionalidad.Descripcion = 'AMB de Usuario'
		OR AEFI.TL_Funcionalidad.Descripcion = 'ABM de Hotel'
		OR AEFI.TL_Funcionalidad.Descripcion = 'ABM de Habitacion'
		OR AEFI.TL_Funcionalidad.Descripcion = 'ABM de Registrar Estadia (check-in/check-out)'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Listado Estadistico'))
);

INSERT INTO AEFI.TL_Funcionalidad_Rol (ID_Rol, ID_Funcionalidad) (
		(SELECT ID_Rol, ID_Funcionalidad 
		FROM AEFI.TL_Rol, AEFI.TL_Funcionalidad
		WHERE AEFI.TL_Rol.Descripcion = 'Guest'
		AND (AEFI.TL_Funcionalidad.Descripcion = 'Generar o Modificar una Reserva'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Cancelar Reserva'))
);
	
INSERT INTO AEFI.TL_Funcionalidad_Rol (ID_Rol, ID_Funcionalidad) (
		(SELECT ID_Rol, ID_Funcionalidad 
		FROM AEFI.TL_Rol, AEFI.TL_Funcionalidad
		WHERE AEFI.TL_Rol.Descripcion = 'Recepcionista'
		AND (AEFI.TL_Funcionalidad.Descripcion = 'ABM de Cliente (Huespedes)'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Generar o Modificar una Reserva'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Cancelar Reserva'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Registrar Estadia'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Registrar Consumibles'
		OR AEFI.TL_Funcionalidad.Descripcion = 'Facturar Publicaciones'))
);

CREATE TABLE [AEFI].[TL_Usuario_Por_Rol](

		[ID_Usuario_Rol] int IDENTITY (1,1),
		[ID_Rol] int NOT NULL,
		[ID_Usuario] int NOT NULL,
		CONSTRAINT pk_Usuario_RolID PRIMARY KEY (ID_Usuario_Rol)
		);

INSERT INTO [AEFI].[TL_Usuario_Por_Rol] (ID_Rol, ID_Usuario) VALUES ('1','1');

		
CREATE TABLE [AEFI].[TL_Reserva](

		[ID_Reserva] int IDENTITY (1,1),
		[Fecha_Reserva] datetime,
		[Fecha_Desde] datetime,
		[Fecha_Hasta] datetime,
		[Cantidad_Huespedes] int,
		[Cantidad_Noches] numeric (18,0), 
		[Codigo_Reserva] numeric (18,0),
		[ID_Regimen] int NOT NULL,
		[ID_Habitacion] int NOT NULL,
		CONSTRAINT pk_ReservaID PRIMARY KEY (ID_Reserva)
		);

		
/* Falta hacer la tabla de Regimen */

		
CREATE TABLE [AEFI].[TL_Habitacion](

		[ID_Habitacion] int IDENTITY (1,1),
		[Numero] numeric(18,0),
		[Piso] numeric (18,0),
		[Vista] nvarchar(50),
		[Tipo_Habitacion] nvarchar(255),
		[Tipo_Comodidades] nvarchar(255),
		[Cantidad_Huespedes_Total] int,
		CONSTRAINT pk_HabitacionID PRIMARY KEY (ID_Habitacion)
		);
		
CREATE TABLE [AEFI].[TL_Cancelacion](
		
		[ID_Cancelacion] int IDENTITY (1,1), /*ver bien que tipo es*/
		[Motivo] nvarchar(255),
		[ID_Reserva] int,
		[Fecha] datetime,
		[ID_Usuario] int,
		CONSTRAINT pk_CancelacionID PRIMARY KEY (ID_Cancelacion)
		);
		
CREATE TABLE [AEFI].[TL_Hotel](
		[ID_Hotel] int IDENTITY,
		[ID_Usuario] int,
		[Mail] nvarchar(60),
		[Telefono] int,
		[Calle] nvarchar(255),
		[Cantidad_Estrellas] int,
		[Ciudad] nvarchar(255),
		[Pais] nvarchar(255),
		[ID_Tipo_Documento] int,
		[Fecha_Creacion] datetime,
		[Nro_Calle] numeric(18,0),
		CONSTRAINT pk_HotelID PRIMARY KEY (ID_Hotel)
		);
		
		
		
CREATE TABLE [AEFI].[TL_Estadia](
		
		[ID_Estadia] int IDENTITY (1,1),
		[Estado] bit,
		[Fecha_Inicio] datetime,
		[Cantidad_Noches] int,
		CONSTRAINT pk_EstadiaID PRIMARY KEY (ID_Estadia)
		);
		
CREATE TABLE [AEFI].[TL_Cliente](
	
		[ID_Cliente] int IDENTITY (1,1),
		[ID_Usuario] int,
		[Nombre] nvarchar(255),
		[Apellido] nvarchar(255),
		[ID_Tipo_Documento] numeric(18,0),
		[Mail] nvarchar(255) UNIQUE,

/* TENEMOS QUE VER SI "TELEFONO Y DIRECCION" VAN EN LA TABLA*/

		[Fecha_Nacimiento] datetime,
		[Nacionalidad] nvarchar(255),
		CONSTRAINT pk_ClienteID PRIMARY KEY (ID_Cliente)
		);
	
		
CREATE TABLE [AEFI].[TL_Factura](

		[ID_Factura] int IDENTITY (1,1),
		[Numero] int,
		[Fecha] datetime,
		[Total] int,
		CONSTRAINT pk_FacturaID PRIMARY KEY (ID_Factura)
		
		/* Falta campo ID_Forma_Pago (FK) */
		
      );
  /*    
CREATE TABLE [AEFI].[TL_Consumibles](

		[ID_Consumible] int IDENTITY (1,1),
		[Descripcion] nvarchar(255),
		[Precio] int,
		CONSTRAINT pk_ConsumibleID PRIMARY KEY (ID_Consumible)
		);   
		
	/* Ya existe en la base de datos? no permite Dropearla, hay q borrarla manualmente (? */


CREATE TABLE [AEFI].[TL_Tipo_Documento](

		[ID_Tipo_Documento] int IDENTITY (1,1),
		[Descripcion] nvarchar(40),
		CONSTRAINT pk_Tipo_DocumentoID PRIMARY KEY (ID_Tipo_Documento)
		);
		/* Ya existe en la base de datos? no permite Dropearla, hay q borrarla manualmente (? */
	*/

COMMIT


BEGIN TRANSACTION

ALTER TABLE [AEFI].[TL_Usuario] ADD CONSTRAINT fk_Reserva_Usuario FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva](ID_Reserva);

/*ALTER TABLE [AEFI].[TL_Reserva] ADD CONSTRAINT fk_Regimen FOREIGN KEY (ID_Regimen) REFERENCES [AEFI].[TL_Regimen](ID_Regimen);*/

ALTER TABLE [AEFI].[TL_Reserva] ADD CONSTRAINT fk_Habitacion FOREIGN KEY (ID_Habitacion) REFERENCES [AEFI].[TL_Habitacion](ID_Habitacion);

ALTER TABLE [AEFI].[TL_Cancelacion] ADD CONSTRAINT fk_Reserva_Cancelacion FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva](ID_Reserva);

ALTER TABLE [AEFI].[TL_Cancelacion] ADD CONSTRAINT fk_Usuario_Cancelacion FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

ALTER TABLE [AEFI].[TL_Hotel] ADD CONSTRAINT fk_Usuario_Hotel FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

ALTER TABLE [AEFI].[TL_Cliente] ADD CONSTRAINT fk_Usuario_Cliente FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

/*ALTER TABLE [AEFI].[TL_Cliente] ADD CONSTRAINT fk_Tipo_Documento FOREIGN KEY (ID_Tipo_Documento) REFERENCES [AEFI].[TL_Tipo_Documento](ID_Tipo_Documento); */

ALTER TABLE [AEFI].[TL_Usuario_Por_Rol] ADD CONSTRAINT fk_Rol_Usuario FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol](ID_Rol);

ALTER TABLE [AEFI].[TL_Usuario_Por_Rol] ADD CONSTRAINT fk_Usuario_Rol FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] ADD CONSTRAINT fk_Rol_Funcionalidad FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol](ID_Rol);

ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] ADD CONSTRAINT fk_Funcionalidad FOREIGN KEY (ID_Funcionalidad) REFERENCES [AEFI].[TL_Funcionalidad](ID_Funcionalidad);

/*ALTER TABLE [AEFI].[TL_Factura] ADD CONSTRAINT fk_Forma_Pago FOREIGN KEY (ID_Forma_Pago) REFERENCES [AEFI].[TL_Forma_Pago](ID_Forma_Pago); */


/*Tablas ITEMS, Forma_Pago, Regimen---- Faltan ver */



COMMIT