CREATE PROCEDURE dbo._role_permissions_AddFirstPermissionForRole
(
	@RoleID char (3)  = null 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	exec _role_permissions_setRolePermission @RoleID, 'F', 'true','true','true','true'
	exec _role_permissions_setRolePermission @RoleID, 'FOL', 'true','true','true','true'
	exec _role_permissions_setRolePermission @RoleID, 'N', 'true','true','true','true'
	exec _role_permissions_setRolePermission @RoleID, 'T', 'true','true','true','true'
END