
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_document_statuses table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_statuses_Get_List

AS


				
				SELECT
					[statusID],
					[colorCode],
					[statusName],
					[trackID],
					[orderBy]
				FROM
					[dbo].[lookup_document_statuses]
					
				SELECT @@ROWCOUNT
			


