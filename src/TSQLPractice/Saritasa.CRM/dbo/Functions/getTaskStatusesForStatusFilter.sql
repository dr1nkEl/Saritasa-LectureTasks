/*
 * Added verified to active status.
 * Added 'staging' tasks for 'active' request
 */
 
CREATE FUNCTION [dbo].[getTaskStatusesForStatusFilter] 
(	
    @StatusFilter varchar (20)  = null	
)
RETURNS @targetID TABLE (statusID int, statusName varchar (60))
AS
begin
declare @trackID int 
select @trackID = trackID from document_tracks where typeID = 'T' and trackTypeID = 'GEN'
	if(lower(@StatusFilter) = 'active')	
        insert @targetID  				
		select statusID, statusName from dbo.lookup_document_statuses
		where lower(statusName) in ('new', 'assigned', 'reopened', 'feedback', 'fixed', 'tested', 'verified', 'staging') and trackID = @trackID

	if(lower(@StatusFilter) = 'fixed')		
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where  lower(statusName) in ('fixed', 'tested')  and trackID = @trackID
		-- where  lower(statusName) = 'fixed' and trackID = @trackID	

	if(lower(@StatusFilter) = 'unassigned')		
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where lower(statusName) = 'new' and trackID = @trackID

	if(lower(@StatusFilter) = 'closed')		
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where lower(statusName) in ('cancelled', 'completed') and trackID = @trackID

	if(lower(@StatusFilter) = 'overdue')		 					
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where lower(statusName)not in ('cancelled', 'completed') and trackID = @trackID

	if(lower(@StatusFilter) = 'staging')		
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where lower(statusName) ='staging' 		and trackID = @trackID

	if(lower(@StatusFilter) = 'waitforclient')		
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where lower(statusName) ='waitforclient' 	and trackID = @trackID

	if(lower(@StatusFilter) = 'noclosed')		
        insert @targetID  					
		select statusID,  statusName from lookup_document_statuses 
		where lower(statusName) not in ('cancelled', 'completed') and trackID = @trackID

	RETURN 
end
