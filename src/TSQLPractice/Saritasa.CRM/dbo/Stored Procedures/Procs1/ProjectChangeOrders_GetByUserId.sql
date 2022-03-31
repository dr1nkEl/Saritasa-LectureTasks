
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectChangeOrders table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_GetByUserId
(

	@UserId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[UserId] = @UserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON