
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Permissions table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_Find]
(

	@SearchUsingOR bit   = null ,

	@PermissionID int   = null ,

	@RoleId char (3)  = null ,

	@RuleId varchar (20)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [permissionID]
	, [RoleId]
	, [RuleId]
    FROM
	[dbo].[Permissions]
    WHERE 
	 ([permissionID] = @PermissionID OR @PermissionID IS NULL)
	AND ([RoleId] = @RoleId OR @RoleId IS NULL)
	AND ([RuleId] = @RuleId OR @RuleId IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [permissionID]
	, [RoleId]
	, [RuleId]
    FROM
	[dbo].[Permissions]
    WHERE 
	 ([permissionID] = @PermissionID AND @PermissionID is not null)
	OR ([RoleId] = @RoleId AND @RoleId is not null)
	OR ([RuleId] = @RuleId AND @RuleId is not null)
	SELECT @@ROWCOUNT			
  END