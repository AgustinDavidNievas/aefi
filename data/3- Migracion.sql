BEGIN TRANSACTION

INSERT INTO [AEFI].[TL_Hotel] (Calle, Ciudad, Cantidad_Estrellas, Nro_Calle, Recarga_Estrella)
SELECT DISTINCT m.Hotel_Calle, m.Hotel_Ciudad, m.Hotel_CantEstrella, m.Hotel_Nro_Calle, m.Hotel_Recarga_Estrella
FROM gd_esquema.Maestra m
/*Falta  join de tipo regimenes*/


INSERT INTO [AEFI].[TL_Habitacion] (Numero, Piso, Vista, Tipo_Comodidades, Tipo_Codigo, Tipo_Porcentual)
SELECT DISTINCT m.Habitacion_Numero, m.Habitacion_Piso, m.Habitacion_Frente, m.Habitacion_Tipo_Descripcion, m.Habitacion_Tipo_Codigo, m.Habitacion_Tipo_Porcentual
FROM gd_esquema.Maestra m
/*Falta ver que seria Tipo_Habitacion */


INSERT INTO [AEFI].[TL_Reserva] (Fecha_Desde, Codigo_Reserva, Cantidad_Noches, ID_Habitacion)
SELECT DISTINCT m.Reserva_Fecha_Inicio, m.Reserva_Codigo, m.Reserva_Cant_Noches, h.ID_Habitacion
FROM gd_esquema.Maestra m
JOIN AEFI.TL_Habitacion h ON (m.Habitacion_Numero = h.Numero)


INSERT INTO [AEFI].[TL_Factura](Numero, Fecha, Total)
SELECT DISTINCT m.Factura_Nro, m.Factura_Fecha, m.Factura_Total
FROM gd_esquema.Maestra m

INSERT INTO [AEFI].[TL_Estadia](Fecha_Inicio, Cantidad_Noches)
SELECT DISTINCT m.Estadia_Fecha_Inicio, m.Estadia_Cant_Noches
FROM gd_esquema.Maestra m

INSERT INTO [AEFI].[TL_Regimen](Descripcion, Precio_Base)
SELECT DISTINCT m.Regimen_Descripcion, m.Regimen_Precio
FROM gd_esquema.Maestra m


INSERT INTO [AEFI].[TL_Cliente] (ID_Tipo_Document, Nro_Documento, Nombre, Apellido, Mail, Fecha_Nacimiento, Direccion)
SELECT DISTINCT 2, m.Cliente_Pasaporte_Nro, m.Cliente_Nombre, m.Cliente_Apellido, m.Cliente_Mail, m.Cliente_Fecha_Nac, m.Cliente_Dom_Calle+/*' '+m.Cliente_Nro_Calle+' '+m.Cliente_Piso+*/' '+m.Cliente_Depto
FROM gd_esquema.Maestra m 
WHERE m.Cliente_Pasaporte_Nro IS NOT NULL;

INSERT INTO [AEFI].[TL_Reserva] (Fecha_Desde, Codigo_Reserva, Cantidad_Noches, ID_Cliente, ID_Regimen)
SELECT DISTINCT   m.Reserva_Fecha_Inicio, m.Reserva_Codigo, m.Reserva_Cant_Noches, c.ID_Cliente, r.ID_Regimen
FROM gd_esquema.Maestra m
JOIN [AEFI].[TL_Cliente] c ON (c.Documento = m.Cliente_Pasaporte_Nro)
JOIN [AEFI].[TL_Regimen] r ON (r.Descripcion = m.Regimen_Descripcion)

COMMIT