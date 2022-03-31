
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tags table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_GetByTagID]
(

	@TagID bigint   
)
AS


				SELECT
					[tagID],
					[Title]
				FROM
					[dbo].[Tags]
				WHERE
					[tagID] = @TagID
				SELECT @@ROWCOUNT