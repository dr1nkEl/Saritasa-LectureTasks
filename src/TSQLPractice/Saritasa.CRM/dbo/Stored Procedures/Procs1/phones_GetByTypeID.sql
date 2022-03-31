
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Phones table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[phones_GetByTypeID]
(

	@TypeId char (3)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[phoneID],
					[Phone],
					[TargetId],
					[TypeId]
				FROM
					[dbo].[Phones]
				WHERE
					[TypeId] = @TypeId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON