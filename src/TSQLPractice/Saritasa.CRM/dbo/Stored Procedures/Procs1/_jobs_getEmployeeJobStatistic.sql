CREATE PROCEDURE [dbo].[_jobs_getEmployeeJobStatistic]
	 @userID int,
	 @first datetime, 
	 @last datetime,
	 @period char(1)='D'
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @d datetime
    SET @d = dbo.DateOnly(@first)
SET @last = dbo.DateOnly(@last)
CREATE TABLE #temp
(
  [date] datetime,
  jobType varchar(5),
  duration int
)
CREATE TABLE #dates
(
  [date] datetime
)

if(@period = 'D')
BEGIN
	while(@d <= @last)
	begin
		insert into #dates select @d
		
		insert into #temp
		select @d as [date], jt.jobType, SUM(isnull(j.duration,0)) as duration 
		from jobs j
		inner join dbo._vJobsType jt on j.jobID=jt.jobID
		where j.jobDate=@d and j.createdBy=@userID
		group by jt.jobType
			
		SET @d = dateadd(day, 1, @d)
	end
END
if(@period = 'W')
BEGIN
	while(@d <= @last)
	begin
		insert into #dates select @d
	
		insert into #temp
		select @d as [date], jt.jobType, SUM(isnull(j.duration,0)) as duration 
		from jobs j
		inner join dbo._vJobsType jt on j.jobID=jt.jobID
		where j.jobDate between dbo.FirstDayWeek(dbo.DateOnly(@d)) and dbo.SetMaxTime(dbo.LastDayWeek(dbo.DateOnly(@d))) and j.createdBy=@userID
		group by jt.jobType
			
		SET @d = dateadd(week, 1, @d)
	end
END
if(@period = 'M')
BEGIN
	while(@d <= @last)
	begin
		insert into #dates select @d
	
		insert into #temp
		select @d as [date], jt.jobType, SUM(isnull(j.duration,0)) as duration 
		from jobs j
		inner join dbo._vJobsType jt on j.jobID=jt.jobID
		where j.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@d)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@d))) and j.createdBy=@userID
		group by jt.jobType
		
		SET @d = dateadd(month, 1, @d)
	end
END

select [date], jobType, duration from #temp
drop table #temp

select [date] from #dates
drop table #dates
END