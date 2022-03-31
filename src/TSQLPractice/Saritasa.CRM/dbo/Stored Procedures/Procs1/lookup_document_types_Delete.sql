
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_document_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_types_Delete
(

	@TypeID char (3)  
)
AS


				DELETE FROM [dbo].[lookup_document_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


