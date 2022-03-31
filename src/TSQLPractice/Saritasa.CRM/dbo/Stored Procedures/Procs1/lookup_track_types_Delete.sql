
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_track_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_track_types_Delete
(

	@TrackTypeID char (3)  
)
AS


				DELETE FROM [dbo].[lookup_track_types] WITH (ROWLOCK) 
				WHERE
					[trackTypeID] = @TrackTypeID
					
			


