/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTasksBoomerangs view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vTasksBoomerangs_Get_List]

AS


				
				SELECT
					[taskID],
					[typeID],
					[documentID],
					[targetID],
					[created],
					[updated],
					[deleted],
					[generalStatusID],
					[createdBy],
					[name],
					[updatedBy],
					[statusName],
					[title],
					[finishDate],
					[startDate],
					[billable],
					[clientID],
					[projectID],
					[durationLimit],
					[isContainer],
					[boomerangID],
					[userID],
					[type],
					[fireTime],
					[isFired],
					[timeZone],
					[timeZoneCode],
					[firstName],
					[lastName]
				FROM
					[dbo].[_vTasksBoomerangs]
					
				SELECT @@ROWCOUNT
