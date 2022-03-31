
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the ProjectChangeOrders table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_Find
(

	@SearchUsingOR bit   = null ,

	@ChangeOrderID int   = null ,

	@ProjectId int   = null ,

	@UserId int   = null ,

	@Hours int   = null ,

	@Description varchar (MAX)  = null ,

	@MilestouneId int   = null ,

	@Created datetime   = null ,

	@OrderId int   = null ,

	@PaperworkRecieved bit   = null ,

	@Paid bit   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [changeOrderID]
	, [ProjectId]
	, [UserId]
	, [Hours]
	, [Description]
	, [MilestouneId]
	, [Created]
	, [OrderId]
	, [PaperworkRecieved]
	, [Paid]
    FROM
	[dbo].[ProjectChangeOrders]
    WHERE 
	 ([changeOrderID] = @ChangeOrderID OR @ChangeOrderID IS NULL)
	AND ([ProjectId] = @ProjectId OR @ProjectId IS NULL)
	AND ([UserId] = @UserId OR @UserId IS NULL)
	AND ([Hours] = @Hours OR @Hours IS NULL)
	AND ([Description] = @Description OR @Description IS NULL)
	AND ([MilestouneId] = @MilestouneId OR @MilestouneId IS NULL)
	AND ([Created] = @Created OR @Created IS NULL)
	AND ([OrderId] = @OrderId OR @OrderId IS NULL)
	AND ([PaperworkRecieved] = @PaperworkRecieved OR @PaperworkRecieved IS NULL)
	AND ([Paid] = @Paid OR @Paid IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [changeOrderID]
	, [ProjectId]
	, [UserId]
	, [Hours]
	, [Description]
	, [MilestouneId]
	, [Created]
	, [OrderId]
	, [PaperworkRecieved]
	, [Paid]
    FROM
	[dbo].[ProjectChangeOrders]
    WHERE 
	 ([changeOrderID] = @ChangeOrderID AND @ChangeOrderID is not null)
	OR ([ProjectId] = @ProjectId AND @ProjectId is not null)
	OR ([UserId] = @UserId AND @UserId is not null)
	OR ([Hours] = @Hours AND @Hours is not null)
	OR ([Description] = @Description AND @Description is not null)
	OR ([MilestouneId] = @MilestouneId AND @MilestouneId is not null)
	OR ([Created] = @Created AND @Created is not null)
	OR ([OrderId] = @OrderId AND @OrderId is not null)
	OR ([PaperworkRecieved] = @PaperworkRecieved AND @PaperworkRecieved is not null)
	OR ([Paid] = @Paid AND @Paid is not null)
	SELECT @@ROWCOUNT			
  END