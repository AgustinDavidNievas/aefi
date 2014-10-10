--dropeo de tablas procedimientos triggers y esquema

/*Drop de las Foreign keys*/




ALTER TABLE [AEFI].[TL_Usuario] DROP CONSTRAINT fk_Reserva_Usuario;
/*ALTER TABLE [AEFI].[TL_Reserva] DROP CONSTRAINT fk_Regimen; */
ALTER TABLE [AEFI].[TL_Reserva] DROP CONSTRAINT fk_Habitacion;
ALTER TABLE [AEFI].[TL_Cancelacion] DROP CONSTRAINT fk_Reserva_Cancelacion;
ALTER TABLE [AEFI].[TL_Cancelacion] DROP CONSTRAINT fk_Usuario_Cancelacion;
ALTER TABLE [AEFI].[TL_Hotel] DROP CONSTRAINT fk_Usuario_Hotel;
/*ALTER TABLE [AEFI].[TL_Cliente] DROP CONSTRAINT fk_Tipo_Documento; */
ALTER TABLE [AEFI].[TL_Cliente] DROP CONSTRAINT fk_Usuario_Cliente; 
ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] DROP CONSTRAINT fk_Funcionalidad;
ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] DROP CONSTRAINT fk_Rol_Funcionalidad;
/*ALTER TABLE [AEFI].[TL_Factura] DROP CONSTRAINT fk_Forma_Pago; */
ALTER TABLE [AEFI].[TL_Usuario_Por_Rol] DROP CONSTRAINT fk_Rol_Usuario;
ALTER TABLE [AEFI].[TL_Usuario_Por_Rol] DROP CONSTRAINT fk_Usuario_Rol;



/* Drop de las Primary Keys*/
ALTER TABLE [AEFI].[TL_Usuario] DROP CONSTRAINT pk_UsuarioID;
ALTER TABLE [AEFI].[TL_Rol] DROP CONSTRAINT pk_RolID;
ALTER TABLE [AEFI].[TL_Funcionalidad] DROP CONSTRAINT pk_FuncionalidadID;
ALTER TABLE [AEFI].[TL_Funcionalidad_Rol] DROP CONSTRAINT pk_Funcionalidad_RolID;
ALTER TABLE [AEFI].[TL_Usuario_Por_Rol] DROP CONSTRAINT pk_Usuario_RolID;
ALTER TABLE [AEFI].[TL_Reserva] DROP CONSTRAINT pk_ReservaID;
ALTER TABLE [AEFI].[TL_Habitacion] DROP CONSTRAINT pk_HabitacionID;
ALTER TABLE [AEFI].[TL_Cancelacion] DROP CONSTRAINT pk_CancelacionID;
ALTER TABLE [AEFI].[TL_Estadia] DROP CONSTRAINT pk_EstadiaID;
ALTER TABLE [AEFI].[TL_Cliente] DROP CONSTRAINT pk_ClienteID;
/*ALTER TABLE [AEFI].[TL_Tipo_Docuemento] DROP CONSTRAINT pk_Tipo_DocumentoID;*/
ALTER TABLE [AEFI].[TL_Factura] DROP CONSTRAINT pk_FacturaID;
ALTER TABLE [AEFI].[TL_Hotel] DROP CONSTRAINT pk_HotelID;
/*ALTER TABLE [AEFI].[TL_Consumibles] DROP CONSTRAINT pk_ConsumiblesID; */

/*mismo problema documento y consumible no existe o no permiso*/





/*Drop de las Tablas*/
DROP TABLE [AEFI].[TL_Funcionalidad_Rol];
DROP TABLE [AEFI].[TL_Funcionalidad];
DROP TABLE [AEFI].[TL_Rol];
DROP TABLE [AEFI].[TL_Usuario_Por_Rol];
DROP TABLE [AEFI].[TL_Usuario];
DROP TABLE [AEFI].[TL_Reserva];
DROP TABLE [AEFI].[TL_Habitacion];
DROP TABLE [AEFI].[TL_Cancelacion];
DROP TABLE [AEFI].[TL_Estadia];
DROP TABLE [AEFI].[TL_Cliente];
/*DROP TABLE [AEFI].[TL_Tipo_Documnto];*/
DROP TABLE [AEFI].[TL_Factura];
DROP TABLE [AEFI].[TL_Hotel];
/*DROP TABLE [AEFI].[TL_Consumbles];

Problema No existe o no permiso*/



DROP SCHEMA [AEFI];

