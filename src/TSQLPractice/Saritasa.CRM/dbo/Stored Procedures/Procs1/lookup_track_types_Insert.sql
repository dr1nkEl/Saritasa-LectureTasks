
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_track_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_track_types_Insert
(

	@TrackTypeID char (3)  ,

	@TrackType varchar (100)  
)
AS


				
				INSERT INTO [dbo].[lookup_track_types]
					(
					[trackTypeID]
					,[trackType]
					)
				VALUES
					(
					@TrackTypeID
					,@TrackType
					)
				
									
							
			


