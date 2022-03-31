
/*
 * Remove actualFinishDate column from tasks table.
 */
CREATE VIEW dbo._vTasksStatus
AS
SELECT     dbo.tasks.taskID, dbo.lookup_document_statuses.statusName, CASE WHEN dbo.Tasks.finishDate IS NULL THEN 'false' WHEN dbo.Tasks.finishDate < getdate() THEN 'true'
		ELSE 'false' END AS Overdue, dbo.tasks.targetID
FROM         dbo.tasks INNER JOIN
                      dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID INNER JOIN
                      dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID