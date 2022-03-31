CREATE PROCEDURE _getUserUtlization
(
    @userId int,
    @startDate datetime,
	@endDate datetime,
	@userUtilization int = 0 OUTPUT,
	@userBillableUtilization int = 0 OUTPUT
)
AS
BEGIN
    declare @duration int, @durationBillable int

    select @duration = SUM(j.duration)
	from jobs j
	inner join projects p on p.projectID = j.projectID
	where j.jobDate between @startDate and @endDate and j.createdBy = @userID and p.utilization = 1;

	select @durationBillable = SUM(j.duration)
	from jobs j
	inner join projects p on p.projectID = j.projectID
	where j.jobDate between @startDate and @endDate and j.createdBy = @userID and p.utilization = 1 and j.billable = 1;

	-- Get capacity.
	declare @capacity decimal = 0

	select @capacity = SUM(BillableCapacity) * 60
	from UserStatistic
	where UserStatistic.Date between @startDate and @endDate and UserStatistic.UserId = @userID

	if (@capacity > 0)
	begin
	    SET @userUtilization = ROUND((100 * (ISNULL(@duration, 0)) / @capacity), 0);
		SET @userBillableUtilization = ROUND((100 * (ISNULL(@durationBillable, 0)) / @capacity), 0);
	end;
END