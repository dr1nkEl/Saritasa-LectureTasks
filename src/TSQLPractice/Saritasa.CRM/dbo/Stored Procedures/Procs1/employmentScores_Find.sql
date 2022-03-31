
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the EmploymentScores table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[employmentScores_Find]
(

	@SearchUsingOR bit   = null ,

	@ScoreID bigint   = null ,

	@UserId int   = null ,

	@Points smallint   = null ,

	@CreatedBy int   = null ,

	@Created datetime   = null ,

	@Description varchar (MAX)  = null ,

	@UseForRotation bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [scoreID]
	, [UserId]
	, [Points]
	, [CreatedBy]
	, [Created]
	, [Description]
	, [UseForRotation]
    FROM
	[dbo].[EmploymentScores]
    WHERE 
	 ([scoreID] = @ScoreID OR @ScoreID IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Points] = @Points OR @Points IS NULL)
	AND ([CreatedBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([Created] = @Created OR @Created IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([UseForRotation] = @UseForRotation OR @UseForRotation IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [scoreID]
	, [UserId]
	, [Points]
	, [CreatedBy]
	, [Created]
	, [Description]
	, [UseForRotation]
    FROM
	[dbo].[EmploymentScores]
    WHERE 
	 ([scoreID] = @ScoreID AND @ScoreID is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Points] = @Points AND @Points is not null)
	OR ([CreatedBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([Created] = @Created AND @Created is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([UseForRotation] = @UseForRotation AND @UseForRotation is not null)
	SELECT @@ROWCOUNT			
  END