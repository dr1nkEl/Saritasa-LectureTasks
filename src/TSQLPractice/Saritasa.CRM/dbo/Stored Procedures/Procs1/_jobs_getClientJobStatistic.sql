CREATE PROCEDURE [dbo].[_jobs_getClientJobStatistic]
    -- Add the parameters for the stored procedure here
     @clientID int,
     @first datetime, 
     @last datetime,
     @period char(1)='D',
     @groupBy char(1)='P',
     @projectID int=-1,
     @departmentID int=-1,
     @branchID int=-1
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @d datetime
    SET @d = dbo.DateOnly(@first)
SET @last = dbo.DateOnly(@last)
CREATE TABLE #temp
(
  [date] datetime,
  groupID int,
  duration int
)
CREATE TABLE #dates
(
  [date] datetime
)
CREATE TABLE #userFilter(
    userID int
)
insert into #userFilter
select u.Id from users u
inner join employees e ON e.Id = u.Id
where (@branchID <= 0 OR e.branchID=@branchID)
if(@period = 'D')
BEGIN
    while(@d <= @last)
    begin
        insert into #dates select @d
        
        if(@groupBy = 'P')
        begin
            insert into #temp
            select @d as [date], j.projectID, SUM(isnull(j.duration,0)) as duration
            from jobs j
            inner join #userFilter u on u.userID=j.createdBy
            where j.jobDate=@d and j.clientID=@clientID and (@projectID <= 0 OR j.projectID=@projectID)
            and (@departmentID <= 0 OR j.workType=@departmentID)
            group by j.projectID
        end
        ELSE
        begin
            insert into #temp
            select @d as [date], j.workType, SUM(isnull(j.duration,0)) as duration
            from jobs j
            inner join #userFilter u on u.userID=j.createdBy
            where j.jobDate=@d and j.clientID=@clientID and (@projectID <= 0 OR j.projectID=@projectID)
            and (@departmentID <= 0 OR j.workType=@departmentID)
            group by j.workType
        end
        SET @d = dateadd(day, 1, @d)
    end
END
if(@period = 'W')
BEGIN
    while(@d <= @last)
    begin
        insert into #dates select @d
    
        if(@groupBy = 'P')
        begin
            insert into #temp
            select @d as [date], j.projectID, SUM(isnull(j.duration,0)) as duration
            from jobs j
            inner join #userFilter u on u.userID=j.createdBy
            where j.jobDate between dbo.FirstDayWeek(dbo.DateOnly(@d)) and dbo.SetMaxTime(dbo.LastDayWeek(dbo.DateOnly(@d))) and j.clientID=@clientID and (@projectID <= 0 OR j.projectID=@projectID)
            and (@departmentID <= 0 OR j.workType=@departmentID)
            group by j.projectID
        end
        ELSE
        begin
            insert into #temp
            select @d as [date], j.workType, SUM(isnull(j.duration,0)) as duration
            from jobs j
            inner join #userFilter u on u.userID=j.createdBy
            where j.jobDate between dbo.FirstDayWeek(dbo.DateOnly(@d)) and dbo.SetMaxTime(dbo.LastDayWeek(dbo.DateOnly(@d))) and j.clientID=@clientID and (@projectID <= 0 OR j.projectID=@projectID)
            and (@departmentID <= 0 OR j.workType=@departmentID)
            group by j.workType
        end
        SET @d = dateadd(week, 1, @d)
    end
END
if(@period = 'M')
BEGIN
    while(@d <= @last)
    begin
        insert into #dates select @d
    
        if(@groupBy = 'P')
        begin
            insert into #temp
            select @d as [date], j.projectID, SUM(isnull(j.duration,0)) as duration
            from jobs j
            inner join #userFilter u on u.userID=j.createdBy
            where j.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@d)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@d))) and j.clientID=@clientID and (@projectID <= 0 OR j.projectID=@projectID)
            and (@departmentID <= 0 OR j.workType=@departmentID)
            group by j.projectID
        end
        ELSE
        begin
            insert into #temp
            select @d as [date], j.workType, SUM(isnull(j.duration,0)) as duration
            from jobs j
            inner join #userFilter u on u.userID=j.createdBy
            where j.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@d)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@d))) and j.clientID=@clientID and (@projectID <= 0 OR j.projectID=@projectID)
            and (@departmentID <= 0 OR j.workType=@departmentID)
            group by j.workType
        end
        SET @d = dateadd(month, 1, @d)
    end
END
drop table #userFilter

select [date], groupID, duration from #temp
drop table #temp

select [date] from #dates
drop table #dates
END