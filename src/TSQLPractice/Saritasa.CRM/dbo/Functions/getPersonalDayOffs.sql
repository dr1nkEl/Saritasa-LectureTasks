/*
 * Add option to ignore branch holidays
 */
CREATE function dbo.getPersonalDayOffs (
    @userId int,
    @branchId int,
    @startDate datetime, 
    @finishdate datetime,
  @ignoreBranchHolidays bit = 0
)
returns int
as
begin
    if(@branchId is null)
        select @branchId = branchID from employees where Id = @userId;

    return (select count(*) from ( 
        -- personal holidays, sickdays
        select cp.[date] from (
            select max(clId) id from dbo.calendarPersonal 
            where userId = @userId
            group by date) f
        left join dbo.calendarPersonal cp on f.id = cp.clId
    left join (SELECT * from dbo.calendarList l where l.branchID = @branchId) cl on cp.date = cl.date
        where (cp.holiday = 1 or isSick = 1) and userId = @userId and (cp.[date] between @startDate and @finishdate)
      -- branch holidays
      and (@ignoreBranchHolidays = 0 or (@ignoreBranchHolidays = 1 AND cl.holiday = 0))
        except
        -- personal workdays
        select [date] from (
            select max(clId) id from dbo.calendarPersonal
            where userId = @userId
            group by [date]) f
        left join dbo.calendarPersonal cp on f.id = cp.clId
        where holiday = 0 and userId = @userId and ([date] between @startDate and @finishdate)
        ) a)
        
    -- minus personal work days
    - (select count(*) from (
            select max(clId) id from dbo.calendarPersonal
            where userId = @userId
            group by [date]) f
        left join dbo.calendarPersonal cp on f.id = cp.clId
        where holiday = 0 and userId = @userId and ([date] between @startDate and @finishdate))
    
end