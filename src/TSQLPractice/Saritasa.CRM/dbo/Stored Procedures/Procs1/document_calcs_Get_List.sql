
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the document_calcs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_Get_List

AS


				
				SELECT
					[calcID],
					[documentID],
					[typeID],
					[val]
				FROM
					[dbo].[document_calcs]
					
				SELECT @@ROWCOUNT
			


