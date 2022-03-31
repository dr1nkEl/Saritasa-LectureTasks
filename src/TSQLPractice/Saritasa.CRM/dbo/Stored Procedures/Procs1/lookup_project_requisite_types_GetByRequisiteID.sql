
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_project_requisite_types table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_project_requisite_types_GetByRequisiteID
(

	@RequisiteID int   
)
AS


				SELECT
					[requisiteID],
					[requisite],
					[orderBy]
				FROM
					[dbo].[lookup_project_requisite_types]
				WHERE
					[requisiteID] = @RequisiteID
				SELECT @@ROWCOUNT
					
			


