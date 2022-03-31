
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Events table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Events_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[Events] WITH (ROWLOCK) 
				WHERE
					[id] = @Id
					
			


