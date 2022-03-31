
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectChangeOrders table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_GetByProjectId
(

	@ProjectId int   
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
					[ProjectId] = @ProjectId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON