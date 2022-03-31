
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the jobs_stat table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_GetByDate
(

	@Date datetime   
)
AS


				SELECT
					[jobStatID],
					[billable],
					[overbudget],
					[inhouse],
					[unutilized],
					[admin],
					[capacityTotal],
					[capacityBillable],
					[utilization],
					[periodType],
					[branchID],
					[departmentID],
					[date],
					[capacityTotalReal],
					[capacityBillableReal],
					[capacityBillableTodayReal],
					[workTypeID]
				FROM
					[dbo].[jobs_stat]
				WHERE
					[date] = @Date
				SELECT @@ROWCOUNT
					
			


