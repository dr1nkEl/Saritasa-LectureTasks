
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the jobs_stat table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.jobs_stat_GetByWorkTypeID
(

	@WorkTypeID int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[workTypeID] = @WorkTypeID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


