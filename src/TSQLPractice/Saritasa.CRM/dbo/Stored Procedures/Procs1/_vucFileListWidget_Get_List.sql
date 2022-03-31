/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucFileListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucFileListWidget_Get_List]

AS


				
				SELECT
					[documentID],
					[created],
					[updated],
					[deleted],
					[generalStatusID],
					[createdBy],
					[name],
					[fileID],
					[fileSize],
					[filePath],
					[fileMime],
					[fileName],
					[typeID],
					[targDocId],
					[targName],
					[targDocType],
					[description],
					[uniqueKey],
					[userFullName],
					[createrDocID],
					[createrTypeID],
					[email],
					[skype],
					[photo],
					[clientID],
					[projectID],
					[folderName],
					[folderID]
				FROM
					[dbo].[_vucFileListWidget]
					
				SELECT @@ROWCOUNT
