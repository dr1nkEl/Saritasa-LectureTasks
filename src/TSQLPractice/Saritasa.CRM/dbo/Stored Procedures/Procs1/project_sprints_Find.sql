
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the project_sprints table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_Find
(

	@SearchUsingOR bit   = null ,

	@ID int   = null ,

	@DocumentID bigint   = null ,

	@ProjectID int   = null ,

	@Name varchar (50)  = null ,

	@Limit int   = null ,

	@StartDate datetime   = null ,

	@FinishDate datetime   = null ,

	@Description varchar (MAX)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ID]
	, [documentID]
	, [projectID]
	, [name]
	, [limit]
	, [startDate]
	, [finishDate]
	, [description]
    FROM
	[dbo].[project_sprints]
    WHERE 
	 ([ID] = @ID OR @ID IS NULL)
	AND ([documentID] = @DocumentID OR @DocumentID IS NULL)
	AND ([projectID] = @ProjectID OR @ProjectID IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([limit] = @Limit OR @Limit IS NULL)
	AND ([startDate] = @StartDate OR @StartDate IS NULL)
	AND ([finishDate] = @FinishDate OR @FinishDate IS NULL)
	AND ([description] = @Description OR @Description IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ID]
	, [documentID]
	, [projectID]
	, [name]
	, [limit]
	, [startDate]
	, [finishDate]
	, [description]
    FROM
	[dbo].[project_sprints]
    WHERE 
	 ([ID] = @ID AND @ID is not null)
	OR ([documentID] = @DocumentID AND @DocumentID is not null)
	OR ([projectID] = @ProjectID AND @ProjectID is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([limit] = @Limit AND @Limit is not null)
	OR ([startDate] = @StartDate AND @StartDate is not null)
	OR ([finishDate] = @FinishDate AND @FinishDate is not null)
	OR ([description] = @Description AND @Description is not null)
	SELECT @@ROWCOUNT			
  END
				


