
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the client_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_Insert
(

	@CmID int    OUTPUT,

	@ClientID int   ,

	@RoleID char (3)  ,

	@EmployeeUserID int   
)
AS


				
				INSERT INTO [dbo].[client_managers]
					(
					[clientID]
					,[roleID]
					,[employeeUserID]
					)
				VALUES
					(
					@ClientID
					,@RoleID
					,@EmployeeUserID
					)
				
				-- Get the identity value
				SET @CmID = SCOPE_IDENTITY()
									
							
			


