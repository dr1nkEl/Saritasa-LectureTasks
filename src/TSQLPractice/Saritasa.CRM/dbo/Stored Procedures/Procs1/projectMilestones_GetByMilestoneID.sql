
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectMilestones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_GetByMilestoneID]
(

	@MilestoneID int   
)
AS


				SELECT
					[Id],
					[ProjectId],
					[Name],
					[SheduledDate],
					[PaymentStatus],
					[PaymentDate],
					[OrderId],
					[PhaseDone],
					[Completeness]
				FROM
					[dbo].[ProjectFinancialMilestones]
				WHERE
					[Id] = @MilestoneID
				SELECT @@ROWCOUNT