/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the document_status_history table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[document_status_history_Find]
(

	@SearchUsingOR bit   = null ,

	@StatusHistoryID int   = null ,

	@DocumentID bigint   = null ,

	@Created datetime   = null ,

	@CreatedBy int   = null ,

	@TrackID int   = null ,

	@StatusID int   = null ,

	@Comment varchar (MAX)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [statusHistoryID]
	, [documentID]
	, [created]
	, [createdBy]
	, [trackID]
	, [statusID]
	, [comment]
    FROM
	[dbo].[document_status_history]
    WHERE 
	 ([statusHistoryID] = @StatusHistoryID OR @StatusHistoryID IS NULL)
	AND ([documentID] = @DocumentID OR @DocumentID IS NULL)
	AND ([created] = @Created OR @Created IS NULL)
	AND ([createdBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([trackID] = @TrackID OR @TrackID IS NULL)
	AND ([statusID] = @StatusID OR @StatusID IS NULL)
	AND ([comment] = @Comment OR @Comment IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [statusHistoryID]
	, [documentID]
	, [created]
	, [createdBy]
	, [trackID]
	, [statusID]
	, [comment]
    FROM
	[dbo].[document_status_history]
    WHERE 
	 ([statusHistoryID] = @StatusHistoryID AND @StatusHistoryID is not null)
	OR ([documentID] = @DocumentID AND @DocumentID is not null)
	OR ([created] = @Created AND @Created is not null)
	OR ([createdBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([trackID] = @TrackID AND @TrackID is not null)
	OR ([statusID] = @StatusID AND @StatusID is not null)
	OR ([comment] = @Comment AND @Comment is not null)
	SELECT @@ROWCOUNT			
  END
