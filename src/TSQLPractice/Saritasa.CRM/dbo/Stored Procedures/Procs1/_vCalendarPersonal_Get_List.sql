/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vCalendarPersonal view
----------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE [dbo].[_vCalendarPersonal_Get_List]

AS


				
				SELECT
					[UserId],
					[branchID],
					[superviserIds],
					[score],
					[cID],
					[date],
					[holiday],
					[perClId],
					[num],
					[perHoliday],
					[isSick],
					[description],
					[dayType],
					[onsite]
				FROM
					[dbo].[_vCalendarPersonal]
					
				SELECT @@ROWCOUNT