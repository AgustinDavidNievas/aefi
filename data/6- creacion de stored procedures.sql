BEGIN TRANSACTION

/* ACTUALIZACIONES/ UPDATES */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [AEFI].[ActualizarUsuarioIntentosFallidos]
	@ID_User int,
	@Intentos_Fallidos int,
	@Activo bit
AS
BEGIN
	UPDATE [AEFI].[TL_Usuario]
	SET Intentos_Fallidos = @Intentos_Fallidos, Activo = @Activo
	WHERE ID_Usuario = @ID_User
END
GO

CREATE PROCEDURE [AEFI].[ActualizarPorIdRol]
	@ID_Rol int,
	@Descripcion nvarchar(255),
	@Activo bit
AS
BEGIN
	UPDATE [AEFI].[TL_Rol]
	SET Descripcion = @Descripcion, Activo = @Activo
	WHERE ID_Rol = @ID_Rol
END
GO

CREATE PROCEDURE [AEFI].[ActualizarPassword]
	@ID_User int,
	@Password nvarchar(64)
AS
BEGIN
	UPDATE [AEFI].[TL_Usuario]
	SET Password = @Password, Pass_Temporal = 0
	WHERE ID_Usuario = @ID_User
END
GO
/* OBTENCION DE DATOS / GETTERS */
CREATE PROCEDURE [AEFI].[ObtenerRolPorDescripcion]
	@Descripcion nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [AEFI].[TL_Rol]
	WHERE LOWER(Descripcion) = LOWER(@Descripcion)
END
GO

CREATE PROCEDURE [AEFI].[ObtenerUsuariosPorUsername]
	@Username varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT *
	FROM [AEFI].[TL_Usuario]
	WHERE [Username] = @Username
	AND [Habilitado] = 1
END
GO

CREATE PROCEDURE [AEFI].[ObtenerUsuarioPorID]
	@Id_Usuario varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT *
	FROM [AEFI].[TL_Usuario]
	WHERE [ID_Usuario] = @Id_Usuario
END
GO

CREATE PROCEDURE [AEFI].[ObtenerTodosLosRolesPorUsuario]
	@ID_User int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [AEFI].[TL_Rol] R
	INNER JOIN [AEFI].[TL_Usuario_Rol] UR ON R.ID_Rol = UR.ID_Rol
	WHERE UR.ID_Usuario = @ID_User
END
GO

CREATE PROCEDURE [AEFI].[ObtenerTodasLasFuncionalidadesPorRol]
	@ID_Rol int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT *
	FROM [AEFI].[TL_Funcionalidad] F
	INNER JOIN [AEFI].[TL_Funcionalidad_Rol] FR ON F.ID_Funcionalidad = FR.ID_Funcionalidad
	WHERE FR.ID_Rol = @ID_Rol 
END
GO

CREATE PROCEDURE [AEFI].[ObtenerTodasLasFuncionalidades]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [AEFI].[TL_Funcionalidad]
END
GO

CREATE PROCEDURE [AEFI].[ObtenerTodosLosRoles]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [AEFI].[TL_Rol]
END
GO

CREATE PROCEDURE [AEFI].[ObtenerTodosLosRolesPorNameLike]
	@Descripcion nvarchar(255)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [AEFI].[TL_Rol]
	WHERE LOWER(Descripcion) LIKE '%' + LOWER(@Descripcion) + '%';
END
GO
/* INSERCIONES DE DATOS / INSERTS */
CREATE PROCEDURE [AEFI].[InsertarFuncionalidadPorRol]
	@ID_Funcionalidad int,
	@ID_Rol int
AS
BEGIN
	INSERT INTO [AEFI].[TL_Funcionalidad_Rol] (ID_Funcionalidad, ID_Rol)
	VALUES (@ID_Funcionalidad, @ID_Rol)
END
GO

CREATE PROCEDURE [AEFI].[InsertarRol]
	@Descripcion nvarchar(255),
	@Activo bit
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [AEFI].[TL_Rol] (Descripcion, Activo)
	OUTPUT inserted.ID_Rol
	VALUES (@Descripcion, @Activo)
END
GO


CREATE PROCEDURE [AEFI].[InsertarUserTemporal]
	@Username nvarchar(255),
	@Password nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [AEFI].[TL_Usuario] (Username, Password, Pass_Temporal)
	OUTPUT inserted.ID_Usuario
	VALUES (@Username, @Password, 1)
END
/*BORRAR INFO / DELETES */
CREATE PROCEDURE [AEFI].[BorrarTodasLasFuncionalidadesPorRol]
	@ID_Rol int
AS
BEGIN
	DELETE FROM [AEFI].[TL_Funcionalidad_Rol] 
	WHERE [ID_Rol] = @ID_Rol 
END
GO

CREATE PROCEDURE [AEFI].[InhabilitarUser]
	@ID_User int
AS
BEGIN
	UPDATE [AEFI].[TL_Usuario]
	SET Habilitado = 0
	WHERE ID_Usuario = @ID_User
END
GO

COMMIT
