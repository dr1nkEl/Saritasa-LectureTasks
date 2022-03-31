
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the document_tracks table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_tracks_Find
(

	@SearchUsingOR bit   = null ,

	@TrackID int   = null ,

	@TrackTypeID char (3)  = null ,

	@TypeID char (3)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [trackID]
	, [trackTypeID]
	, [typeID]
    FROM
	[dbo].[document_tracks]
    WHERE 
	 ([trackID] = @TrackID OR @TrackID IS NULL)
	AND ([trackTypeID] = @TrackTypeID OR @TrackTypeID IS NULL)
	AND ([typeID] = @TypeID OR @TypeID IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [trackID]
	, [trackTypeID]
	, [typeID]
    FROM
	[dbo].[document_tracks]
    WHERE 
	 ([trackID] = @TrackID AND @TrackID is not null)
	OR ([trackTypeID] = @TrackTypeID AND @TrackTypeID is not null)
	OR ([typeID] = @TypeID AND @TypeID is not null)
	SELECT @@ROWCOUNT			
  END
				


