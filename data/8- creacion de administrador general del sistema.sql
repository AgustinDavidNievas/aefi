USE [GD2C2014]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

BEGIN TRANSACTION
	INSERT INTO [AEFI].[TL_Rol] ([Descripcion]) VALUES ('Administrador General');
	
	INSERT INTO [AEFI].[TL_Usuario] ([Username], [Password])
	VALUES ('admin', 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7');
	
	INSERT INTO [AEFI].[TL_Usuario_Rol]([ID_Rol], [ID_Usuario])
	VALUES (
			(SELECT Id_Rol FROM [AEFI].[TL_Rol] WHERE [Descripcion] = 'Administrador General'),
			(SELECT Id_Usuario FROM [AEFI].[TL_Usuario] WHERE [Username] = 'admin')
);
	
	INSERT INTO [AEFI].[TL_Funcionalidad_Rol] ([ID_Rol], [ID_Funcionalidad])
	(
		SELECT [ID_Rol], [ID_Funcionalidad]
		FROM [AEFI].[TL_Funcionalidad], [AEFI].[TL_Rol] R
		WHERE (R.[Descripcion] = 'Administrador General')
);
COMMIT