
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_email_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_email_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_email_types]
					
				SELECT @@ROWCOUNT
			


