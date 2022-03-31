
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectFinancialMilestones table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_GetByProjectId
(

	@ProjectId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[ProjectId] = @ProjectId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON