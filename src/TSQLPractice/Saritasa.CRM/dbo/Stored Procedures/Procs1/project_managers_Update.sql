
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the project_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_Update
(

	@ManagerID int   ,

	@ProjectID int   ,

	@RoleID char (3)  ,

	@UserID int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[project_managers]
				SET
					[projectID] = @ProjectID
					,[roleID] = @RoleID
					,[userID] = @UserID
				WHERE
[managerID] = @ManagerID 
				
			


