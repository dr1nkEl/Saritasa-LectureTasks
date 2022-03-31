/*
 * Remove isBugFixing column from jobs table.
 */
CREATE PROCEDURE [dbo].[_jobs_getUserDaysJobs] 
(
        @userID int = null,     
        @from datetime   = null ,
        @to datetime   = null 
)
AS
BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;
declare @total bigint
select  @total = sum(duration)
from jobs 
where createdBy = @userID and jobDate between @from and @to 

declare @MonthWorkingDays int 
declare @branchID int
select @branchID=branchID from employees where Id = @userID
SET @MonthWorkingDays = dbo.getBranchWorkedDays( @branchID, @from, @to)
declare @adh float
select @adh=(case when @MonthWorkingDays >0 then cast(isnull(UMJ.val,0) as float)/@MonthWorkingDays else cast(isnull(UMJ.val,0) as float) end) 
from document_calcs_date UMJ 
where UMJ.documentid= @userid and UMJ.typeid='userMonthJob' and UMJ.[date] = @from
select @userID userID, @total total,  dbo.getPersonalWorkedDays( @userID, @branchID, @from, @to) MWD, @adh ADH
end