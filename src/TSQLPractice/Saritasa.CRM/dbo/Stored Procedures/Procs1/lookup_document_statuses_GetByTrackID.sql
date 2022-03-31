
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_document_statuses table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_statuses_GetByTrackID
(

	@TrackID int   
)
AS


				SELECT
					[statusID],
					[colorCode],
					[statusName],
					[trackID],
					[orderBy]
				FROM
					[dbo].[lookup_document_statuses]
				WHERE
					[trackID] = @TrackID
				SELECT @@ROWCOUNT
					
			


