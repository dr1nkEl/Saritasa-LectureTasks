/*
 * Re-create stored procedure.
 */
Create PROCEDURE [dbo].[_tasks_setProjAndClientID]
(
    @taskID bigint   = null 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    declare @cID int 
    declare @pID int 
    declare @taskTargets as TargetList;
    
    insert into @taskTargets
    select documentID from tasks where taskID=@taskID
    
    declare @targetID int
    declare @targType varchar(3)

    select @targetID = objectid, @targType = typeID, @cID = clientID, @pID = projectID from documents
    where documentid in (select targetID from tasks where taskid = @taskID)

    update tasks set 
    clientID = @cID,
    projectID = @pID
    where documentID in (select targ.documentID from @taskTargets targ);
    
    update jobs set 
    clientID = @cID,
    projectID = @pID    
    where targetID in (select targ.documentID from @taskTargets targ);    
    
    insert into @taskTargets
    select nt.documentID from dbo.getNotesRelatedIDs(@taskTargets) as nt
    
    insert into @taskTargets
    select nt.documentID from dbo.getFilesRelatedIDs(@taskTargets) as nt
    
    update documents set 
    clientID = @cID,
    projectID = @pID    
    where documentID in (select targ.documentID from @taskTargets targ)   
    
END