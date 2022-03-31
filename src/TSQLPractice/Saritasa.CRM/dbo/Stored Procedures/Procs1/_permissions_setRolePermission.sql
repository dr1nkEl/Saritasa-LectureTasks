CREATE PROCEDURE dbo._permissions_setRolePermission
(

    @roleID char (3)  = null ,

    @ruleID varchar (20)  = null ,

    @set bit   = null 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    --if( !(exists(select * from lookup_document_types where typeid = @TypeID) ) )

    -- Insert statements for procedure here
    if(@set = 0)
            delete from [permissions] where roleid = @roleID and ruleID = @ruleID 
    else
        if(not exists(select * from [permissions] where roleid = @roleID and ruleID = @ruleID ))
            insert into [permissions](roleid, ruleID )
            values(@roleID, @ruleID)
    
END