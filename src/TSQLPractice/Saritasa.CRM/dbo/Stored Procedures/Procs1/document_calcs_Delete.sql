
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the document_calcs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_Delete
(

	@CalcID bigint   
)
AS


				DELETE FROM [dbo].[document_calcs] WITH (ROWLOCK) 
				WHERE
					[calcID] = @CalcID
					
			

