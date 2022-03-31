
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectPriority table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectPriority_Find]
(

	@SearchUsingOR bit   = null ,

	@PriorityID int   = null ,

	@Name varchar (3)  = null ,

	@Color varchar (6)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [priorityID]
	, [Name]
	, [Color]
    FROM
	[dbo].[ProjectPriority]
    WHERE 
	 ([priorityID] = @PriorityID OR @PriorityID IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
	AND ([Color] = @Color OR @Color IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [priorityID]
	, [Name]
	, [Color]
    FROM
	[dbo].[ProjectPriority]
    WHERE 
	 ([priorityID] = @PriorityID AND @PriorityID is not null)
	OR ([Name] = @Name AND @Name is not null)
	OR ([Color] = @Color AND @Color is not null)
	SELECT @@ROWCOUNT			
  END