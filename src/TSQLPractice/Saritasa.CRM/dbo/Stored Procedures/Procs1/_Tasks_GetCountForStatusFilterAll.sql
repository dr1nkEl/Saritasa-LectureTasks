


CREATE PROCEDURE dbo._Tasks_GetCountForStatusFilterAll
(
	@StatusFilter varchar (20) = null
)
AS
BEGIN
	if (lower(@StatusFilter) = 'active')			
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 

	if(lower(@StatusFilter) = 'fixed')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))

	if(lower(@StatusFilter) = 'unassigned')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))

	if(lower(@StatusFilter) = 'closed')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))

	if(lower(@StatusFilter) = 'overdue')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName)in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))
		and(dbo.Tasks.finishDate IS not NULL ) 
		and(dbo.Tasks.finishDate <  dateadd(dd, 0, datediff(dd, 0, getdate())))	

	if(lower(@StatusFilter) = 'waitforclient')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))		

	if(lower(@StatusFilter) = 'staging')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))		

	if(lower(@StatusFilter) not in ('active','fixed','unassigned','closed','overdue','waitforclient','staging'))
		select 0;
END
