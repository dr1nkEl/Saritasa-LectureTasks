/*
 * Remove task_links table.
 */
CREATE FUNCTION [dbo].[getAllTaskID] 
(	
	-- Add the parameters for the function here
	@objID int,   --	taskID		projectID	clientID
	@type varchar(3) -- T - task, PRO -project, C- client
)
RETURNS @tasks TABLE (taskID int, documentID bigint)
AS
begin
	if(@type='T')
	begin		
		insert @tasks	
		select taskID, documentID from tasks 
		where taskid = @objID
	end
	else if(@type='PRO')
	begin		
		insert @tasks
		select taskID, documentID from tasks 
		where (targetid in (select documentid from projects where projectid = @objID))
	end
	else if(@type='C')
	begin		
		insert @tasks
		select taskID, documentID from tasks 
		where 
		    (targetid in (select documentid from projects where clientid = @objID))
			or (targetid in (select documentid from clients where clientid = @objID))
	end
	RETURN 
end