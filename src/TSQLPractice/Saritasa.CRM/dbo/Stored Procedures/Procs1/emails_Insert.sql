
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Emails table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_Insert]
(

	@EmailID int    OUTPUT,

	@Email varchar (MAX)  ,

	@TargetId bigint   ,

	@TypeId char (2)  
)
AS


				
				INSERT INTO [dbo].[Emails]
					(
					[Email]
					,[TargetId]
					,[TypeId]
					)
				VALUES
					(
					@Email
					,@TargetId
					,@TypeId
					)
				
				-- Get the identity value
				SET @EmailID = SCOPE_IDENTITY()