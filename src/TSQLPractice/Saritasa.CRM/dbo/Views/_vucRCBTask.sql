CREATE VIEW dbo._vucRCBTask
AS
SELECT     dbo.tasks.taskID, dbo.tasks.title, dbo.documents.generalStatusID, dbo.lookup_document_statuses.statusName, dbo.tasks.targetID, target.objectID AS targetObjID, 
                      target.typeID AS targetObjType, target.name AS targetName
FROM         dbo.tasks LEFT OUTER JOIN
                      dbo.documents ON dbo.documents.documentID = dbo.tasks.documentID LEFT OUTER JOIN
                      dbo.documents AS target ON dbo.tasks.targetID = target.documentID LEFT OUTER JOIN
                      dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID