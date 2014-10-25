GO

CREATE PROCEDURE AEFI.crear_Hotel

		@Nombre nvarchar(255),
		@Mail nvarchar(60),
		@Telefono int,
		@Calle nvarchar(255),
		@Cantidad_Estrellas int,
		@Ciudad nvarchar(255),
		@Pais nvarchar(255),
		@Fecha_Creacion datetime,
		@NroCalle numeric(18,0)

AS
BEGIN
		IF NOT EXISTS (SELECT * FROM AEFI.TL_Hotel h WHERE Nombre = @Nombre AND Nro_Calle = @NroCalle)
	BEGIN
			INSERT INTO AEFI.TL_Hotel(Nombre, Mail, Telefono, Calle, Cantidad_Estrellas, Ciudad, Pais, Fecha_Creacion, Nro_Calle)
			VALUES (@Nombre, @Mail, @Telefono, @Calle, @Cantidad_Estrellas, @Ciudad, @Pais, @Fecha_Creacion, @NroCalle)
	END;

END;


GO

CREATE PROCEDURE AEFI.actualizar_Hotel

		@ID_Hotel int,
		@Nombre nvarchar(255),
		@Mail nvarchar(60),
		@Telefono int,
		@Calle nvarchar(255),
		@Cantidad_Estrellas int,
		/*@Recarga_Estrellas int,*/
		@Ciudad nvarchar(255),
		@Pais nvarchar(255),
		@Fecha_Creacion datetime,
		@NroCalle numeric(18,0)

AS
BEGIN
	
	BEGIN
    
    UPDATE AEFI.TL_Hotel
	SET Nombre =@Nombre, Mail = @Mail, Telefono = @Telefono, Calle = @Calle, Cantidad_Estrellas = @Cantidad_Estrellas, Ciudad = @Ciudad, Pais = @Pais, Fecha_Creacion = @Fecha_Creacion, Nro_Calle = @NroCalle
	WHERE ID_Hotel = @ID_Hotel
						
	END;	
			
END;	
	
GO	
	
CREATE PROCEDURE AEFI.crear_Habitacion

		@Numero nvarchar (50),
		@Piso nvarchar (50),
		@Vista nvarchar (50),
		@Descripcion nvarchar(255),
		@Tipo_Habitacion nvarchar(255),
		@Porcentual numeric (18,2)

AS
BEGIN
		IF NOT EXISTS (SELECT * FROM AEFI.TL_Habitacion h WHERE Numero = @Numero)
	BEGIN
			INSERT INTO AEFI.TL_Habitacion(Numero, Piso, Vista, Tipo_Comodidades, Tipo_Porcentual)
			VALUES (@Numero, @Piso, @Vista, @Tipo_Habitacion, @Porcentual)
	END;

END;