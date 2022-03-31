
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_file_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_file_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_file_types]
					
				SELECT @@ROWCOUNT
			


