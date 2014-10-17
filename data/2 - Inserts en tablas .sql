/*Comienzo de INSERTS */

BEGIN TRANSACTION

INSERT INTO [AEFI].[TL_Tipo_Documento] (Descripcion)
VALUES ('DNI'), ('PA'), ('CUIL'), ('LE');

INSERT INTO [AEFI].[TL_Usuario](Username, Password) 
VALUES ('admin','E6B87050BFCB8143FCB8DB0170A4DC9ED00D904DDD3E2A4AD1B1E8DC0FDC9BE7');


INSERT INTO AEFI.TL_Rol (Descripcion) 
VALUES ('Guest'),('Recepcionista'),('Administrador'), ('AdministradorGeneral');

INSERT INTO [AEFI].[TL_Funcionalidad] (Descripcion)
VALUES ('ABM de Rol'), ('ABM de Usuario'), ('ABM de Cliente (Huespedes)'), ('ABM de Hotel'), ('ABM de Habitacion'), ('ABM de Regimen de Estadia'),
	('Generar o Modificar una Reserva'), ('Cancelar Reserva'), ('Registrar Estadía (check-in/check-out)'), ('Registrar Consumibles'), ('Facturar Estadia'), ('Listado Estadistico');

/* FUNCIONALIDADES DE GUEST */
INSERT INTO [AEFI].[TL_Funcionalidad_Rol](ID_Rol, ID_Funcionalidad)
VALUES (1,7),(1,8);

/*FUNCIONALIDADES DE RECEPCIONISTA*/
INSERT INTO [AEFI].[TL_Funcionalidad_Rol]
VALUES (2,3),(2,7), (2,8), (2,9), (2,10), (2,11);

/*FUNCIONALIDAD DE ADMINISTRADOR*/
INSERT INTO [AEFI].[TL_Funcionalidad_Rol]
VALUES (3,1),(3,2),(3,4),(3,5),(3,6),(3,12);

INSERT INTO [AEFI].[TL_Usuario_Por_Rol] (ID_Rol, ID_Usuario) VALUES (1,1);
COMMIT

/*FIN DE INSERTS */