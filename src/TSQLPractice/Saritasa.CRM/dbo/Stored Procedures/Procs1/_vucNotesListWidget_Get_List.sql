
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucNotesListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucNotesListWidget_Get_List

AS


				
				SELECT
					[documentID],
					[created],
					[noteName],
					[noteTypeId],
					[noteText],
					[targetDocumentTypeId],
					[targetName],
					[createdBy],
					[updatedBy],
					[deleted],
					[createrTypeID],
					[noteID],
					[createrDocID],
					[targetObjectID],
					[targetID],
					[parentNoteID],
					[userFullName],
					[CommentCount],
					[showClient],
					[needAnswer],
					[viewed],
					[email],
					[clientID],
					[projectID]
				FROM
					[dbo].[_vucNotesListWidget]
					
				SELECT @@ROWCOUNT			
			


