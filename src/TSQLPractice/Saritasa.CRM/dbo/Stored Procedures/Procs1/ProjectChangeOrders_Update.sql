
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the ProjectChangeOrders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_Update
(

	@ChangeOrderID int   ,

	@ProjectId int   ,

	@UserId int   ,

	@Hours int   ,

	@Description varchar (MAX)  ,

	@MilestouneId int   ,

	@Created datetime   ,

	@OrderId int   ,

	@PaperworkRecieved bit   ,

	@Paid bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[ProjectChangeOrders]
				SET
					[ProjectId] = @ProjectId
					,[UserId] = @UserId
					,[Hours] = @Hours
					,[Description] = @Description
					,[MilestouneId] = @MilestouneId
					,[Created] = @Created
					,[OrderId] = @OrderId
					,[PaperworkRecieved] = @PaperworkRecieved
					,[Paid] = @Paid
				WHERE
[changeOrderID] = @ChangeOrderID