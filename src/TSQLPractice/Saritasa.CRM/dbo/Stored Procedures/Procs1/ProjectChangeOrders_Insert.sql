
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the ProjectChangeOrders table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectChangeOrders_Insert
(

	@ChangeOrderID int    OUTPUT,

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


				
				INSERT INTO [dbo].[ProjectChangeOrders]
					(
					[ProjectId]
					,[UserId]
					,[Hours]
					,[Description]
					,[MilestouneId]
					,[Created]
					,[OrderId]
					,[PaperworkRecieved]
					,[Paid]
					)
				VALUES
					(
					@ProjectId
					,@UserId
					,@Hours
					,@Description
					,@MilestouneId
					,@Created
					,@OrderId
					,@PaperworkRecieved
					,@Paid
					)
				
				-- Get the identity value
				SET @ChangeOrderID = SCOPE_IDENTITY()