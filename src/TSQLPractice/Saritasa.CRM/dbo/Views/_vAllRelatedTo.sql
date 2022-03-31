
/*
 * Remove outsourceClientID column from projects table.
 */
CREATE VIEW [dbo].[_vAllRelatedTo]
AS
	SELECT     d .documentID, d .objectID, d .typeID, d .generalStatusID AS statusID, t .title AS name, t .documentID AS taskDocID, t .title AS taskName, t .taskID, p.projectID, 
						  p.documentID AS projDocID, p.title AS projName, c.clientID, c.documentID AS clientDocID, c.name AS clientName, t .billable, t .billable AS taskBillable, 
						  p.billable AS projectBillable, c.billable AS clientBillable, t .isContainer AS isContainer, t .mayAddJobs, std.objectID AS ParentTaskID, std.name AS ParentName, 
						  p.showClient AS projectShowClient, t .makeJobsBillable, t .startDate AS 'startDate', t .finishDate AS 'finishDate', tw.subTaskLimit, 
						  tw.taskLimit, p.overbudget as 'projectOverbudget', t.sprintID as 'sprintID', t.featureID as 'featureID'
	FROM         dbo.tasks AS t LEFT OUTER JOIN
						  dbo.documents AS d ON t .documentID = d .documentID LEFT OUTER JOIN
						  dbo.projects AS p ON d .projectID = p.projectID LEFT OUTER JOIN
						  dbo.clients AS c ON d .clientID = c.clientID LEFT OUTER JOIN
						  dbo.documents AS std ON std.documentID = t .targetID LEFT OUTER JOIN
						  dbo._vucTaskListWidget AS tw ON tw.taskID = t .taskID
	UNION
	SELECT     d .documentID, d .objectID, d .typeID, d .generalStatusID AS statusID, p.title AS name, NULL AS taskDocID, NULL AS taskName, NULL AS taskID, p.projectID, 
						  p.documentID AS projDocID, p.title AS projName, c.clientID, c.documentID AS clientDocID, c.name AS clientName, p.billable, NULL AS taskBillable, 
						  p.billable AS projectBillable, c.billable AS clientBillable, NULL AS isContainer, CAST(1 AS bit) AS mayAddJobs, NULL AS ParentTaskID, NULL AS ParentName, 
						  p.showClient AS projectShowClient, cast(0 AS bit) AS 'makeJobsBillable', NULL AS 'startDate', NULL AS 'finishDate', NULL 
						  AS 'subTaskLimit', NULL AS 'taskLimit', p.overbudget as 'projectOverbudget', null as 'sprintID', null as 'featureID'
	FROM         dbo.projects AS p LEFT OUTER JOIN
						  dbo.documents AS d ON p.documentID = d .documentID LEFT OUTER JOIN
						  dbo.clients AS c ON p.clientID = c.clientID
	UNION
	SELECT     d .documentID, d .objectID, d .typeID, d .generalStatusID AS statusID, c.name, NULL AS taskDocID, NULL AS taskName, NULL AS taskID, NULL AS projectID, NULL 
						  AS projDocID, NULL AS projName, c.clientID, c.documentID AS clientDocID, c.name AS clientName, c.billable, NULL AS taskBillable, NULL AS projectBillable, 
						  c.billable AS clientBillable, NULL AS isContainer, CAST(1 AS bit) AS mayAddJobs, NULL AS ParentTaskID, NULL AS ParentName, NULL AS projectShowClient,
						  cast(0 AS bit) AS 'makeJobsBillable', NULL AS 'startDate', NULL AS 'finishDate', NULL AS 'subTaskLimit', NULL AS 'taskLimit', NULL as  'projectOverbudget',
						  null as 'sprintID', null as 'featureID'
	FROM         dbo.clients AS c LEFT OUTER JOIN
						  dbo.documents AS d ON c.documentID = d .documentID
	UNION
	SELECT     d .documentID, u.Id, d .typeID, d .generalStatusID AS statusID, u.fullName AS name, CAST(1 AS bit) AS taskDocID, u.email AS taskName, NULL AS taskID, NULL 
						  AS projectID, NULL AS projDocID, u.lastName AS projName, NULL AS clientID, NULL AS clientDocID, u.firstName AS clientName, CAST(0 AS bit) AS billable, NULL 
						  AS taskBillable, NULL AS projectBillable, NULL AS clientBillable, NULL AS isContainer, CAST(1 AS bit) AS mayAddJobs, NULL AS ParentTaskID, NULL 
						  AS ParentName, NULL AS projectShowClient, cast(0 AS bit) AS 'makeJobsBillable', NULL AS 'startDate', NULL AS 'finishDate', NULL 
						  AS 'subTaskLimit', NULL AS 'taskLimit', NULL as 'projectOverbudget', null as 'sprintID', null as 'featureID'
	FROM         dbo._vUsers AS u LEFT OUTER JOIN
						  dbo.documents AS d ON d .documentID = u.documentID
	WHERE     (u.typeID = 'E')
	UNION
	SELECT     d .documentID, u.Id, d .typeID, d .generalStatusID AS statusID, u.fullName AS name, NULL AS taskDocID, u.email AS taskName, NULL AS taskID, NULL 
						  AS projectID, NULL AS projDocID, u.firstName AS projName, c.clientID, c.documentID AS clientDocID, c.name AS clientName, CAST(1 AS bit) AS billable, NULL 
						  AS taskBillable, NULL AS projectBillable, c.billable AS clientBillable, NULL AS isContainer, CAST(1 AS bit) AS mayAddJobs, NULL AS ParentTaskID, NULL 
						  AS ParentName, NULL AS projectShowClient, cast(0 AS bit) AS 'makeJobsBillable', NULL AS 'startDate', NULL AS 'finishDate', NULL 
						  AS 'subTaskLimit', NULL AS 'taskLimit', NULL as 'projectOverbudget', null as 'sprintID', null as 'featureID'
	FROM         dbo._vUsers AS u LEFT OUTER JOIN
						  dbo.documents AS d ON d .documentID = u.documentID LEFT OUTER JOIN
						  dbo.contacts AS co ON co.userID = u.Id LEFT OUTER JOIN
						  dbo.clients AS c ON co.clientID = c.clientID
	WHERE     (u.typeID = 'C')