
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Contacts table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[contacts_Insert]
(

	@ContactID int    OUTPUT,

	@UserId int   ,

	@ClientId int   ,

	@Notes varchar (MAX)  
)
AS


				
				INSERT INTO [dbo].[Contacts]
					(
					[UserId]
					,[ClientId]
					,[Notes]
					)
				VALUES
					(
					@UserId
					,@ClientId
					,@Notes
					)
				
				-- Get the identity value
				SET @ContactID = SCOPE_IDENTITY()