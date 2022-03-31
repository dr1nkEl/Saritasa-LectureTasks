
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Phones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_GetByTypeIDTargetIDPhoneID]
(

	@TypeId char (3)  ,

	@TargetId bigint   ,

	@PhoneID int   
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
					AND [TargetId] = @TargetId
					AND [phoneID] = @PhoneID
				SELECT @@ROWCOUNT