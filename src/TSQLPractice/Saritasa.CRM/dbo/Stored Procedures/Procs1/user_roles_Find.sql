
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the user_roles table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_Find
(

	@SearchUsingOR bit   = null ,

	@UserRoleID int   = null ,

	@RoleID char (3)  = null ,

	@UserID int   = null ,

	@Created datetime   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [userRoleID]
	, [roleID]
	, [userID]
	, [created]
    FROM
	[dbo].[user_roles]
    WHERE 
	 ([userRoleID] = @UserRoleID OR @UserRoleID IS NULL)
	AND ([roleID] = @RoleID OR @RoleID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
	AND ([created] = @Created OR @Created IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [userRoleID]
	, [roleID]
	, [userID]
	, [created]
    FROM
	[dbo].[user_roles]
    WHERE 
	 ([userRoleID] = @UserRoleID AND @UserRoleID is not null)
	OR ([roleID] = @RoleID AND @RoleID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	OR ([created] = @Created AND @Created is not null)
	SELECT @@ROWCOUNT			
  END
				


