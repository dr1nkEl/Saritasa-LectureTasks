/*
 * Do update project.billable flag in case of overbudget.
 */
CREATE PROCEDURE [dbo].[_jobs_updateProjectDuration]
(
    @projID bigint = null 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
    
	declare @projLimit int;
	declare @projBillable bit;
	declare @canChangeOverbudget bit;
	declare @send75Limit bit;
	declare @sendLimitExceed bit;
	declare @send125Limit bit;
	declare @send150Limit bit;
	declare @manHours int;
	
	select @projLimit=durationLimit, @projBillable=billable, @manHours = billableMenHours,
		@canChangeOverbudget = (case when billingType='F' then 1 else 0 end), 
		@send75Limit=send75Limit, @sendLimitExceed=sendLimitExceed, @send125Limit=send125Limit, @send150Limit=send150Limit  
	from projects where projectID = @projID
	
    if (@projLimit is not null AND @projLimit > 0 and @manHours is not null)
    begin
		if @canChangeOverbudget = 1 
		begin
			if @manHours < @projLimit 
				update projects set overbudget = 0 where projectID = @projID
			else if @manHours >= @projLimit 
				update projects set overbudget = 1 where projectID = @projID

			if @projBillable = 0 AND @manHours < @projLimit 
				update projects set billable = 1 where projectID = @projID;
			if @projBillable = 1 AND @manHours >= @projLimit 
				update projects set billable = 0 where projectID = @projID;
		end
		
		if @send150Limit is not Null AND @manHours < cast(Round(@projLimit*1.5,0) as int)
			update projects set send150Limit=null where projectID=@projID
		if @send125Limit is not Null AND @manHours < cast(Round(@projLimit*1.25,0) as int)
			update projects set send125Limit=null where projectID=@projID		
		if @sendLimitExceed is not Null AND @manHours <= @projLimit
			update projects set sendLimitExceed=null where projectID=@projID
		if @send75Limit is not Null AND @manHours <= cast(Round(@projLimit*0.75,0) as int)
			update projects set send75Limit=null where projectID=@projID
    
		if @projBillable = 1
		BEGIN		
			if @send150Limit is Null and @manHours >= cast(Round(@projLimit*1.5,0) as int)
				update projects set send150Limit=1 where projectID=@projID
			else if @send125Limit is Null AND @manHours < cast(Round(@projLimit*1.5,0) as int) AND @manHours >= cast(Round(@projLimit*1.25,0) as int)
				update projects set send125Limit=1 where projectID=@projID
			else if @sendLimitExceed is Null AND @manHours >= @projLimit AND @manHours < cast(Round(@projLimit*1.25,0) as int)
				update projects set sendLimitExceed=1 where projectID=@projID
			else if @send75Limit is Null AND @manHours < @projLimit and @manHours >= cast(Round(@projLimit*0.75,0) as int)
				update projects set send75Limit=1 where projectID=@projID			
		END
end   
END
