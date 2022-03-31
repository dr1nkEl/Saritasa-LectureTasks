
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Contacts table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_Update]
(

	@ContactID int   ,

	@UserId int   ,

	@ClientId int   ,

	@Notes varchar (MAX)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Contacts]
				SET
					[UserId] = @UserId
					,[ClientId] = @ClientId
					,[Notes] = @Notes
				WHERE
[contactID] = @ContactID