
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the client_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_Update
(

	@CmID int   ,

	@ClientID int   ,

	@RoleID char (3)  ,

	@EmployeeUserID int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[client_managers]
				SET
					[clientID] = @ClientID
					,[roleID] = @RoleID
					,[employeeUserID] = @EmployeeUserID
				WHERE
[cmID] = @CmID 
				
			


