
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the document_calcs_date table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_Delete
(

	@CalcID bigint   
)
AS


				DELETE FROM [dbo].[document_calcs_date] WITH (ROWLOCK) 
				WHERE
					[calcID] = @CalcID
					
			


