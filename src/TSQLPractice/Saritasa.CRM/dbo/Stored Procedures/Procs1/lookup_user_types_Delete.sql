
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_user_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_types_Delete
(

	@TypeID char (2)  
)
AS


				DELETE FROM [dbo].[lookup_user_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


