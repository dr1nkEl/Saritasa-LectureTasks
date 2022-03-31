
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Employees table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@PreviousEmployment varchar (300)  = null ,

	@ContractSignedAt datetime   = null ,

	@BranchId int   = null ,

	@OnSite bit   = null ,

	@Comments varchar (MAX)  = null ,

	@Photo varchar (70)  = null ,

	@Score int   = null ,

	@DailyReportNotRequired bit   = null ,

	@LastHrmContactAt datetime   = null ,

	@IsPartTime bit   = null ,

	@BucketTaskId bigint   = null ,

	@DefaultBucketJobText varchar (500)  = null ,

	@DefaultBucketTaskTitle varchar (255)  = null ,

	@RecruitedByUserId int   = null ,

	@VendorId int   = null ,

	@RecruitSourceId int   = null ,

	@FirstWorkingDate datetime   = null ,

	@LastWorkingDate datetime   = null ,

	@IsIntern bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [PreviousEmployment]
	, [ContractSignedAt]
	, [BranchId]
	, [OnSite]
	, [Comments]
	, [Photo]
	, [Score]
	, [DailyReportNotRequired]
	, [LastHrmContactAt]
	, [IsPartTime]
	, [BucketTaskId]
	, [DefaultBucketJobText]
	, [DefaultBucketTaskTitle]
	, [RecruitedByUserId]
	, [VendorId]
	, [RecruitSourceId]
	, [FirstWorkingDate]
	, [LastWorkingDate]
	, [IsIntern]
    FROM
	[dbo].[Employees]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([PreviousEmployment] = @PreviousEmployment OR @PreviousEmployment IS NULL)
	AND ([ContractSignedAt] = @ContractSignedAt OR @ContractSignedAt IS NULL)
	AND ([BranchId] = @BranchId OR @BranchId IS NULL)
	AND ([OnSite] = @OnSite OR @OnSite IS NULL)
	AND ([Comments] = @Comments OR @Comments IS NULL)
	AND ([Photo] = @Photo OR @Photo IS NULL)
	AND ([Score] = @Score OR @Score IS NULL)
	AND ([DailyReportNotRequired] = @DailyReportNotRequired OR @DailyReportNotRequired IS NULL)
	AND ([LastHrmContactAt] = @LastHrmContactAt OR @LastHrmContactAt IS NULL)
	AND ([IsPartTime] = @IsPartTime OR @IsPartTime IS NULL)
	AND ([BucketTaskId] = @BucketTaskId OR @BucketTaskId IS NULL)
	AND ([DefaultBucketJobText] = @DefaultBucketJobText OR @DefaultBucketJobText IS NULL)
	AND ([DefaultBucketTaskTitle] = @DefaultBucketTaskTitle OR @DefaultBucketTaskTitle IS NULL)
	AND ([RecruitedByUserId] = @RecruitedByUserId OR @RecruitedByUserId IS NULL)
	AND ([VendorId] = @VendorId OR @VendorId IS NULL)
	AND ([RecruitSourceId] = @RecruitSourceId OR @RecruitSourceId IS NULL)
	AND ([FirstWorkingDate] = @FirstWorkingDate OR @FirstWorkingDate IS NULL)
	AND ([LastWorkingDate] = @LastWorkingDate OR @LastWorkingDate IS NULL)
	AND ([IsIntern] = @IsIntern OR @IsIntern IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [PreviousEmployment]
	, [ContractSignedAt]
	, [BranchId]
	, [OnSite]
	, [Comments]
	, [Photo]
	, [Score]
	, [DailyReportNotRequired]
	, [LastHrmContactAt]
	, [IsPartTime]
	, [BucketTaskId]
	, [DefaultBucketJobText]
	, [DefaultBucketTaskTitle]
	, [RecruitedByUserId]
	, [VendorId]
	, [RecruitSourceId]
	, [FirstWorkingDate]
	, [LastWorkingDate]
	, [IsIntern]
    FROM
	[dbo].[Employees]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([PreviousEmployment] = @PreviousEmployment AND @PreviousEmployment is not null)
	OR ([ContractSignedAt] = @ContractSignedAt AND @ContractSignedAt is not null)
	OR ([BranchId] = @BranchId AND @BranchId is not null)
	OR ([OnSite] = @OnSite AND @OnSite is not null)
	OR ([Comments] = @Comments AND @Comments is not null)
	OR ([Photo] = @Photo AND @Photo is not null)
	OR ([Score] = @Score AND @Score is not null)
	OR ([DailyReportNotRequired] = @DailyReportNotRequired AND @DailyReportNotRequired is not null)
	OR ([LastHrmContactAt] = @LastHrmContactAt AND @LastHrmContactAt is not null)
	OR ([IsPartTime] = @IsPartTime AND @IsPartTime is not null)
	OR ([BucketTaskId] = @BucketTaskId AND @BucketTaskId is not null)
	OR ([DefaultBucketJobText] = @DefaultBucketJobText AND @DefaultBucketJobText is not null)
	OR ([DefaultBucketTaskTitle] = @DefaultBucketTaskTitle AND @DefaultBucketTaskTitle is not null)
	OR ([RecruitedByUserId] = @RecruitedByUserId AND @RecruitedByUserId is not null)
	OR ([VendorId] = @VendorId AND @VendorId is not null)
	OR ([RecruitSourceId] = @RecruitSourceId AND @RecruitSourceId is not null)
	OR ([FirstWorkingDate] = @FirstWorkingDate AND @FirstWorkingDate is not null)
	OR ([LastWorkingDate] = @LastWorkingDate AND @LastWorkingDate is not null)
	OR ([IsIntern] = @IsIntern AND @IsIntern is not null)
	SELECT @@ROWCOUNT			
  END