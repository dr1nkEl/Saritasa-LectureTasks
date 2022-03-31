
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the document_tracks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_Delete
(

	@TrackID int   
)
AS


				DELETE FROM [dbo].[document_tracks] WITH (ROWLOCK) 
				WHERE
					[trackID] = @TrackID
					
			


