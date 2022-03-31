
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectWorkAllocation table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_Insert]
(

	@WorkAllocationID int    OUTPUT,

	@ProjectId int   ,

	@WorkTypeId int   ,

	@StartDate datetime   ,

	@FinishDate datetime   ,

	@Hours int   ,

	@RepeatNextMonth bit   ,

	@MonthSelect bit   ,

	@Description varchar (MAX)  ,

	@CreatedBy int   ,

	@CreatedTime datetime   ,

	@ModifiedBy int   ,

	@ModifiedTime datetime   ,

	@RealisticHours int   
)
AS


				
				INSERT INTO [dbo].[ProjectWorkAllocation]
					(
					[ProjectId]
					,[WorkTypeId]
					,[StartDate]
					,[FinishDate]
					,[Hours]
					,[RepeatNextMonth]
					,[MonthSelect]
					,[Description]
					,[CreatedBy]
					,[CreatedTime]
					,[ModifiedBy]
					,[ModifiedTime]
					,[RealisticHours]
					)
				VALUES
					(
					@ProjectId
					,@WorkTypeId
					,@StartDate
					,@FinishDate
					,@Hours
					,@RepeatNextMonth
					,@MonthSelect
					,@Description
					,@CreatedBy
					,@CreatedTime
					,@ModifiedBy
					,@ModifiedTime
					,@RealisticHours
					)
				
				-- Get the identity value
				SET @WorkAllocationID = SCOPE_IDENTITY()