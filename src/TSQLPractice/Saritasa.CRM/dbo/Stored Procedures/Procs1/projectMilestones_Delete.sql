
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_Delete]
(

	@Id int   
)
AS


				DELETE FROM [dbo].[ProjectMilestones] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id