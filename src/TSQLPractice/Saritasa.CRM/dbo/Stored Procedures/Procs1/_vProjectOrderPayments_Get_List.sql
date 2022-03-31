
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectOrderPayments view
----------------------------------------------------------------------------------------------------
*/
CREATE PROCEDURE dbo._vProjectOrderPayments_Get_List

AS


				
				SELECT
					[projectID],
					[title],
					[changeOrderID],
					[milestouneID],
					[userID],
					[hours],
					[description],
					[orderID],
					[paperworkRecieved],
					[created],
					[name],
					[unpaidCount],
					[employeeID],
					[email],
					[fullName],
					[photo],
					[skype]
				FROM
					[dbo].[_vProjectOrderPayments]
					
				SELECT @@ROWCOUNT