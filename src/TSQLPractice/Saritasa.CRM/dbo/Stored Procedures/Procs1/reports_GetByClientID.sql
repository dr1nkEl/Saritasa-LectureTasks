
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Reports table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_GetByClientID]
(

	@ClientId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[reportID],
					[ClientId],
					[DocumentId],
					[EmailedTo],
					[Email],
					[DateFrom],
					[DateTo]
				FROM
					[dbo].[Reports]
				WHERE
					[ClientId] = @ClientId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON