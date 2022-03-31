 
CREATE PROCEDURE dbo._jobs_getProjectSummaryBySprints
(
	@fromDate datetime = null,
    @toDate datetime = null,
    @projectID bigint = null 
)
AS
BEGIN
SET NOCOUNT ON;
set @fromDate = [dbo].[DateOnly](@fromDate)
set @toDate= [dbo].[DateOnly](@toDate)
select * from
project_sprints ps 
outer apply (
	select isnull(sum(case when j.billable=1 then j.duration else 0 end), 0) billable,
        isnull(sum(duration), 0) duration
	from jobs j inner join
    tasks t on t.documentID = j.targetID
	where t.sprintID = ps.ID
	and jobDate between @fromDate and @toDate
) j
where (ps.finishDate >= @fromDate or j.duration > 0)
and ps.projectID = @projectID
END