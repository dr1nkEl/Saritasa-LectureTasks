
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_phone_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_phone_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_phone_types]
					
				SELECT @@ROWCOUNT
			


