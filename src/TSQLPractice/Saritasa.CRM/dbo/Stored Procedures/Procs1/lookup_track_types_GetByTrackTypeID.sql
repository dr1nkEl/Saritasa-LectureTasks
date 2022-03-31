
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_track_types table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_track_types_GetByTrackTypeID
(

	@TrackTypeID char (3)  
)
AS


				SELECT
					[trackTypeID],
					[trackType]
				FROM
					[dbo].[lookup_track_types]
				WHERE
					[trackTypeID] = @TrackTypeID
				SELECT @@ROWCOUNT
					
			


