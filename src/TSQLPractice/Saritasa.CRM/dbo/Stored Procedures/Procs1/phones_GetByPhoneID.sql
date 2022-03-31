
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Phones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_GetByPhoneID]
(

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
					[phoneID] = @PhoneID
				SELECT @@ROWCOUNT