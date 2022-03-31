
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_document_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_types_Get_List

AS


				
				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_document_types]
					
				SELECT @@ROWCOUNT
			


