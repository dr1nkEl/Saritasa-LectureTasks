


/*
 * Remove employeePool column from tasks table.
 */
CREATE PROCEDURE dbo._tasks_UpdateStatus
(
	@taskID bigint = null,
	@docID bigint = null,
	@userID int = null,
	@status varchar (60) = null ,
	@comment text = null
)
AS
BEGIN
  declare @i int
  set @status = rtrim(ltrim(lower(@status)));
  set @i = dbo.getDocStatusID(@status, 'T');

	if (@taskID is null) 	
		select @taskID = taskID from tasks where documentID = @docID;
	else	
		select @docID = documentID from tasks where taskid = @taskID;

  if (@i = -1)
  begin
		select @i = GeneralStatusID from documents where documentID = @docID;
  end;

	declare @hID int;
	select @hID = max(statusHistoryID) from document_status_history  where documentID = @docID;

	update documents 
	set GeneralStatusID = @i, Updated= getdate(), UpdatedBy = @userID,
		Name = (select top 1 title from tasks where taskid =@taskID)
	where documentID = @docID;

	-- Update document status_history. Set comment	
	if (@hID <> (select max(statusHistoryID) from document_status_history  where documentID = @docID))
		update document_status_history 	
		set comment=@comment
		where statusHistoryID = (select max(statusHistoryID) from document_status_history  where documentID = @docID)

	--if new status "close" the task checked assigned users to have other task 
	--and if he hasn't it, create "NOTASKS"          
	if (@status ='fixed' or @status ='cancelled' or @status ='completed' or @status ='staging')
		exec _tasks_setNoTask @taskID, 0,0
		
	if (@status = 'billable')
	begin
		update tasks
		set billable = 1
		where taskID = @taskID;
	end;
	if (@status = 'unbillable')
	begin
		update tasks
		set billable = 0
		where taskID = @taskID;
	end;
END
