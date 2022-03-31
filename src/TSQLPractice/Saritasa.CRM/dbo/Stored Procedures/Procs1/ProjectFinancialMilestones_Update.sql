
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectFinancialMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_Update
(

	@Id int   ,

	@ProjectId int   ,

	@Name varchar (100)  ,

	@SheduledDate datetime   ,

	@PaymentStatus bit   ,

	@PaymentDate datetime   ,

	@OrderId int   ,

	@PhaseDone bit   ,

	@Completeness smallint   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectFinancialMilestones]
				SET
					[ProjectId] = @ProjectId
					,[Name] = @Name
					,[SheduledDate] = @SheduledDate
					,[PaymentStatus] = @PaymentStatus
					,[PaymentDate] = @PaymentDate
					,[OrderId] = @OrderId
					,[PhaseDone] = @PhaseDone
					,[Completeness] = @Completeness
				WHERE
[Id] = @Id