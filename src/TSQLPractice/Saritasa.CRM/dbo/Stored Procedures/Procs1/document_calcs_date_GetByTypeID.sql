
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_calcs_date table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_GetByTypeID
(

	@TypeID varchar (20)  
)
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
				WHERE
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


