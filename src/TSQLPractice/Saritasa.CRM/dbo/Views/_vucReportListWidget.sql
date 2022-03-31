CREATE VIEW [dbo].[_vucReportListWidget]
AS
SELECT     dbo.reports.reportID, dbo.reports.clientID, dbo.documents.documentID, dbo.documents.created, dbo.documents.createdBy, dbo.files.fileID, dbo.files.uniqueKey, 
                      dbo.reports.dateFrom, dbo.reports.dateTo
FROM         dbo.reports INNER JOIN
                      dbo.documents ON dbo.reports.documentID = dbo.documents.documentID INNER JOIN
                      dbo.files ON dbo.documents.documentID = dbo.files.targetID

