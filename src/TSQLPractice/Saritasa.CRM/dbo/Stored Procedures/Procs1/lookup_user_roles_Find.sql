
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_user_roles table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_Find
(

	@SearchUsingOR bit   = null ,

	@RoleID char (3)  = null ,

	@RoleName varchar (55)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [roleID]
	, [roleName]
    FROM
	[dbo].[lookup_user_roles]
    WHERE 
	 ([roleID] = @RoleID OR @RoleID IS NULL)
	AND ([roleName] = @RoleName OR @RoleName IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [roleID]
	, [roleName]
    FROM
	[dbo].[lookup_user_roles]
    WHERE 
	 ([roleID] = @RoleID AND @RoleID is not null)
	OR ([roleName] = @RoleName AND @RoleName is not null)
	SELECT @@ROWCOUNT			
  END
				


