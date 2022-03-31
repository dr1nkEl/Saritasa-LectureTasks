
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectChangeOrdersList view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vProjectChangeOrdersList_Get_List

AS


				
				SELECT
					[changeOrderID],
					[projectID],
					[userID],
					[hours],
					[description],
					[milestouneID],
					[created],
					[orderID],
					[paperworkRecieved],
					[title],
					[employeeID],
					[email],
					[fullName],
					[photo],
					[skype],
					[smEmployeeID],
					[cmUserID],
					[cmEmail],
					[cmFullName],
					[cmphoto],
					[cmSkype],
					[paid]
				FROM
					[dbo].[_vProjectChangeOrdersList]
					
				SELECT @@ROWCOUNT