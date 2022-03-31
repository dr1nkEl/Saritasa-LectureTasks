
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_status_history table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[document_status_history_GetByTrackID]
(

	@TrackId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[statusHistoryID],
					[DocumentId],
					[Created],
					[CreatedBy],
					[TrackId],
					[StatusId],
					[Comment]
				FROM
					[dbo].[document_status_history]
				WHERE
					[TrackId] = @TrackId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON