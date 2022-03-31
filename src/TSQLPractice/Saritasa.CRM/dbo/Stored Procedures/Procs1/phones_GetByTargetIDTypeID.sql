
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Phones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_GetByTargetIDTypeID]
(

	@TargetId bigint   ,

	@TypeId char (3)  
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
					[TargetId] = @TargetId
					AND [TypeId] = @TypeId
				SELECT @@ROWCOUNT