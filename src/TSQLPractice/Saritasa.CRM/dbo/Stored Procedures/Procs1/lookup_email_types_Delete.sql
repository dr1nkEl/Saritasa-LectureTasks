
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_email_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_email_types_Delete
(

	@TypeID char (2)  
)
AS


				DELETE FROM [dbo].[lookup_email_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


