
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_calc_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calc_types_Get_List

AS


				
				SELECT
					[typeID],
					[Description]
				FROM
					[dbo].[lookup_calc_types]
					
				SELECT @@ROWCOUNT
			


