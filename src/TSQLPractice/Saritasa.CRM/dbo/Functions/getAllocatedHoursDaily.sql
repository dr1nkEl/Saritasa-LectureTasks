create function getAllocatedHoursDaily (
	@dateFrom date
	, @dateTo date
) 
returns table 
as return
	select 
		ProjectId
		, WorkTypeId
		, WorkDay
		, Duration
	from (
		select 
			ProjectId
			, WorkTypeId
			, DATEADD(Day, wd, pa.StartPeriodOn) as WorkDay
			, Duration / 5. as Duration
		from 
			ProjectHoursAllocations pa
			, (values (0), (1), (2), (3), (4)) as WorkDays(wd)
		where
			StartPeriodOn <= @dateTo and DATEADD(Day, 4, StartPeriodOn) >= @dateFrom
	) as _
	where 
		WorkDay between @dateFrom and @dateTo