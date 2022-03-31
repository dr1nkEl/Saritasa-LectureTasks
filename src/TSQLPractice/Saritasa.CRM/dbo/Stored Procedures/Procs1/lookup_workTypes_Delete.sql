
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_workTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_Delete
(

	@WorkTypeID int   
)
AS


				DELETE FROM [dbo].[lookup_workTypes] WITH (ROWLOCK) 
				WHERE
					[workTypeID] = @WorkTypeID
					
			


