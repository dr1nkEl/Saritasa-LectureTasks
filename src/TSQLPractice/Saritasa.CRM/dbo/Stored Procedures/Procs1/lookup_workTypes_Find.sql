
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_workTypes table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_workTypes_Find
(

	@SearchUsingOR bit   = null ,

	@WorkTypeID int   = null ,

	@Title varchar (80)  = null ,

	@ParentID int   = null ,

	@DepartmentID int   = null ,

	@Deleted bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [workTypeID]
	, [title]
	, [parentID]
	, [departmentID]
	, [deleted]
    FROM
	[dbo].[lookup_workTypes]
    WHERE 
	 ([workTypeID] = @WorkTypeID OR @WorkTypeID IS NULL)
	AND ([title] = @Title OR @Title IS NULL)
	AND ([parentID] = @ParentID OR @ParentID IS NULL)
	AND ([departmentID] = @DepartmentID OR @DepartmentID IS NULL)
	AND ([deleted] = @Deleted OR @Deleted IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [workTypeID]
	, [title]
	, [parentID]
	, [departmentID]
	, [deleted]
    FROM
	[dbo].[lookup_workTypes]
    WHERE 
	 ([workTypeID] = @WorkTypeID AND @WorkTypeID is not null)
	OR ([title] = @Title AND @Title is not null)
	OR ([parentID] = @ParentID AND @ParentID is not null)
	OR ([departmentID] = @DepartmentID AND @DepartmentID is not null)
	OR ([deleted] = @Deleted AND @Deleted is not null)
	SELECT @@ROWCOUNT			
  END
				


