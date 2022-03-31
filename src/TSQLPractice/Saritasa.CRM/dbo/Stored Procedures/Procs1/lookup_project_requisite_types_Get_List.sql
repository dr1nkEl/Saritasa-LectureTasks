
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_project_requisite_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_project_requisite_types_Get_List

AS


				
				SELECT
					[requisiteID],
					[requisite],
					[orderBy]
				FROM
					[dbo].[lookup_project_requisite_types]
					
				SELECT @@ROWCOUNT
			


