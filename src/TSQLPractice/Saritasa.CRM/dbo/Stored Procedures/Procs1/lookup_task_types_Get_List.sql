
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_task_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_task_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_task_types]
					
				SELECT @@ROWCOUNT
			


