
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Phones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_Update]
(

	@PhoneID int   ,

	@Phone varchar (50)  ,

	@TargetId bigint   ,

	@TypeId char (3)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Phones]
				SET
					[Phone] = @Phone
					,[TargetId] = @TargetId
					,[TypeId] = @TypeId
				WHERE
[phoneID] = @PhoneID