/*
 * Remove showClient column from files table.
 */
 
CREATE View _vFilesDocuments
AS
SELECT     dbo.files.fileID, dbo.files.groupKey, dbo.files.description, dbo.files.fileSize, dbo.files.filePath, dbo.files.fileMime, dbo.files.uniqueKey, dbo.files.fileName, 
                      dbo.files.documentID, dbo.files.targetID, dbo.files.typeID, dbo.documents.priority, dbo.documents.created, dbo.documents.updated, dbo.documents.deleted, 
                      dbo.documents.createdBy, dbo.documents.updatedBy, dbo.documents.generalStatusID, dbo.documents.name, 
                      dbo.files.folderID, dbo.documents.clientID, dbo.documents.projectID
FROM         dbo.files INNER JOIN
                      dbo.documents ON dbo.files.documentID = dbo.documents.documentID
