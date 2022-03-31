
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_project_requisite_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_project_requisite_types_Delete
(

	@RequisiteID int   
)
AS


				DELETE FROM [dbo].[lookup_project_requisite_types] WITH (ROWLOCK) 
				WHERE
					[requisiteID] = @RequisiteID
					
			


