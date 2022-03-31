
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Phones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_GetByTypeIDPhoneIDTargetID]
(

	@TypeId char (3)  ,

	@PhoneID int   ,

	@TargetId bigint   
)
AS


				SELECT
					[phoneID],
					[Phone],
					[TargetId],
					[TypeId]
				FROM
					[dbo].[Phones]
				WHERE
					[TypeId] = @TypeId
					AND [phoneID] = @PhoneID
					AND [TargetId] = @TargetId
				SELECT @@ROWCOUNT