
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the jobs_stat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_Update
(

	@JobStatID bigint   ,

	@Billable decimal (9, 2)  ,

	@Overbudget decimal (9, 2)  ,

	@Inhouse decimal (9, 2)  ,

	@Unutilized decimal (9, 2)  ,

	@Admin decimal (9, 2)  ,

	@CapacityTotal decimal (9, 2)  ,

	@CapacityBillable decimal (9, 2)  ,

	@Utilization decimal (9, 2)  ,

	@PeriodType char (1)  ,

	@BranchID int   ,

	@DepartmentID int   ,

	@Date datetime   ,

	@CapacityTotalReal decimal (9, 2)  ,

	@CapacityBillableReal decimal (9, 2)  ,

	@CapacityBillableTodayReal decimal (9, 2)  ,

	@WorkTypeID int   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[jobs_stat]
				SET
					[billable] = @Billable
					,[overbudget] = @Overbudget
					,[inhouse] = @Inhouse
					,[unutilized] = @Unutilized
					,[admin] = @Admin
					,[capacityTotal] = @CapacityTotal
					,[capacityBillable] = @CapacityBillable
					,[utilization] = @Utilization
					,[periodType] = @PeriodType
					,[branchID] = @BranchID
					,[departmentID] = @DepartmentID
					,[date] = @Date
					,[capacityTotalReal] = @CapacityTotalReal
					,[capacityBillableReal] = @CapacityBillableReal
					,[capacityBillableTodayReal] = @CapacityBillableTodayReal
					,[workTypeID] = @WorkTypeID
				WHERE
[jobStatID] = @JobStatID 
				
			


