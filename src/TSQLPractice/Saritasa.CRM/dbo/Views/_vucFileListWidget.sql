/*
 * Remove showClient column from files table.
 */
CREATE VIEW [dbo].[_vucFileListWidget]
AS
SELECT     dbo.documents.documentID, dbo.documents.created, ISNULL(dbo.documents.updated, dbo.documents.created) AS updated, dbo.documents.deleted, 
                      dbo.documents.generalStatusID, dbo.documents.createdBy, dbo.documents.name, dbo.files.fileID, dbo.files.fileSize, dbo.files.filePath, dbo.files.fileMime, 
                      dbo.files.fileName, dbo.files.typeID, targetDoc.documentID AS targDocId, targetDoc.name AS targName, targetDoc.typeID AS targDocType, dbo.files.description, 
                      dbo.files.uniqueKey, dbo._vUsers.fullName AS userFullName, dbo._vUsers.documentID AS createrDocID, dbo._vUsers.typeID AS createrTypeID, 
                      dbo._vUsers.email, dbo.phones.phone as skype, e.Photo, dbo.documents.clientID, dbo.documents.projectID, dbo.fileFolders.name AS folderName, dbo.fileFolders.folderID
FROM         dbo.files LEFT OUTER JOIN
                      dbo.documents ON dbo.documents.documentID = dbo.files.documentID LEFT OUTER JOIN
                      dbo.fileFolders ON dbo.files.folderID = dbo.fileFolders.folderID AND dbo.fileFolders.projectID = dbo.documents.projectID LEFT OUTER JOIN
                      dbo.documents AS targetDoc ON dbo.files.targetID = targetDoc.documentID LEFT OUTER JOIN
                      dbo._vUsers ON dbo.documents.createdBy = dbo._vUsers.Id left join 
                      dbo.phones on dbo._vUsers.documentID = dbo.phones.targetID and dbo.phones.typeID = 'SKP' left join
                      dbo.employees e on dbo._vUsers.Id = e.Id
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vucFileListWidget';

