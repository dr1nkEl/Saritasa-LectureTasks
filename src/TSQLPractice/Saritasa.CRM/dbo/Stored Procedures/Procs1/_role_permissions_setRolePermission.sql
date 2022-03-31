CREATE PROCEDURE dbo._role_permissions_setRolePermission
(

    @RoleID char (3)  = null ,

    @TypeID char (3)  = null ,

    @Pview bit   = null ,

    @Padd bit   = null ,

    @Pedit bit   = null ,

    @Pdelete bit   = null 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    --if( !(exists(select * from lookup_document_types where typeid = @TypeID) ) )

    -- Insert statements for procedure here
    if(exists(select * from role_permissions where typeid = @TypeID and roleid = @RoleID))
        update role_permissions
        set 
            pview = @Pview,
            padd = @Padd,
            pedit = @Pedit,
            pdelete = @Pdelete 
        where typeid = @TypeID and roleid = @RoleID
    else
        insert into role_permissions(typeid, roleid, pview,padd ,pedit ,pdelete )
        values(@TypeID, @RoleID, @Pview,@Padd,@Pedit,@Pdelete )
END