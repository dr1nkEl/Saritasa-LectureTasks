
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectFinancialMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_Get_List

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
					
				SELECT @@ROWCOUNT