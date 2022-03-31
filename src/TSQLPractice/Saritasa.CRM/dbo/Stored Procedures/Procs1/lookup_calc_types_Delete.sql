
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_calc_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calc_types_Delete
(

	@TypeID varchar (20)  
)
AS


				DELETE FROM [dbo].[lookup_calc_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


