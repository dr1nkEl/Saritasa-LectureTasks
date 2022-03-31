
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the LookupDepartments table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupDepartments_Get_List

AS


				
				SELECT
					[Id],
					[name],
					[utilization],
					[deleted]
				FROM
					[dbo].[LookupDepartments]
					
				SELECT @@ROWCOUNT