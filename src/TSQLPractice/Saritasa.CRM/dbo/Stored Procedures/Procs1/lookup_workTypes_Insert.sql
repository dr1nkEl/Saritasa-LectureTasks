
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_workTypes table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_Insert
(

	@WorkTypeID int    OUTPUT,

	@Title varchar (80)  ,

	@ParentID int   ,

	@DepartmentID int   ,

	@Deleted bit   
)
AS


				
				INSERT INTO [dbo].[lookup_workTypes]
					(
					[title]
					,[parentID]
					,[departmentID]
					,[deleted]
					)
				VALUES
					(
					@Title
					,@ParentID
					,@DepartmentID
					,@Deleted
					)
				
				-- Get the identity value
				SET @WorkTypeID = SCOPE_IDENTITY()
									
							
			


