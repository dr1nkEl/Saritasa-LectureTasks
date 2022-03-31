CREATE PROCEDURE [dbo].[_jobs_getDailyUsersJobsList]
(
    @userID int   = null ,
    @from datetime   = null ,
    @to datetime   = null 
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here	

    set @from = [dbo].[DateOnly](@from)
    set @to = [dbo].[DateOnly](dateadd(day,1,@to))

    select  isnull(sum(case when jobs.billable=1 then duration else 0 end), '0') as 'billable',
            isnull(sum(case when jobs.billable=0 then duration else 0 end) , '0') as 'nobillable',
            isnull(sum(jobs.duration) , '0') as 'all' ,
            jobDate as date
    from jobs 
    where  (jobDate >= @from) and (jobDate < @to)
        and (@userID=0 or createdby=@userID)
    group by jobDate
    order by jobDate DESC
END