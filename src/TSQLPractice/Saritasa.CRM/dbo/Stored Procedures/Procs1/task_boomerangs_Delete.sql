
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the task_boomerangs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_Delete
(

	@BoomerangID bigint   
)
AS


				DELETE FROM [dbo].[task_boomerangs] WITH (ROWLOCK) 
				WHERE
					[boomerangID] = @BoomerangID
					
			


