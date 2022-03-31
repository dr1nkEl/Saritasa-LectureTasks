CREATE FUNCTION getPersonalWorkedDays (
@userId int,
@branchId int,
@startDate datetime,
@finishdate datetime
)
RETURNS INT
AS
BEGIN
if(@branchId is null)
        select @branchId = branchID from employees where Id = @userId;

return
   (select
   --- count of days in month
   (select DATEDIFF(day, @startDate, @finishDate) + 1 as daysInRange) - 
   (select count(*) from (
    --- state holiday
    Select date from calendarList
    Where holiday=1 and branchID=@branchId
     and (date between @startDate and @finishdate)
    except
    --- personal workday
    select date from (select max(clID) id from dbo.calendarPersonal
                      Where userId=@userId
    group by date) f
       left join dbo.calendarPersonal cp on f.id = cp.clID
    where holiday=0 and userId=@userId and (date between @startDate and @finishdate)
    union
    --- personal holiday
    Select date from 
    (select max(clID) id from dbo.calendarPersonal
     Where userId=@userId
    group by date) f
       left join dbo.calendarPersonal cp on f.id = cp.clID
    where holiday=1 and userId=@userId and (date between @startDate and @finishdate)
    ) holidays) workdays)
END

-- This logic don't take into account a hire date for new employees.