BEGIN TRANSACTION

INSERT INTO [AEFI].[TL_Usuario](username, password)
SELECT m.Cliente_Nombre + '_' + m.Cliente_Apellido, '03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4' /*Borre el DISTINCT para no perder registros */
FROM gd_esquema.Maestra m
WHERE Cliente_Nombre IS NOT NULL;

INSERT INTO AEFI.TL_Cliente(Nombre,Apellido,ID_Tipo_Documento,Documento_Nro,Mail,Calle,Calle_Nro,Piso,Dpto,Fecha_Nacimiento,Nacionalidad,Localidad,PaisOrigen)
SELECT DISTINCT m.Cliente_Nombre, m.Cliente_Apellido ,2, m.Cliente_Pasaporte_Nro, m.Cliente_Mail, m.Cliente_Dom_Calle, m.Cliente_Nro_Calle, m.Cliente_Piso, m.Cliente_Depto, m.Cliente_Fecha_Nac, m.Cliente_Nacionalidad,'CABA','Argentina' 
FROM gd_esquema.Maestra m
WHERE Cliente_Apellido IS NOT NULL AND Cliente_Nombre IS NOT NULL

INSERT INTO AEFI.TL_Cliente (ID_Tipo_Documento, Documento_Nro, Nombre, Apellido, Mail, Fecha_Nacimiento, Calle, Calle_Nro, Piso, Dpto, Nacionalidad)
SELECT DISTINCT 2, m.Cliente_Pasaporte_Nro, m.Cliente_Nombre, m.Cliente_Apellido, m.Cliente_Mail, m.Cliente_Fecha_Nac, m.Cliente_Dom_Calle,m.Cliente_Nro_Calle, m.Cliente_Piso, m.Cliente_Depto, m.Cliente_Nacionalidad
FROM gd_esquema.Maestra m ;

INSERT INTO [AEFI].[TL_Hotel](Calle,Nro_Calle,Ciudad,Cantidad_Estrellas,Recarga_Estrellas, Pais)
SELECT DISTINCT Hotel_Calle, Hotel_Nro_Calle, Hotel_Ciudad, Hotel_CantEstrella, Hotel_Recarga_Estrella, 'Argentina'
FROM gd_esquema.Maestra

	/*TODO: Setear cantidad de huespedes total a manopla*/
INSERT INTO AEFI.TL_Tipo_Habitacion(ID_Tipo_Habitacion, Descripcion, Porcentual)
SELECT DISTINCT m.Habitacion_Tipo_Codigo, m.Habitacion_Tipo_Descripcion, m.Habitacion_Tipo_Porcentual 
FROM gd_esquema.Maestra m


INSERT INTO [AEFI].[TL_Habitacion] (ID_Tipo_Habitacion, Numero, Piso, Vista, ID_Hotel)
SELECT DISTINCT t.ID_Tipo_Habitacion, m.Habitacion_Numero, m.Habitacion_Piso, m.Habitacion_Frente, h.ID_Hotel
FROM gd_esquema.Maestra m
JOIN AEFI.TL_Tipo_Habitacion t ON (m.Habitacion_Tipo_Codigo = t.ID_Tipo_Habitacion)
JOIN AEFI.TL_Hotel h ON (h.Calle = m.Hotel_Calle AND h.Nro_Calle=m.Hotel_Nro_Calle)


/* me tira error no se si esta bien migracion de reserva */
/*SET IDENTITY_INSERT AEFI.TL_Rerserva ON

INSERT INTO [AEFI].[TL_Reserva] (ID_Reserva, Fecha_Reserva,Cantidad_Noches)
SELECT DISTINCT Reserva_Codigo,Reserva_Fecha_Inicio,Reserva_Cant_Noches
FROM gd_esquema.Maestra

SET IDENTITY_INSERT AEFI.TL_Rerserva OFF
*/
INSERT INTO [AEFI].[TL_Regimen] (Descripcion,Precion_Base)
SELECT DISTINCT Regimen_Descripcion, Regimen_Precio
FROM  gd_esquema.Maestra
	

--Uso codigos que ya existen
	SET IDENTITY_INSERT [AEFI].[TL_Consumible] ON
	INSERT INTO [AEFI].[TL_Consumible](ID_Consumible, Descripcion, Precio)
	SELECT DISTINCT Consumible_Codigo, Consumible_Descripcion, Consumible_Precio
	FROM gd_esquema.Maestra 
	WHERE Consumible_Codigo IS NOT NULL
	

	SET IDENTITY_INSERT [AEFI].[TL_Consumible] OFF
GO



INSERT INTO [AEFI].[TL_Factura](Numero, Fecha, Total)
SELECT DISTINCT m.Factura_Nro, m.Factura_Fecha, m.Factura_Total
FROM gd_esquema.Maestra m

INSERT INTO [AEFI].[TL_Estadia](Fecha_Inicio, Cantidad_Noches)
SELECT DISTINCT m.Estadia_Fecha_Inicio, m.Estadia_Cant_Noches
FROM gd_esquema.Maestra m

/*FALTA LA PARTE DE REGIMEN*/



COMMIT