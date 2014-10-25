BEGIN TRANSACTION

INSERT INTO [AEFI].[TL_Usuario](username, password)
SELECT m.Cliente_Nombre + '_' + m.Cliente_Apellido, '03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4' /*Borre el DISTINCT para no perder registros */
FROM gd_esquema.Maestra m
WHERE Cliente_Nombre IS NOT NULL;

INSERT INTO AEFI.TL_Cliente(Nombre,Apellido,ID_Tipo_Documento,Documento_Nro,Mail,Calle,Calle_Nro,Piso,Dpto,Fecha_Nacimiento,Nacionalidad,Localidad,PaisOrigen)
SELECT DISTINCT Cliente_Nombre,Cliente_Apellido,'DNI' /*ver si va 'PAS'*/,Cliente_Pasaporte_Nro /*lo tomamos como el nro de pasaporte al nro de doc*/,
Cliente_Mail,Cliente_Dom_Calle,Cliente_Nro_Calle,Cliente_Piso,Cliente_Depto,Cliente_Fecha_Nac,Cliente_Nacionalidad,,'CABA'/*creo la ciudad de bs as para las ciudades por default*/,'Argentina'
FROM gd_esquema.Maestra
WHERE Cliente_Apellido IS NOT NULL AND Cliente_Nombre IS NOT NULL

INSERT INTO [AEFI].[TL_Hotel](Calle,Nro_Calle,Ciudad,Cantidad_Estrellas,Recarga_Estrellas)
SELECT DISTINCT Hotel_Calle, Hotel_Nro_Calle, Hotel_Ciudad, Hotel_CantEstrella, Hotel_Recarga_Estrella
FROM gd_esquema.Maestra

INSERT INTO [AEFI].[TL_Tipo_Habitacion](ID_Tipo_Habitacion,Descripcion,Porcentual)
SELECT DISTINCT Habitacion_Tipo_Codigo, Habitacion_Tipo_Descripcion, Habitacion_Tipo_Porcentual
FROM  gd_esquema.Maestra
WHERE Habitacion_Tipo_Codigo IS NOT NULL

/* me tira error no se si esta bien migracion de reserva */
/*SET IDENTITY_INSERT AEFI.TL_Rerserva ON

INSERT INTO [AEFI].[TL_Reserva] (ID_Reserva, Fecha_Reserva,Cantidad_Noches)
SELECT DISTINCT Reserva_Codigo,Reserva_Fecha_Inicio,Reserva_Cant_Noches
FROM gd_esquema.Maestra

SET IDENTITY_INSERT AEFI.TL_Rerserva OFF
*/

/*TODO: REVEER MIGRACION DE TL HABITACION Y TL TIPO
INSERT INTO [AEFI].[TL_Habitacion] (Numero, Piso, Vista, Tipo_Comodidades, Tipo_Codigo, Tipo_Porcentual)
SELECT DISTINCT m.Habitacion_Numero, m.Habitacion_Piso, m.Habitacion_Frente, m.Habitacion_Tipo_Descripcion, m.Habitacion_Tipo_Codigo, m.Habitacion_Tipo_Porcentual
FROM gd_esquema.Maestra m */

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