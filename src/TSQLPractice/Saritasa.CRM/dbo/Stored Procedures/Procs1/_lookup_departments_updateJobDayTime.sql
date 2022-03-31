
/*
 * Calculates daysJob, daysJobUtilization, monthJobs, userMonthJob, monthJobsUtilization
 * for the specified period using [_setCalcDate] sp.
 */
create procedure _lookup_departments_updateJobDayTime
(
	@From datetime,
	@To datetime
)
as
begin
	if (@To < @From)
	begin
		return;
	end;
		
	declare @currentDate datetime = @From;
	declare @currentMonth int = -1;
	while (@currentDate <= @To)
	begin
		exec [_setCalcDate]  'daysJob', 1, @currentDate;
		exec [_setCalcDate]  'daysJobUtilization', 1, @currentDate;
		print 'Calculate for date: ' + convert(varchar, @currentDate, 120);
		
		if (month(@currentDate) <> @currentMonth)
		begin
			exec [_setCalcDate] 'monthJobs', 1, @currentDate;
			exec [_setCalcDate] 'userMonthJob' , 1, @currentDate;
			exec [_setCalcDate] 'monthJobsUtilization', 1, @currentDate;
			set @currentMonth = month(@currentDate);
			print 'Calculate for month: ' + convert(varchar, @currentDate, 120);
		end;
		
		set @currentDate = dateadd(day, 1, @currentDate);
	end;
end;