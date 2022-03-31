
CREATE PROCEDURE dbo._jobs_getProjectSummaryByComponents
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
select * from
project_features pf
outer apply (
	select isnull(sum(case when j.billable = 1 then j.duration else 0 end), 0) billable,
        isnull(sum(j.duration) , 0) duration
	from jobs j inner join
		tasks t on j.targetID = t.documentID
	where t.projectID = pf.projectID
	and t.featureID = pf.ID
	and jobDate between @fromDate and @toDate
) j
where pf.projectID = @projectID
and j.duration > 0
END