
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the jobs_stat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_Insert
(

	@JobStatID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[jobs_stat]
					(
					[billable]
					,[overbudget]
					,[inhouse]
					,[unutilized]
					,[admin]
					,[capacityTotal]
					,[capacityBillable]
					,[utilization]
					,[periodType]
					,[branchID]
					,[departmentID]
					,[date]
					,[capacityTotalReal]
					,[capacityBillableReal]
					,[capacityBillableTodayReal]
					,[workTypeID]
					)
				VALUES
					(
					@Billable
					,@Overbudget
					,@Inhouse
					,@Unutilized
					,@Admin
					,@CapacityTotal
					,@CapacityBillable
					,@Utilization
					,@PeriodType
					,@BranchID
					,@DepartmentID
					,@Date
					,@CapacityTotalReal
					,@CapacityBillableReal
					,@CapacityBillableTodayReal
					,@WorkTypeID
					)
				
				-- Get the identity value
				SET @JobStatID = SCOPE_IDENTITY()
									
							
			


