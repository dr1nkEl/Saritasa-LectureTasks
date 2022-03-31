
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the role_permissions table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.role_permissions_Find
(

	@SearchUsingOR bit   = null ,

	@PermissionID int   = null ,

	@PView bit   = null ,

	@PEdit bit   = null ,

	@PAdd bit   = null ,

	@PDelete bit   = null ,

	@RoleID char (3)  = null ,

	@TypeID char (3)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [permissionID]
	, [pView]
	, [pEdit]
	, [pAdd]
	, [pDelete]
	, [roleID]
	, [typeID]
    FROM
	[dbo].[role_permissions]
    WHERE 
	 ([permissionID] = @PermissionID OR @PermissionID IS NULL)
	AND ([pView] = @PView OR @PView IS NULL)
	AND ([pEdit] = @PEdit OR @PEdit IS NULL)
	AND ([pAdd] = @PAdd OR @PAdd IS NULL)
	AND ([pDelete] = @PDelete OR @PDelete IS NULL)
	AND ([roleID] = @RoleID OR @RoleID IS NULL)
	AND ([typeID] = @TypeID OR @TypeID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [permissionID]
	, [pView]
	, [pEdit]
	, [pAdd]
	, [pDelete]
	, [roleID]
	, [typeID]
    FROM
	[dbo].[role_permissions]
    WHERE 
	 ([permissionID] = @PermissionID AND @PermissionID is not null)
	OR ([pView] = @PView AND @PView is not null)
	OR ([pEdit] = @PEdit AND @PEdit is not null)
	OR ([pAdd] = @PAdd AND @PAdd is not null)
	OR ([pDelete] = @PDelete AND @PDelete is not null)
	OR ([roleID] = @RoleID AND @RoleID is not null)
	OR ([typeID] = @TypeID AND @TypeID is not null)
	SELECT @@ROWCOUNT			
  END
				


