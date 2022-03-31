
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the project_managers table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_Find
(

	@SearchUsingOR bit   = null ,

	@ManagerID int   = null ,

	@ProjectID int   = null ,

	@RoleID char (3)  = null ,

	@UserID int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [managerID]
	, [projectID]
	, [roleID]
	, [userID]
    FROM
	[dbo].[project_managers]
    WHERE 
	 ([managerID] = @ManagerID OR @ManagerID IS NULL)
	AND ([projectID] = @ProjectID OR @ProjectID IS NULL)
	AND ([roleID] = @RoleID OR @RoleID IS NULL)
	AND ([userID] = @UserID OR @UserID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [managerID]
	, [projectID]
	, [roleID]
	, [userID]
    FROM
	[dbo].[project_managers]
    WHERE 
	 ([managerID] = @ManagerID AND @ManagerID is not null)
	OR ([projectID] = @ProjectID AND @ProjectID is not null)
	OR ([roleID] = @RoleID AND @RoleID is not null)
	OR ([userID] = @UserID AND @UserID is not null)
	SELECT @@ROWCOUNT			
  END
				


