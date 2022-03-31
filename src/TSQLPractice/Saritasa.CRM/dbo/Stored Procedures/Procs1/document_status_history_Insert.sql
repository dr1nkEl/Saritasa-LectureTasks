/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the document_status_history table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[document_status_history_Insert]
(

	@StatusHistoryID int    OUTPUT,

	@DocumentID bigint   ,

	@Created datetime   ,

	@CreatedBy int   ,

	@TrackID int   ,

	@StatusID int   ,

	@Comment varchar (MAX)  
)
AS


				
				INSERT INTO [dbo].[document_status_history]
					(
					[documentID]
					,[created]
					,[createdBy]
					,[trackID]
					,[statusID]
					,[comment]
					)
				VALUES
					(
					@DocumentID
					,@Created
					,@CreatedBy
					,@TrackID
					,@StatusID
					,@Comment
					)
				
				-- Get the identity value
				SET @StatusHistoryID = SCOPE_IDENTITY()
