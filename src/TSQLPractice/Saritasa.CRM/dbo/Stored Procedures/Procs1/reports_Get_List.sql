
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_Get_List]

AS


				
				SELECT
					[reportID],
					[ClientId],
					[DocumentId],
					[EmailedTo],
					[Email],
					[DateFrom],
					[DateTo]
				FROM
					[dbo].[Reports]
					
				SELECT @@ROWCOUNT