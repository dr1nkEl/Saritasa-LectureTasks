/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the document_status_history table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[document_status_history_Update]
(

	@StatusHistoryID int   ,

	@DocumentID bigint   ,

	@Created datetime   ,

	@CreatedBy int   ,

	@TrackID int   ,

	@StatusID int   ,

	@Comment varchar (MAX)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[document_status_history]
				SET
					[documentID] = @DocumentID
					,[created] = @Created
					,[createdBy] = @CreatedBy
					,[trackID] = @TrackID
					,[statusID] = @StatusID
					,[comment] = @Comment
				WHERE
[statusHistoryID] = @StatusHistoryID
