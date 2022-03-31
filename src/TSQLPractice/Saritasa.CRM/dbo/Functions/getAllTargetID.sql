-- =============================================
-- Author:		AFar
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getAllTargetID] 
(	
	-- Add the parameters for the function here
	@objID bigint,   --	taskID		projectID	clientID
	@type varchar(3) -- T - task, PRO -project, C- client
	
)
RETURNS @targetID TABLE (objID bigint,typeID varchar(3), documentID bigint)
AS
begin
	if(@type='T')
	begin		
		insert @targetID select taskID, 'T', documentID from [dbo].[getAllTaskID](@objID, @type) 			
	end
	else if(@type='PRO')
	begin		
		insert @targetID select taskID, 'T', documentID from getAllTaskID(@objID, @type)
		insert @targetID 
			select @objID,'PRO', documentID from projects where projectid = @objID 		
	end
	else if(@type='C')
	begin		
		insert @targetID select taskID, 'T', documentID from getAllTaskID(@objID, @type)
		insert @targetID 
			select projectid,'PRO', documentID from projects where clientid = @objID
		insert @targetID 
			select @objID,'C', documentID from clients where clientid = @objID
	end
	RETURN 
end