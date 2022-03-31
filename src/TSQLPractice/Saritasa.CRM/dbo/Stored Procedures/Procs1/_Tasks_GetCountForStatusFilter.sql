


/*
 * Remove superviserUserID column from tasks table.
 */ 
CREATE PROCEDURE dbo._Tasks_GetCountForStatusFilter
(
	@StatusFilter varchar (20) = null,
	@targetID bigint = null,
	@creatorID int = null
)
AS
BEGIN
	if (lower(@StatusFilter) = 'active')			
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 
		  and targetid  in (select documentid from [getAllTargetID2](@targetID,1))

	if (lower(@StatusFilter) = 'fixed')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 
		  and targetid  in (select documentid from [getAllTargetID2](@targetID,1))

	if (lower(@StatusFilter) = 'unassigned')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 
		  and targetid  in (select documentid from [getAllTargetID2](@targetID,1))

	if (lower(@StatusFilter) = 'closed')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 
		  and targetid  in (select documentid from [getAllTargetID2](@targetID,1))

	if (lower(@StatusFilter) = 'overdue')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter))
		and(dbo.Tasks.finishDate IS not NULL ) 
		and(dbo.Tasks.finishDate < dateadd(dd, 0, datediff(dd, 0, getdate())))	
		and targetid in (select documentid from [getAllTargetID2](@targetID,1))

	if (lower(@StatusFilter) = 'waitforclient')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 
		  and targetid  in (select documentid from [getAllTargetID2](@targetID,1))

	if (lower(@StatusFilter) = 'staging')		
		select count(*) 
		from dbo.tasks 
		left JOIN dbo.documents ON dbo.tasks.documentID = dbo.documents.documentID 
	    left JOIN dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID	
		where (@creatorID is NULL OR documents.createdBy=@creatorID) and lower(statusName) in (select statusName from getTaskStatusesForStatusFilter(@StatusFilter)) 
		  and targetid  in (select documentid from [getAllTargetID2](@targetID,1))

	if(lower(@StatusFilter) not in ('active','fixed','unassigned','closed','overdue','waitforclient','staging'))
		select 0	
END
