
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_Update]
(

	@ReportID int   ,

	@ClientId int   ,

	@DocumentId bigint   ,

	@EmailedTo varchar (50)  ,

	@Email varchar (50)  ,

	@DateFrom datetime   ,

	@DateTo datetime   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Reports]
				SET
					[ClientId] = @ClientId
					,[DocumentId] = @DocumentId
					,[EmailedTo] = @EmailedTo
					,[Email] = @Email
					,[DateFrom] = @DateFrom
					,[DateTo] = @DateTo
				WHERE
[reportID] = @ReportID