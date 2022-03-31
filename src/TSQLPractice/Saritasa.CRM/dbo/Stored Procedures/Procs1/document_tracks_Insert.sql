
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the document_tracks table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_Insert
(

	@TrackID int    OUTPUT,

	@TrackTypeID char (3)  ,

	@TypeID char (3)  
)
AS


				
				INSERT INTO [dbo].[document_tracks]
					(
					[trackTypeID]
					,[typeID]
					)
				VALUES
					(
					@TrackTypeID
					,@TypeID
					)
				
				-- Get the identity value
				SET @TrackID = SCOPE_IDENTITY()
									
							
			


