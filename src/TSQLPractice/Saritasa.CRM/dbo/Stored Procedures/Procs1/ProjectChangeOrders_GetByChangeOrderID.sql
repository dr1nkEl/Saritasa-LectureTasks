
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectChangeOrders table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_GetByChangeOrderID
(

	@ChangeOrderID int   
)
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
				WHERE
					[changeOrderID] = @ChangeOrderID
				SELECT @@ROWCOUNT