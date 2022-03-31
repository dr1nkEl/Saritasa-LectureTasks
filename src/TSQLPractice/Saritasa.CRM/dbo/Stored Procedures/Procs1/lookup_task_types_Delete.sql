
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_task_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_task_types_Delete
(

	@TypeID char (2)  
)
AS


				DELETE FROM [dbo].[lookup_task_types] WITH (ROWLOCK) 
				WHERE
					[typeID] = @TypeID
					
			


