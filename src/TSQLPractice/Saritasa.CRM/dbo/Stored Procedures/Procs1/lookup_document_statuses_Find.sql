
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_document_statuses table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_document_statuses_Find
(

	@SearchUsingOR bit   = null ,

	@StatusID int   = null ,

	@ColorCode char (6)  = null ,

	@StatusName varchar (60)  = null ,

	@TrackID int   = null ,

	@OrderBy int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [statusID]
	, [colorCode]
	, [statusName]
	, [trackID]
	, [orderBy]
    FROM
	[dbo].[lookup_document_statuses]
    WHERE 
	 ([statusID] = @StatusID OR @StatusID IS NULL)
	AND ([colorCode] = @ColorCode OR @ColorCode IS NULL)
	AND ([statusName] = @StatusName OR @StatusName IS NULL)
	AND ([trackID] = @TrackID OR @TrackID IS NULL)
	AND ([orderBy] = @OrderBy OR @OrderBy IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [statusID]
	, [colorCode]
	, [statusName]
	, [trackID]
	, [orderBy]
    FROM
	[dbo].[lookup_document_statuses]
    WHERE 
	 ([statusID] = @StatusID AND @StatusID is not null)
	OR ([colorCode] = @ColorCode AND @ColorCode is not null)
	OR ([statusName] = @StatusName AND @StatusName is not null)
	OR ([trackID] = @TrackID AND @TrackID is not null)
	OR ([orderBy] = @OrderBy AND @OrderBy is not null)
	SELECT @@ROWCOUNT			
  END
				


