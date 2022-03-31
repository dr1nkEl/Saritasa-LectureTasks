
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Reports table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[reports_Delete]
(

	@ReportID int   
)
AS


				DELETE FROM [dbo].[Reports] WITH (ROWLOCK) 
				WHERE
					[reportID] = @ReportID