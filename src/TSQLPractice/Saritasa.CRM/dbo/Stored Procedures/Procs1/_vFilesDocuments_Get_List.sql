/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vFilesDocuments view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vFilesDocuments_Get_List]

AS


				
				SELECT
					[fileID],
					[groupKey],
					[description],
					[fileSize],
					[filePath],
					[fileMime],
					[uniqueKey],
					[fileName],
					[documentID],
					[targetID],
					[typeID],
					[priority],
					[created],
					[updated],
					[deleted],
					[createdBy],
					[updatedBy],
					[generalStatusID],
					[name],
					[folderID],
					[clientID],
					[projectID]
				FROM
					[dbo].[_vFilesDocuments]
					
				SELECT @@ROWCOUNT
