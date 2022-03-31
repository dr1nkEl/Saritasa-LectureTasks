
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_phone_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_phone_types_Delete
(

	@TypeID char (3)  
)
AS


				DELETE FROM [dbo].[lookup_phone_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


