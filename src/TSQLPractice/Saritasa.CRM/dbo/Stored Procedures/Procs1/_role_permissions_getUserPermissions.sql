CREATE PROCEDURE dbo._role_permissions_getUserPermissions
(

	@UserID int   = null 
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @roles TABLE ( roleid char(3) NOT NULL )
	INSERT INTO @roles (roleid ) select roleid from user_roles where userid=@UserID

	select 
	distinct typeid, 
	case
		when exists(select * from  role_permissions where roleid in (select * from @roles) and pview = 'true' and typeid = rp.typeid)
		then 'true' else 'false'
	end as pview,
	case
		when exists(select * from  role_permissions where roleid in (select * from @roles) and pedit = 'true' and typeid = rp.typeid)
		then 'true' else 'false'
	end as pedit,
	case
		when exists(select * from  role_permissions where roleid in (select * from @roles) and padd = 'true' and typeid = rp.typeid)
		then 'true'	else 'false'
	end as padd,
	case
		when exists(select * from  role_permissions where roleid in (select * from @roles) and pdelete = 'true' and typeid = rp.typeid)
		then 'true'	else 'false'
	end as pdelete
from role_permissions as rp
END