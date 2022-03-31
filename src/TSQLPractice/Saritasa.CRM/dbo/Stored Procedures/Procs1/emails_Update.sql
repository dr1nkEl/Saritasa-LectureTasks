
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Emails table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[emails_Update]
(

	@EmailID int   ,

	@Email varchar (MAX)  ,

	@TargetId bigint   ,

	@TypeId char (2)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Emails]
				SET
					[Email] = @Email
					,[TargetId] = @TargetId
					,[TypeId] = @TypeId
				WHERE
[emailID] = @EmailID