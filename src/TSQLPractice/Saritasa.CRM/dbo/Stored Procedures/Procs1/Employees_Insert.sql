
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Employees table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Employees_Insert
(

	@Id int   ,

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


				
				INSERT INTO [dbo].[Employees]
					(
					[Id]
					,[PreviousEmployment]
					,[ContractSignedAt]
					,[BranchId]
					,[OnSite]
					,[Comments]
					,[Photo]
					,[Score]
					,[DailyReportNotRequired]
					,[LastHrmContactAt]
					,[IsPartTime]
					,[BucketTaskId]
					,[DefaultBucketJobText]
					,[DefaultBucketTaskTitle]
					,[RecruitedByUserId]
					,[VendorId]
					,[RecruitSourceId]
					,[FirstWorkingDate]
					,[LastWorkingDate]
					,[IsIntern]
					)
				VALUES
					(
					@Id
					,@PreviousEmployment
					,@ContractSignedAt
					,@BranchId
					,@OnSite
					,@Comments
					,@Photo
					,@Score
					,@DailyReportNotRequired
					,@LastHrmContactAt
					,@IsPartTime
					,@BucketTaskId
					,@DefaultBucketJobText
					,@DefaultBucketTaskTitle
					,@RecruitedByUserId
					,@VendorId
					,@RecruitSourceId
					,@FirstWorkingDate
					,@LastWorkingDate
					,@IsIntern
					)