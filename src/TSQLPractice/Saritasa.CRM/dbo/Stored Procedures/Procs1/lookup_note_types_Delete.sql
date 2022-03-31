
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_note_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_note_types_Delete
(

	@TypeID char (2)  
)
AS


				DELETE FROM [dbo].[lookup_note_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


