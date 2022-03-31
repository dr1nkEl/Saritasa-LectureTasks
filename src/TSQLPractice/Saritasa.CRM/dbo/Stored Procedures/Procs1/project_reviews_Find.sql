
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the project_reviews table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_reviews_Find
(

	@SearchUsingOR bit   = null ,

	@ID int   = null ,

	@ProjectID int   = null ,

	@Name varchar (100)  = null ,

	@ScheduledDate datetime   = null ,

	@CreatedBy int   = null ,

	@Created datetime   = null ,

	@ReviewTo int   = null ,

	@ReviewedBy int   = null ,

	@ReviewDate datetime   = null ,

	@UpdatedBy int   = null ,

	@Updated datetime   = null ,

	@Rating int   = null ,

	@Comment text   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [ID]
	, [projectID]
	, [name]
	, [scheduledDate]
	, [createdBy]
	, [created]
	, [reviewTo]
	, [reviewedBy]
	, [reviewDate]
	, [updatedBy]
	, [updated]
	, [rating]
	, [comment]
    FROM
	[dbo].[project_reviews]
    WHERE 
	 ([ID] = @ID OR @ID IS NULL)
	AND ([projectID] = @ProjectID OR @ProjectID IS NULL)
	AND ([name] = @Name OR @Name IS NULL)
	AND ([scheduledDate] = @ScheduledDate OR @ScheduledDate IS NULL)
	AND ([createdBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([created] = @Created OR @Created IS NULL)
	AND ([reviewTo] = @ReviewTo OR @ReviewTo IS NULL)
	AND ([reviewedBy] = @ReviewedBy OR @ReviewedBy IS NULL)
	AND ([reviewDate] = @ReviewDate OR @ReviewDate IS NULL)
	AND ([updatedBy] = @UpdatedBy OR @UpdatedBy IS NULL)
	AND ([updated] = @Updated OR @Updated IS NULL)
	AND ([rating] = @Rating OR @Rating IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [ID]
	, [projectID]
	, [name]
	, [scheduledDate]
	, [createdBy]
	, [created]
	, [reviewTo]
	, [reviewedBy]
	, [reviewDate]
	, [updatedBy]
	, [updated]
	, [rating]
	, [comment]
    FROM
	[dbo].[project_reviews]
    WHERE 
	 ([ID] = @ID AND @ID is not null)
	OR ([projectID] = @ProjectID AND @ProjectID is not null)
	OR ([name] = @Name AND @Name is not null)
	OR ([scheduledDate] = @ScheduledDate AND @ScheduledDate is not null)
	OR ([createdBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([created] = @Created AND @Created is not null)
	OR ([reviewTo] = @ReviewTo AND @ReviewTo is not null)
	OR ([reviewedBy] = @ReviewedBy AND @ReviewedBy is not null)
	OR ([reviewDate] = @ReviewDate AND @ReviewDate is not null)
	OR ([updatedBy] = @UpdatedBy AND @UpdatedBy is not null)
	OR ([updated] = @Updated AND @Updated is not null)
	OR ([rating] = @Rating AND @Rating is not null)
	SELECT @@ROWCOUNT			
  END
				


