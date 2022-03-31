

/*
 * Remove outsourceClientID column from projects table.
 */
CREATE VIEW [dbo].[_vTaskForRelated]
AS
	select
		project_features.ID as 'documentID',
		2147483646 as 'objectID', -- we need this for sorting
		'F ' as 'typeID',
		11 as 'statusID',
		project_features.name,
		cast(0 as bit) as 'billable',
		cast(1 as bit) as 'showClient',
		-1 as 'taskDocID',
		project_features.name as 'taskName',
		project_features.ID as 'taskID',
		cast(0 as bit) as 'taskBillable',
		cast(1 as bit) as 'isContainer',
		cast(0 as bit) as 'mayAddJobs',
		cast(0 as bit) as 'makeJobsBillable',
		projects.projectID,
		projects.documentID as 'projDocID',
		projects.title as 'projName',
		projects.billable as 'projectBillable',
		null as 'ParentTaskID',
		'' as 'ParentName',
		projects.clientID,
		projects.startDate as 'startDate',
		projects.proposedFinishDate as 'finishDate',
		projects.overbudget AS projectOverbudget,
		null as 'sprintID',
		null as 'featureID'
	from
		project_features
		inner join projects on project_features.projectID = projects.projectID
	union
	select
		project_sprints.ID as 'documentID',
		2147483647 as 'objectID', -- we need this for sorting
		'S ' as 'typeID',
		11 as 'statusID',
		project_sprints.name,
		cast(0 as bit) as 'billable',
		cast(1 as bit) as 'showClient',
		-1 as 'taskDocID',
		project_sprints.name as 'taskName',
		project_sprints.ID as 'taskID',
		cast(0 as bit) as 'taskBillable',
		cast(1 as bit) as 'isContainer',
		cast(0 as bit) as 'mayAddJobs',
		cast(0 as bit) as 'makeJobsBillable',
		projects.projectID,
		projects.documentID as 'projDocID',
		projects.title as 'projName',
		projects.billable as 'projectBillable',
		null as 'ParentTaskID',
		'' as 'ParentName',
		projects.clientID,
		projects.startDate as 'startDate',
		projects.proposedFinishDate as 'finishDate',
		projects.overbudget AS projectOverbudget,
		null as 'sprintID',
		null as 'featureID'
	from
		project_sprints
		inner join projects on project_sprints.projectID = projects.projectID
	union
	select
		d.documentID,
		d.objectID,
		d.typeID,
		d.generalStatusID AS statusID,
		t.title AS name,
		t.billable,
		p.showClient,
		t.documentID AS taskDocID,
		t.title AS taskName,
		t.taskID, 
        t.billable AS taskBillable,
		t.isContainer,
		t.mayAddJobs,
		t.makeJobsBillable,
		p.projectID,
		p.documentID AS projDocID,
		p.title AS projName,
		p.billable AS projectBillable,
		std.objectID AS ParentTaskID,
		std.name AS ParentName,
		t.clientID,
		t.startDate,
		t.finishDate,
		p.overbudget AS projectOverbudget,
		t.sprintID,
		t.featureID
	from dbo.tasks AS t
		inner join dbo.documents AS d ON t.documentID = d.documentID
		inner join dbo.projects AS p ON d.projectID = p.projectID
		left outer join dbo.documents AS std ON std.documentID = t.targetID AND std.typeID = 'T  '