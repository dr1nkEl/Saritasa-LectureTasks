
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vNotes view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vNotes_Get_List

AS


				
				SELECT
					[noteID],
					[parentNoteID],
					[noteText],
					[typeID],
					[documentID],
					[targetID],
					[showClient],
					[name],
					[created],
					[createdBy],
					[updated],
					[updatedBy],
					[deleted],
					[generalStatusID],
					[firstName],
					[lastName],
					[fullName],
					[creterDocID],
					[emailID],
					[email],
					[birthday],
					[timeZone],
					[targetName],
					[targetTypeID],
					[objectID],
					[needAnswer],
					[viewed]
				FROM
					[dbo].[_vNotes]
					
				SELECT @@ROWCOUNT			
			


