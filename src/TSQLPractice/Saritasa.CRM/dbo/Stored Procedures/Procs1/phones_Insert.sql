
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Phones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_Insert]
(

	@PhoneID int    OUTPUT,

	@Phone varchar (50)  ,

	@TargetId bigint   ,

	@TypeId char (3)  
)
AS


				
				INSERT INTO [dbo].[Phones]
					(
					[Phone]
					,[TargetId]
					,[TypeId]
					)
				VALUES
					(
					@Phone
					,@TargetId
					,@TypeId
					)
				
				-- Get the identity value
				SET @PhoneID = SCOPE_IDENTITY()