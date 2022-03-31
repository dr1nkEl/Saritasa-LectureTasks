
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Jobs table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_Find]
(

	@SearchUsingOR bit   = null ,

	@JobID bigint   = null ,

	@Billable bit   = null ,

	@Description nvarchar (4000)  = null ,

	@Duration int   = null ,

	@TargetId bigint   = null ,

	@CreatedBy int   = null ,

	@ClientId int   = null ,

	@ProjectId int   = null ,

	@JobDate date   = null ,

	@IsError tinyint   = null ,

	@ErrorBy int   = null ,

	@ErrorReason varchar (100)  = null ,

	@WorkType int   = null ,

	@UpdatedAt datetime   = null ,

	@JobType nvarchar (150)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [jobID]
	, [Billable]
	, [Description]
	, [Duration]
	, [TargetId]
	, [CreatedBy]
	, [ClientId]
	, [ProjectId]
	, [JobDate]
	, [IsError]
	, [ErrorBy]
	, [ErrorReason]
	, [WorkType]
	, [UpdatedAt]
	, [JobType]
    FROM
	[dbo].[Jobs]
    WHERE 
	 ([jobID] = @JobID OR @JobID IS NULL)
	AND ([Billable] = @Billable OR @Billable IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([Duration] = @Duration OR @Duration IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([CreatedBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([ClientId] = @ClientId OR @ClientId IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([JobDate] = @JobDate OR @JobDate IS NULL)
	AND ([IsError] = @IsError OR @IsError IS NULL)
	AND ([ErrorBy] = @ErrorBy OR @ErrorBy IS NULL)
	AND ([ErrorReason] = @ErrorReason OR @ErrorReason IS NULL)
	AND ([WorkType] = @WorkType OR @WorkType IS NULL)
	AND ([UpdatedAt] = @UpdatedAt OR @UpdatedAt IS NULL)
	AND ([JobType] = @JobType OR @JobType IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [jobID]
	, [Billable]
	, [Description]
	, [Duration]
	, [TargetId]
	, [CreatedBy]
	, [ClientId]
	, [ProjectId]
	, [JobDate]
	, [IsError]
	, [ErrorBy]
	, [ErrorReason]
	, [WorkType]
	, [UpdatedAt]
	, [JobType]
    FROM
	[dbo].[Jobs]
    WHERE 
	 ([jobID] = @JobID AND @JobID is not null)
	OR ([Billable] = @Billable AND @Billable is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([Duration] = @Duration AND @Duration is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([CreatedBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([ClientId] = @ClientId AND @ClientId is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([JobDate] = @JobDate AND @JobDate is not null)
	OR ([IsError] = @IsError AND @IsError is not null)
	OR ([ErrorBy] = @ErrorBy AND @ErrorBy is not null)
	OR ([ErrorReason] = @ErrorReason AND @ErrorReason is not null)
	OR ([WorkType] = @WorkType AND @WorkType is not null)
	OR ([UpdatedAt] = @UpdatedAt AND @UpdatedAt is not null)
	OR ([JobType] = @JobType AND @JobType is not null)
	SELECT @@ROWCOUNT			
  END