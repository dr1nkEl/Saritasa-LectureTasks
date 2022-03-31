
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_note_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_note_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_note_types]
					
				SELECT @@ROWCOUNT
			


