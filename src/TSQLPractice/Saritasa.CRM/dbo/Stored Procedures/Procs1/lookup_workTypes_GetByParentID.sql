
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_workTypes table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_GetByParentID
(

	@ParentID int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[workTypeID],
					[title],
					[parentID],
					[departmentID],
					[deleted]
				FROM
					[dbo].[lookup_workTypes]
				WHERE
					[parentID] = @ParentID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


