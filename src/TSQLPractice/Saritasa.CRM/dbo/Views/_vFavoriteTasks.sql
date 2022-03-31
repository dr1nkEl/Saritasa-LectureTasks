

/*
 * Remove outsourceClientID column from projects table.
 */
CREATE VIEW [dbo].[_vFavoriteTasks]
AS
SELECT     d.documentID, d.objectID, d.typeID, d.generalStatusID AS statusID, t.title AS name, t.documentID AS taskDocID, t.title AS taskName, t.taskID, p.projectID, 
                      p.documentID AS projDocID, p.title AS projName, t.billable AS taskBillable, p.billable AS projectBillable, t.isContainer, t.mayAddJobs, 
                      p.showClient AS projectShowClient, f.userID AS favoriteUserID, f.created AS favoritesCreated, t.makeJobsBillable, 
                      p.overbudget AS projectOverbudget
FROM         dbo.tasks AS t LEFT OUTER JOIN
                      dbo.documents AS d ON t.documentID = d.documentID LEFT OUTER JOIN
                      dbo.projects AS p ON t.projectID = p.projectID INNER JOIN
                      dbo.favorites AS f ON d.documentID = f.documentID