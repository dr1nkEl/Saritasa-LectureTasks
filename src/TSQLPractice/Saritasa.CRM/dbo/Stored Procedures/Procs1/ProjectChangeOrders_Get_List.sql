
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectChangeOrders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_Get_List

AS


				
				SELECT
					[changeOrderID],
					[ProjectId],
					[UserId],
					[Hours],
					[Description],
					[MilestouneId],
					[Created],
					[OrderId],
					[PaperworkRecieved],
					[Paid]
				FROM
					[dbo].[ProjectChangeOrders]
					
				SELECT @@ROWCOUNT