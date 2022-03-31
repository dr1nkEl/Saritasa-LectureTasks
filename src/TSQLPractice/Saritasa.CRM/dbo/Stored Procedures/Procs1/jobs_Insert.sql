
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Jobs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[jobs_Insert]
(

	@JobID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[Jobs]
					(
					[Billable]
					,[Description]
					,[Duration]
					,[TargetId]
					,[CreatedBy]
					,[ClientId]
					,[ProjectId]
					,[JobDate]
					,[IsError]
					,[ErrorBy]
					,[ErrorReason]
					,[WorkType]
					,[UpdatedAt]
					,[JobType]
					)
				VALUES
					(
					@Billable
					,@Description
					,@Duration
					,@TargetId
					,@CreatedBy
					,@ClientId
					,@ProjectId
					,@JobDate
					,@IsError
					,@ErrorBy
					,@ErrorReason
					,@WorkType
					,@UpdatedAt
					,@JobType
					)
				
				-- Get the identity value
				SET @JobID = SCOPE_IDENTITY()