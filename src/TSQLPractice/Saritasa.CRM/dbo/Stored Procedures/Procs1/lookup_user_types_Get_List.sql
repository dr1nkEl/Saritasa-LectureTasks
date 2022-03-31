
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_user_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_user_types]
					
				SELECT @@ROWCOUNT
			


