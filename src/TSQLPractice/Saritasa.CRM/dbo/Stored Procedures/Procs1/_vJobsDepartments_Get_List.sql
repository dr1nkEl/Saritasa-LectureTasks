
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vJobsDepartments view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsDepartments_Get_List

AS


				
				SELECT
					[projectID],
					[departmentID],
					[departmentName],
					[jobDate],
					[duration],
					[billableDuration],
					[durationWithJobRounding],
					[billableWithJobRounding]
				FROM
					[dbo].[_vJobsDepartments]
					
				SELECT @@ROWCOUNT			
			


