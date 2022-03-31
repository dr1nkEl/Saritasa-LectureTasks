
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_Insert]
(

	@ReportID int    OUTPUT,

	@ClientId int   ,

	@DocumentId bigint   ,

	@EmailedTo varchar (50)  ,

	@Email varchar (50)  ,

	@DateFrom datetime   ,

	@DateTo datetime   
)
AS


				
				INSERT INTO [dbo].[Reports]
					(
					[ClientId]
					,[DocumentId]
					,[EmailedTo]
					,[Email]
					,[DateFrom]
					,[DateTo]
					)
				VALUES
					(
					@ClientId
					,@DocumentId
					,@EmailedTo
					,@Email
					,@DateFrom
					,@DateTo
					)
				
				-- Get the identity value
				SET @ReportID = SCOPE_IDENTITY()