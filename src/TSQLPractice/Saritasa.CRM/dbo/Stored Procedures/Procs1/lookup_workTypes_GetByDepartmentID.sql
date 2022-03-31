
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_workTypes table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_GetByDepartmentID
(

	@DepartmentID int   
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
					[departmentID] = @DepartmentID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


