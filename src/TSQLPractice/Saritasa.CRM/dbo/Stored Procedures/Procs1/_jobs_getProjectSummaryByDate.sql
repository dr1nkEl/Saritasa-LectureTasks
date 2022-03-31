CREATE PROCEDURE [dbo].[_jobs_getProjectSummaryByDate]
(
        @fromDate datetime   = null ,
        @toDate datetime = null,
        @projectID bigint   = null 
)
AS
BEGIN
SET NOCOUNT ON;
set @fromDate = [dbo].[DateOnly](@fromDate)
set @toDate= [dbo].[DateOnly](@toDate)

select  jobDate date,   
        isnull(sum(case when billable=1 then duration else 0 end), 0) billable,
        isnull(sum(duration) , 0) duration
from jobs j
where 
        projectID = @projectID
        and  jobDate between  @fromDate and @toDate 
group by jobDate
end