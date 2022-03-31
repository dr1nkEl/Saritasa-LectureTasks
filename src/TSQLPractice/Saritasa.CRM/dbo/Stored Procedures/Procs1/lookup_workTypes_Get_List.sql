
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_workTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_Get_List

AS


				
				SELECT
					[workTypeID],
					[title],
					[parentID],
					[departmentID],
					[deleted]
				FROM
					[dbo].[lookup_workTypes]
					
				SELECT @@ROWCOUNT
			


