BEGIN TRANSACTION

INSERT INTO [AEFI].[TL_Usuario](username, password)
SELECT m.Cliente_Nombre + '_' + m.Cliente_Apellido, '03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4' /*Borre el DISTINCT para no perder registros */
FROM gd_esquema.Maestra m
WHERE Cliente_Nombre IS NOT NULL;


INSERT INTO [AEFI].[TL_Hotel] (Calle, Ciudad, Cantidad_Estrellas, Nro_Calle)
SELECT DISTINCT m.Hotel_Calle, m.Hotel_Ciudad, m.Hotel_CantEstrella, m.Hotel_Nro_Calle
FROM gd_esquema.Maestra m
/*FALTA AGREGARLE LA RECARGA DE ESTRELLAS */

INSERT INTO [AEFI].[TL_Habitacion] (Numero, Piso, Vista, Tipo_Comodidades, Tipo_Codigo, Tipo_Porcentual)
SELECT DISTINCT m.Habitacion_Numero, m.Habitacion_Piso, m.Habitacion_Frente, m.Habitacion_Tipo_Descripcion, m.Habitacion_Tipo_Codigo, m.Habitacion_Tipo_Porcentual
FROM gd_esquema.Maestra m
/*Falta ver que seria Tipo_Habitacion */


/*INSERT INTO [AEFI].[TL_Reserva] (Fecha_Desde, Codigo_Reserva, Cantidad_Noches, ID_Habitacion)
SELECT DISTINCT m.Reserva_Fecha_Inicio, m.Reserva_Codigo, m.Reserva_Cant_Noches, h.ID_Habitacion
FROM gd_esquema.Maestra m
JOIN AEFI.TL_Habitacion h ON (...)

No se bien como se le setea la FK, Usando el JOIN no tenemos nada para comparar entre Reserva y Habitacion */


INSERT INTO [AEFI].[TL_Factura](Numero, Fecha, Total)
SELECT DISTINCT m.Factura_Nro, m.Factura_Fecha, m.Factura_Total
FROM gd_esquema.Maestra m

INSERT INTO [AEFI].[TL_Estadia](Fecha_Inicio, Cantidad_Noches)
SELECT DISTINCT m.Estadia_Fecha_Inicio, m.Estadia_Cant_Noches
FROM gd_esquema.Maestra m

/*FALTA LA PARTE DE REGIMEN*/



COMMIT

INSERT INTO [AEFI].[TL_Cliente] (ID_Usuario, Nombre, Apellido, Mail, Nacionalidad,Fecha_Nacimiento, Direccion)
SELECT u.ID_Usuario, m.Cliente_Nombre, m.Cliente_Apellido, m.Cliente_Mail, m.Cliente_Nacionalidad, m.Cliente_Fecha_Nac, m.Cliente_Dom_Calle+/*' '+m.Cliente_Nro_Calle+' '+m.Cliente_Piso+*/' '+m.Cliente_Depto
FROM gd_esquema.Maestra m, [AEFI].[TL_Usuario] u
WHERE m.Cliente_Nombre+'_'+m.Cliente_Apellido = u.Username