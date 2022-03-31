-- =============================================
-- Author:		AFar
-- Create date: 18.11.2008
-- Description:	return list of all object releted from this doc
--				docID  may be Client, project or task 
--				for Client and contact = true also include in return all contact of this client   
-- =============================================
CREATE FUNCTION [dbo].[getAllTargetID2] 
(	
    @docID bigint,
    @contact bit 
)
RETURNS @targetID TABLE (objID bigint,typeID varchar(3), documentID bigint)
AS
begin
    declare @objID bigint
    declare @type varchar(3)
    select @type = typeID, @objID=objectID from documents where documentid = @docID
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

        if(@contact=1)
            insert @targetID 
                select u.Id,'UC', documentID from contacts c 
                left join users u on u.Id = c.userid
                where clientID=@objID

        insert @targetID 
            select @objID,'C', documentID from clients where clientid = @objID
    end
    else 
    begin				
        insert @targetID select @objID, @type, @docID 
    end	
    RETURN 
end