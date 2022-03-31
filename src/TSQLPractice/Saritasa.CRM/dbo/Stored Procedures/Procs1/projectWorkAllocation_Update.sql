
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectWorkAllocation table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectWorkAllocation_Update]
(

	@WorkAllocationID int   ,

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


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectWorkAllocation]
				SET
					[ProjectId] = @ProjectId
					,[WorkTypeId] = @WorkTypeId
					,[StartDate] = @StartDate
					,[FinishDate] = @FinishDate
					,[Hours] = @Hours
					,[RepeatNextMonth] = @RepeatNextMonth
					,[MonthSelect] = @MonthSelect
					,[Description] = @Description
					,[CreatedBy] = @CreatedBy
					,[CreatedTime] = @CreatedTime
					,[ModifiedBy] = @ModifiedBy
					,[ModifiedTime] = @ModifiedTime
					,[RealisticHours] = @RealisticHours
				WHERE
[workAllocationID] = @WorkAllocationID