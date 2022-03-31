
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the jobs_stat table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_Get_List

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
					
				SELECT @@ROWCOUNT
			


