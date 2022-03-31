
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_track_types table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_track_types_Find
(

	@SearchUsingOR bit   = null ,

	@TrackTypeID char (3)  = null ,

	@TrackType varchar (100)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [trackTypeID]
	, [trackType]
    FROM
	[dbo].[lookup_track_types]
    WHERE 
	 ([trackTypeID] = @TrackTypeID OR @TrackTypeID IS NULL)
	AND ([trackType] = @TrackType OR @TrackType IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [trackTypeID]
	, [trackType]
    FROM
	[dbo].[lookup_track_types]
    WHERE 
	 ([trackTypeID] = @TrackTypeID AND @TrackTypeID is not null)
	OR ([trackType] = @TrackType AND @TrackType is not null)
	SELECT @@ROWCOUNT			
  END
				


