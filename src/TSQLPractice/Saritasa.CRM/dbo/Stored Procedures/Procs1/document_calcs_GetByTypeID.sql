
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_calcs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_GetByTypeID
(

	@TypeID varchar (20)  
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
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


