
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Jobs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_Update]
(

	@JobID bigint   ,

	@Billable bit   ,

	@Description nvarchar (4000)  ,

	@Duration int   ,

	@TargetId bigint   ,

	@CreatedBy int   ,

	@ClientId int   ,

	@ProjectId int   ,

	@JobDate date   ,

	@IsError tinyint   ,

	@ErrorBy int   ,

	@ErrorReason varchar (100)  ,

	@WorkType int   ,

	@UpdatedAt datetime   ,

	@JobType nvarchar (150)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Jobs]
				SET
					[Billable] = @Billable
					,[Description] = @Description
					,[Duration] = @Duration
					,[TargetId] = @TargetId
					,[CreatedBy] = @CreatedBy
					,[ClientId] = @ClientId
					,[ProjectId] = @ProjectId
					,[JobDate] = @JobDate
					,[IsError] = @IsError
					,[ErrorBy] = @ErrorBy
					,[ErrorReason] = @ErrorReason
					,[WorkType] = @WorkType
					,[UpdatedAt] = @UpdatedAt
					,[JobType] = @JobType
				WHERE
[jobID] = @JobID