
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the document_tracks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_Update
(

	@TrackID int   ,

	@TrackTypeID char (3)  ,

	@TypeID char (3)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[document_tracks]
				SET
					[trackTypeID] = @TrackTypeID
					,[typeID] = @TypeID
				WHERE
[trackID] = @TrackID 
				
			


