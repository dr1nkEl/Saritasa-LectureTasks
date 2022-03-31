
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Employees table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_Update
(

	@Id int   ,

	@OriginalId int   ,

	@PreviousEmployment varchar (300)  ,

	@ContractSignedAt datetime   ,

	@BranchId int   ,

	@OnSite bit   ,

	@Comments varchar (MAX)  ,

	@Photo varchar (70)  ,

	@Score int   ,

	@DailyReportNotRequired bit   ,

	@LastHrmContactAt datetime   ,

	@IsPartTime bit   ,

	@BucketTaskId bigint   ,

	@DefaultBucketJobText varchar (500)  ,

	@DefaultBucketTaskTitle varchar (255)  ,

	@RecruitedByUserId int   ,

	@VendorId int   ,

	@RecruitSourceId int   ,

	@FirstWorkingDate datetime   ,

	@LastWorkingDate datetime   ,

	@IsIntern bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Employees]
				SET
					[Id] = @Id
					,[PreviousEmployment] = @PreviousEmployment
					,[ContractSignedAt] = @ContractSignedAt
					,[BranchId] = @BranchId
					,[OnSite] = @OnSite
					,[Comments] = @Comments
					,[Photo] = @Photo
					,[Score] = @Score
					,[DailyReportNotRequired] = @DailyReportNotRequired
					,[LastHrmContactAt] = @LastHrmContactAt
					,[IsPartTime] = @IsPartTime
					,[BucketTaskId] = @BucketTaskId
					,[DefaultBucketJobText] = @DefaultBucketJobText
					,[DefaultBucketTaskTitle] = @DefaultBucketTaskTitle
					,[RecruitedByUserId] = @RecruitedByUserId
					,[VendorId] = @VendorId
					,[RecruitSourceId] = @RecruitSourceId
					,[FirstWorkingDate] = @FirstWorkingDate
					,[LastWorkingDate] = @LastWorkingDate
					,[IsIntern] = @IsIntern
				WHERE
[Id] = @OriginalId