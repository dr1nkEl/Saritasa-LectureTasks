
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vEmployeesUsers view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vEmployeesUsers_Get_List

AS


				
				SELECT
					[EmployeeId],
					[userID],
					[firstName],
					[lastName],
					[title],
					[email],
					[typeID],
					[documentID],
					[fullName],
					[superviserIds],
					[onsite],
					[PreviousEmployment],
					[ContractSignedAt],
					[branchID],
					[comments],
					[photo],
					[emailID],
					[birthday],
					[timeZone],
					[score],
					[timeZoneCode],
					[skype],
					[utilization]
				FROM
					[dbo].[_vEmployeesUsers]
					
				SELECT @@ROWCOUNT