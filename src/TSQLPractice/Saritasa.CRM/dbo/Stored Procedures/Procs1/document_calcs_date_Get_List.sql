
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the document_calcs_date table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_Get_List

AS


				
				SELECT
					[calcID],
					[documentID],
					[typeID],
					[val],
					[date],
					[val2]
				FROM
					[dbo].[document_calcs_date]
					
				SELECT @@ROWCOUNT
			


