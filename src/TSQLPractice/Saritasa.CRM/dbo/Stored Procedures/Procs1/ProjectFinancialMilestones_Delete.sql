
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the ProjectFinancialMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_Delete
(

	@Id int   
)
AS


				DELETE FROM [dbo].[ProjectFinancialMilestones] WITH (ROWLOCK) 
				WHERE
					[Id] = @Id