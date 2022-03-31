
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the document_tracks table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_GetByTrackTypeID
(

	@TrackTypeID char (3)  
)
AS


				SELECT
					[trackID],
					[trackTypeID],
					[typeID]
				FROM
					[dbo].[document_tracks]
				WHERE
					[trackTypeID] = @TrackTypeID
				SELECT @@ROWCOUNT
					
			


