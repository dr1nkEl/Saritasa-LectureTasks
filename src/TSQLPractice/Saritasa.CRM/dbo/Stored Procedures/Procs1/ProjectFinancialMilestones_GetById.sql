
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectFinancialMilestones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_GetById
(

	@Id int   
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
					[Id] = @Id
				SELECT @@ROWCOUNT