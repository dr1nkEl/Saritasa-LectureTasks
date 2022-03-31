create function getAssignedHoursDaily (
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
		, UserId
	from (
		select 
			ProjectId
			, WorkTypeId
			, DATEADD(Day, wd, pa.StartPeriodOn) as WorkDay
			, pr.Duration / 5. as Duration
			, UserId
		from 
			ProjectHoursAllocations pa
		inner join 
			ProjectResourceAllocations pr
			on pa.Id = pr.ProjectHoursAllocationId
		, (values (0), (1), (2), (3), (4)) as WorkDays(wd)
		where 
			StartPeriodOn <= @dateTo and DATEADD(Day, 4, StartPeriodOn) >= @dateFrom
	) as _
	where 
		WorkDay between @dateFrom and @dateTo