
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_tracks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_GetByTrackID
(

	@TrackID int   
)
AS


				SELECT
					[trackID],
					[trackTypeID],
					[typeID]
				FROM
					[dbo].[document_tracks]
				WHERE
					[trackID] = @TrackID
				SELECT @@ROWCOUNT
					
			


