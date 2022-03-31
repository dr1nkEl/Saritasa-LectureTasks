
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_workTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_Update
(

	@WorkTypeID int   ,

	@Title varchar (80)  ,

	@ParentID int   ,

	@DepartmentID int   ,

	@Deleted bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_workTypes]
				SET
					[title] = @Title
					,[parentID] = @ParentID
					,[departmentID] = @DepartmentID
					,[deleted] = @Deleted
				WHERE
[workTypeID] = @WorkTypeID 
				
			


