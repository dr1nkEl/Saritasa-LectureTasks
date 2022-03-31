
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_workTypes table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_GetByWorkTypeID
(

	@WorkTypeID int   
)
AS


				SELECT
					[workTypeID],
					[title],
					[parentID],
					[departmentID],
					[deleted]
				FROM
					[dbo].[lookup_workTypes]
				WHERE
					[workTypeID] = @WorkTypeID
				SELECT @@ROWCOUNT
					
			


