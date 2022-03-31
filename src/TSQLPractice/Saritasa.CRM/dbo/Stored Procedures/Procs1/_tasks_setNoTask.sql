


CREATE PROCEDURE dbo._tasks_setNoTask
(
	@taskID bigint = null,
	@userID int = null,
	@minCount int = null 
)
AS
BEGIN
  if (@userID is null or @userID = 0)
  begin
    INSERT INTO [calendarEvents]
    ([date]
    ,[text]
    ,[createdBy]
    ,[documentID]
    ,[typeID]
    ,[senderList])
    SELECT 
      getdate(),
      'Task #' + cast(@taskID as char(6)) + ' was finished or Employee was unassingned and this Employee hasn''t other active assigned task now.',
      ta.userID,
      null,
      'NT',
      ''
    FROM task_assigned ta 
    left join  
  		(SELECT     userID, count(*) as col
  		 FROM     task_assigned
  		 where finishedWork is null and deleted is null
  				and userID in (SELECT userID FROM task_assigned WHERE (taskID = @taskID))
  				and taskid in (select objectID from documents where 
  		typeID ='T' and 
  		generalStatusID in (select statusID from getTaskStatusesForStatusFilter('active')))
  		group by userID) as col on col.userID = ta.userID
    WHERE (ta.taskID = @taskID) and isnull(col.col,0)<=@minCount
  end
  else
  begin 
    INSERT INTO [calendarEvents]
               ([date]
               ,[text]
               ,[createdBy]
               ,[documentID]
               ,[typeID]
               ,[senderList])     
    SELECT 
      getdate(), 'Employee was unassingned and hasn''t other active assigned task now.',
      u.Id,
      null,
      'NT',
      ''
    FROM users u
    left join  
  		(SELECT     userID, count(*) as col
  		 FROM     task_assigned
  		 where finishedWork is null and deleted is null and userID = @userID
  				and taskid in (select objectID from documents where 
  										typeID ='T' and 
  										generalStatusID in (select statusID from getTaskStatusesForStatusFilter('active')))
  		group by userID) as col on col.userID = u.Id
    WHERE u.Id = @userID and isnull(col.col,0) <= @minCount 
  end
END
