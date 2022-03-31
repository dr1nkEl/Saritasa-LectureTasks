
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectWorkAllocation table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_Find]
(

	@SearchUsingOR bit   = null ,

	@WorkAllocationID int   = null ,

	@ProjectId int   = null ,

	@WorkTypeId int   = null ,

	@StartDate datetime   = null ,

	@FinishDate datetime   = null ,

	@Hours int   = null ,

	@RepeatNextMonth bit   = null ,

	@MonthSelect bit   = null ,

	@Description varchar (MAX)  = null ,

	@CreatedBy int   = null ,

	@CreatedTime datetime   = null ,

	@ModifiedBy int   = null ,

	@ModifiedTime datetime   = null ,

	@RealisticHours int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [workAllocationID]
	, [ProjectId]
	, [WorkTypeId]
	, [StartDate]
	, [FinishDate]
	, [Hours]
	, [RepeatNextMonth]
	, [MonthSelect]
	, [Description]
	, [CreatedBy]
	, [CreatedTime]
	, [ModifiedBy]
	, [ModifiedTime]
	, [RealisticHours]
    FROM
	[dbo].[ProjectWorkAllocation]
    WHERE 
	 ([workAllocationID] = @WorkAllocationID OR @WorkAllocationID IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([WorkTypeId] = @WorkTypeId OR @WorkTypeId IS NULL)
	AND ([StartDate] = @StartDate OR @StartDate IS NULL)
	AND ([FinishDate] = @FinishDate OR @FinishDate IS NULL)
	AND ([Hours] = @Hours OR @Hours IS NULL)
	AND ([RepeatNextMonth] = @RepeatNextMonth OR @RepeatNextMonth IS NULL)
	AND ([MonthSelect] = @MonthSelect OR @MonthSelect IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([CreatedBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([CreatedTime] = @CreatedTime OR @CreatedTime IS NULL)
	AND ([ModifiedBy] = @ModifiedBy OR @ModifiedBy IS NULL)
	AND ([ModifiedTime] = @ModifiedTime OR @ModifiedTime IS NULL)
	AND ([RealisticHours] = @RealisticHours OR @RealisticHours IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [workAllocationID]
	, [ProjectId]
	, [WorkTypeId]
	, [StartDate]
	, [FinishDate]
	, [Hours]
	, [RepeatNextMonth]
	, [MonthSelect]
	, [Description]
	, [CreatedBy]
	, [CreatedTime]
	, [ModifiedBy]
	, [ModifiedTime]
	, [RealisticHours]
    FROM
	[dbo].[ProjectWorkAllocation]
    WHERE 
	 ([workAllocationID] = @WorkAllocationID AND @WorkAllocationID is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([WorkTypeId] = @WorkTypeId AND @WorkTypeId is not null)
	OR ([StartDate] = @StartDate AND @StartDate is not null)
	OR ([FinishDate] = @FinishDate AND @FinishDate is not null)
	OR ([Hours] = @Hours AND @Hours is not null)
	OR ([RepeatNextMonth] = @RepeatNextMonth AND @RepeatNextMonth is not null)
	OR ([MonthSelect] = @MonthSelect AND @MonthSelect is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([CreatedBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([CreatedTime] = @CreatedTime AND @CreatedTime is not null)
	OR ([ModifiedBy] = @ModifiedBy AND @ModifiedBy is not null)
	OR ([ModifiedTime] = @ModifiedTime AND @ModifiedTime is not null)
	OR ([RealisticHours] = @RealisticHours AND @RealisticHours is not null)
	SELECT @@ROWCOUNT			
  END