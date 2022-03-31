
CREATE FUNCTION getBranchWorkedDays (
@branchId int,
@startDate datetime,
@finishDate datetime
)
RETURNS INT
AS
BEGIN

return (select
   (select DATEDIFF(day, @startDate, @finishDate) + 1 as daysInRange) -
   (select count(*) from calendarList Where holiday=1 and branchID=@branchId and (date between @startDate and @finishDate)))
END