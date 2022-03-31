
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the project_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_Insert
(

	@ManagerID int    OUTPUT,

	@ProjectID int   ,

	@RoleID char (3)  ,

	@UserID int   
)
AS


				
				INSERT INTO [dbo].[project_managers]
					(
					[projectID]
					,[roleID]
					,[userID]
					)
				VALUES
					(
					@ProjectID
					,@RoleID
					,@UserID
					)
				
				-- Get the identity value
				SET @ManagerID = SCOPE_IDENTITY()
									
							
			


