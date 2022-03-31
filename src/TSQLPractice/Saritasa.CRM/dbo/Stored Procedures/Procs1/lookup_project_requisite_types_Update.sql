
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_project_requisite_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_project_requisite_types_Update
(

	@RequisiteID int   ,

	@Requisite varchar (100)  ,

	@OrderBy int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_project_requisite_types]
				SET
					[requisite] = @Requisite
					,[orderBy] = @OrderBy
				WHERE
[requisiteID] = @RequisiteID 
				
			


