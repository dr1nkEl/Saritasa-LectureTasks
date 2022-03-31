-- =============================================
-- Author:		AFar
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[getParentTaskID] 
(
    -- Add the parameters for the function here
    @taskID int
)
RETURNS int
AS
BEGIN
    -- Declare the return variable here
    DECLARE @pID int
    declare @type varchar(3)
    declare @dID bigint 
    set @pID = null
    select @dID = targetid from tasks where taskid=@taskID
    select @type= typeID from documents where documentid = @dID  
    if(@type = 'T') 
        SELECT @pID = taskid from tasks where documentid = @dID  		
    
    RETURN @pID
    --RETURN 4
END