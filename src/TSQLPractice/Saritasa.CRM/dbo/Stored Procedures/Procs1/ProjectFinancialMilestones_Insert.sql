
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectFinancialMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_Insert
(

	@Id int    OUTPUT,

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


				
				INSERT INTO [dbo].[ProjectFinancialMilestones]
					(
					[ProjectId]
					,[Name]
					,[SheduledDate]
					,[PaymentStatus]
					,[PaymentDate]
					,[OrderId]
					,[PhaseDone]
					,[Completeness]
					)
				VALUES
					(
					@ProjectId
					,@Name
					,@SheduledDate
					,@PaymentStatus
					,@PaymentDate
					,@OrderId
					,@PhaseDone
					,@Completeness
					)
				
				-- Get the identity value
				SET @Id = SCOPE_IDENTITY()