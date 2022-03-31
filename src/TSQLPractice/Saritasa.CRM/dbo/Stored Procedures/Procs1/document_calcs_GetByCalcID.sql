
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_calcs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_GetByCalcID
(

	@CalcID bigint   
)
AS


				SELECT
					[calcID],
					[documentID],
					[typeID],
					[val]
				FROM
					[dbo].[document_calcs]
				WHERE
					[calcID] = @CalcID
				SELECT @@ROWCOUNT
					
			

