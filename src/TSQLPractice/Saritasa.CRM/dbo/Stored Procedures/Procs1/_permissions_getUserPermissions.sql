CREATE PROCEDURE dbo._permissions_getUserPermissions
(

	@UserID int   = null 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select distinct ruleid from [permissions] 
	where roleid in (select roleid from user_roles where userid=@UserID)

END