
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_project_requisite_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_project_requisite_types_Insert
(

	@RequisiteID int    OUTPUT,

	@Requisite varchar (100)  ,

	@OrderBy int   
)
AS


				
				INSERT INTO [dbo].[lookup_project_requisite_types]
					(
					[requisite]
					,[orderBy]
					)
				VALUES
					(
					@Requisite
					,@OrderBy
					)
				
				-- Get the identity value
				SET @RequisiteID = SCOPE_IDENTITY()
									
							
			


