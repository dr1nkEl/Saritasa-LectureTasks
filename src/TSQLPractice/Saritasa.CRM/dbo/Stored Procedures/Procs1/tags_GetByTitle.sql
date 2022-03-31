
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Tags table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[tags_GetByTitle]
(

	@Title varchar (255)  
)
AS


				SELECT
					[tagID],
					[Title]
				FROM
					[dbo].[Tags]
				WHERE
					[Title] = @Title
				SELECT @@ROWCOUNT