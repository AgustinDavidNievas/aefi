BEGIN TRANSACTION

ALTER TABLE [AEFI].[TL_Usuario] ADD CONSTRAINT fk_Reserva_Usuario FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva](ID_Reserva);

/*ALTER TABLE [AEFI].[TL_Reserva] ADD CONSTRAINT fk_Regimen FOREIGN KEY (ID_Regimen) REFERENCES [AEFI].[TL_Regimen](ID_Regimen);*/

ALTER TABLE [AEFI].[TL_Reserva] ADD CONSTRAINT fk_Habitacion FOREIGN KEY (ID_Habitacion) REFERENCES [AEFI].[TL_Habitacion](ID_Habitacion);

ALTER TABLE [AEFI].[TL_Cancelacion] ADD CONSTRAINT fk_Reserva_Cancelacion FOREIGN KEY (ID_Reserva) REFERENCES [AEFI].[TL_Reserva](ID_Reserva);

ALTER TABLE [AEFI].[TL_Cancelacion] ADD CONSTRAINT fk_Usuario_Cancelacion FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

ALTER TABLE [AEFI].[TL_Hotel] ADD CONSTRAINT fk_Usuario_Hotel FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

ALTER TABLE [AEFI].[TL_Cliente] ADD CONSTRAINT fk_Usuario_Cliente FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

/*ALTER TABLE [AEFI].[TL_Cliente] ADD CONSTRAINT fk_Tipo_Documento FOREIGN KEY (ID_Tipo_Documento) REFERENCES [AEFI].[TL_Tipo_Documento](ID_Tipo_Documento); */

ALTER TABLE [AEFI].[TL_Usuario_Rol] ADD CONSTRAINT fk_Rol_Usuario FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol](ID_Rol);

ALTER TABLE [AEFI].[TL_Usuario_Rol] ADD CONSTRAINT fk_Usuario_Rol FOREIGN KEY (ID_Usuario) REFERENCES [AEFI].[TL_Usuario](ID_Usuario);

ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] ADD CONSTRAINT fk_Rol_Funcionalidad FOREIGN KEY (ID_Rol) REFERENCES [AEFI].[TL_Rol](ID_Rol);

ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] ADD CONSTRAINT fk_Funcionalidad FOREIGN KEY (ID_Funcionalidad) REFERENCES [AEFI].[TL_Funcionalidad](ID_Funcionalidad);

/*ALTER TABLE [AEFI].[TL_Factura] ADD CONSTRAINT fk_Forma_Pago FOREIGN KEY (ID_Forma_Pago) REFERENCES [AEFI].[TL_Forma_Pago](ID_Forma_Pago); */


/*Tablas ITEMS, Forma_Pago, Regimen---- Faltan ver */



COMMIT