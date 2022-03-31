
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the jobs_stat table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_Find
(

	@SearchUsingOR bit   = null ,

	@JobStatID bigint   = null ,

	@Billable decimal (9, 2)  = null ,

	@Overbudget decimal (9, 2)  = null ,

	@Inhouse decimal (9, 2)  = null ,

	@Unutilized decimal (9, 2)  = null ,

	@Admin decimal (9, 2)  = null ,

	@CapacityTotal decimal (9, 2)  = null ,

	@CapacityBillable decimal (9, 2)  = null ,

	@Utilization decimal (9, 2)  = null ,

	@PeriodType char (1)  = null ,

	@BranchID int   = null ,

	@DepartmentID int   = null ,

	@Date datetime   = null ,

	@CapacityTotalReal decimal (9, 2)  = null ,

	@CapacityBillableReal decimal (9, 2)  = null ,

	@CapacityBillableTodayReal decimal (9, 2)  = null ,

	@WorkTypeID int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [jobStatID]
	, [billable]
	, [overbudget]
	, [inhouse]
	, [unutilized]
	, [admin]
	, [capacityTotal]
	, [capacityBillable]
	, [utilization]
	, [periodType]
	, [branchID]
	, [departmentID]
	, [date]
	, [capacityTotalReal]
	, [capacityBillableReal]
	, [capacityBillableTodayReal]
	, [workTypeID]
    FROM
	[dbo].[jobs_stat]
    WHERE 
	 ([jobStatID] = @JobStatID OR @JobStatID IS NULL)
	AND ([billable] = @Billable OR @Billable IS NULL)
	AND ([overbudget] = @Overbudget OR @Overbudget IS NULL)
	AND ([inhouse] = @Inhouse OR @Inhouse IS NULL)
	AND ([unutilized] = @Unutilized OR @Unutilized IS NULL)
	AND ([admin] = @Admin OR @Admin IS NULL)
	AND ([capacityTotal] = @CapacityTotal OR @CapacityTotal IS NULL)
	AND ([capacityBillable] = @CapacityBillable OR @CapacityBillable IS NULL)
	AND ([utilization] = @Utilization OR @Utilization IS NULL)
	AND ([periodType] = @PeriodType OR @PeriodType IS NULL)
	AND ([branchID] = @BranchID OR @BranchID IS NULL)
	AND ([departmentID] = @DepartmentID OR @DepartmentID IS NULL)
	AND ([date] = @Date OR @Date IS NULL)
	AND ([capacityTotalReal] = @CapacityTotalReal OR @CapacityTotalReal IS NULL)
	AND ([capacityBillableReal] = @CapacityBillableReal OR @CapacityBillableReal IS NULL)
	AND ([capacityBillableTodayReal] = @CapacityBillableTodayReal OR @CapacityBillableTodayReal IS NULL)
	AND ([workTypeID] = @WorkTypeID OR @WorkTypeID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [jobStatID]
	, [billable]
	, [overbudget]
	, [inhouse]
	, [unutilized]
	, [admin]
	, [capacityTotal]
	, [capacityBillable]
	, [utilization]
	, [periodType]
	, [branchID]
	, [departmentID]
	, [date]
	, [capacityTotalReal]
	, [capacityBillableReal]
	, [capacityBillableTodayReal]
	, [workTypeID]
    FROM
	[dbo].[jobs_stat]
    WHERE 
	 ([jobStatID] = @JobStatID AND @JobStatID is not null)
	OR ([billable] = @Billable AND @Billable is not null)
	OR ([overbudget] = @Overbudget AND @Overbudget is not null)
	OR ([inhouse] = @Inhouse AND @Inhouse is not null)
	OR ([unutilized] = @Unutilized AND @Unutilized is not null)
	OR ([admin] = @Admin AND @Admin is not null)
	OR ([capacityTotal] = @CapacityTotal AND @CapacityTotal is not null)
	OR ([capacityBillable] = @CapacityBillable AND @CapacityBillable is not null)
	OR ([utilization] = @Utilization AND @Utilization is not null)
	OR ([periodType] = @PeriodType AND @PeriodType is not null)
	OR ([branchID] = @BranchID AND @BranchID is not null)
	OR ([departmentID] = @DepartmentID AND @DepartmentID is not null)
	OR ([date] = @Date AND @Date is not null)
	OR ([capacityTotalReal] = @CapacityTotalReal AND @CapacityTotalReal is not null)
	OR ([capacityBillableReal] = @CapacityBillableReal AND @CapacityBillableReal is not null)
	OR ([capacityBillableTodayReal] = @CapacityBillableTodayReal AND @CapacityBillableTodayReal is not null)
	OR ([workTypeID] = @WorkTypeID AND @WorkTypeID is not null)
	SELECT @@ROWCOUNT			
  END
				


