
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_track_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_track_types_Update
(

	@TrackTypeID char (3)  ,

	@OriginalTrackTypeID char (3)  ,

	@TrackType varchar (100)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_track_types]
				SET
					[trackTypeID] = @TrackTypeID
					,[trackType] = @TrackType
				WHERE
[trackTypeID] = @OriginalTrackTypeID 
				
			


