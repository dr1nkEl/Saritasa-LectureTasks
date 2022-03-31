
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Reports table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_GetByReportID]
(

	@ReportID int   
)
AS


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
					[reportID] = @ReportID
				SELECT @@ROWCOUNT