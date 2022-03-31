
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectFinancialMilestones table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectFinancialMilestones_Find
(

	@SearchUsingOR bit   = null ,

	@Id int   = null ,

	@ProjectId int   = null ,

	@Name varchar (100)  = null ,

	@SheduledDate datetime   = null ,

	@PaymentStatus bit   = null ,

	@PaymentDate datetime   = null ,

	@OrderId int   = null ,

	@PhaseDone bit   = null ,

	@Completeness smallint   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [Id]
	, [ProjectId]
	, [Name]
	, [SheduledDate]
	, [PaymentStatus]
	, [PaymentDate]
	, [OrderId]
	, [PhaseDone]
	, [Completeness]
    FROM
	[dbo].[ProjectFinancialMilestones]
    WHERE 
	 ([Id] = @Id OR @Id IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([Name] = @Name OR @Name IS NULL)
	AND ([SheduledDate] = @SheduledDate OR @SheduledDate IS NULL)
	AND ([PaymentStatus] = @PaymentStatus OR @PaymentStatus IS NULL)
	AND ([PaymentDate] = @PaymentDate OR @PaymentDate IS NULL)
	AND ([OrderId] = @OrderId OR @OrderId IS NULL)
	AND ([PhaseDone] = @PhaseDone OR @PhaseDone IS NULL)
	AND ([Completeness] = @Completeness OR @Completeness IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [Id]
	, [ProjectId]
	, [Name]
	, [SheduledDate]
	, [PaymentStatus]
	, [PaymentDate]
	, [OrderId]
	, [PhaseDone]
	, [Completeness]
    FROM
	[dbo].[ProjectFinancialMilestones]
    WHERE 
	 ([Id] = @Id AND @Id is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([Name] = @Name AND @Name is not null)
	OR ([SheduledDate] = @SheduledDate AND @SheduledDate is not null)
	OR ([PaymentStatus] = @PaymentStatus AND @PaymentStatus is not null)
	OR ([PaymentDate] = @PaymentDate AND @PaymentDate is not null)
	OR ([OrderId] = @OrderId AND @OrderId is not null)
	OR ([PhaseDone] = @PhaseDone AND @PhaseDone is not null)
	OR ([Completeness] = @Completeness AND @Completeness is not null)
	SELECT @@ROWCOUNT			
  END