
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_file_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_file_types_Delete
(

	@TypeID char (2)  
)
AS


				DELETE FROM [dbo].[lookup_file_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


