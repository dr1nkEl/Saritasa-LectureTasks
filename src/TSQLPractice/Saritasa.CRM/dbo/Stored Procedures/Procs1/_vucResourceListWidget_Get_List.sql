
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucResourceListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucResourceListWidget_Get_List

AS


				
				SELECT
					[phone],
					[firstName],
					[lastName],
					[fullName],
					[userID],
					[EmployeeId],
					[ContractSignedAt],
					[email],
					[cell],
					[documentID],
					[generalStatusID],
					[branchID],
					[onsite],
					[skype],
					[photo],
					[utilization],
					[DepartmentId],
					[departmentName],
					[UtilizationPercent]
				FROM
					[dbo].[_vucResourceListWidget]
					
				SELECT @@ROWCOUNT