/*
 * Take into account Personal Work Days when checking for holiday periods
 */

/*
 * Fixed [_jobs_stat_calculateForDate] sp. Made calc thru _vJobsType.
 * 04/04/12 Made calculation for M and W using daily stats (Ivan).
 * 04/06/12 Fixed users calculation (Ivan).
 * 04/09/12 Fixed bug with startDate and do not calc capacity for future (Ivan).
 * 04/11/12 Changed capacity calculation, take into account capacityBillableToday (Ivan).
 * 04/17/12 Added DateOnly to W and M types (Ivan). 
 * 08/08/12 Change capacity calculation, take into account part-time employee (Khoa & Ivan).
 * 09/12/12 Fixed capacity bug (Ivan).
 * 08/20/13 Now we count holidays from calendar (Ivan).
 * 02/11/14 Remove capacityBillableToday from calculation (?).
 * 04/24/14 Add percent utilization to calculating capacity (Stas).
 * 04/21/15 Add calculation for workTypes (Stas)
 * 05/21/15 Fix calculation for workTypes (Ivan)
 * 08/06/15 Fix capacity type from int to decimal (Ivan).
 * 11/30/15 Do not include "future" days into billable capacity calculation (Kostya).
 * 16/04/16 Take into account vacations and personal holidays when calculating capacity, fixed calculation for part-time employees
 * 23/04/16 Do not calculate capacity for part-time employees
 * 03/05/16 Don't mark Personal work days as Holidays
 * 09/26/16 Remove userWorkTypes table
 * 01/17/17 Use jobs department id instead of user's one
 * 15/06/17 Make capacity of not utilized employees to 0h
 * 02/12/20 Get real total capacity from the UserStatistic table (Elina).
 */

CREATE PROCEDURE dbo._jobs_stat_calculate
(
    @date datetime,
    @type char(1)
)
AS
BEGIN
    declare @startDate datetime;
    declare @finishDate datetime;
    declare @dailyCapacity int = 8;

    -- init start and finish dates for jobs
    if (@type = 'D')
    begin
        set @startDate = dbo.DateOnly(@date);
        set @finishDate = dbo.SetMaxTime(@startDate);
    end;
    else if (@type = 'W')
    begin
        set @startDate = dbo.DateOnly(dbo.FirstDayWeek(@date));
        set @finishDate = dbo.SetMaxTime(dbo.LastDayWeek(@startDate));
    end;
    else if (@type = 'M')
    begin
        set @startDate = dbo.DateOnly(dbo.FirstDayMonth(@date));
        set @finishDate = dbo.SetMaxTime(dbo.LastDayMonth(@startDate));
    end;

    -- delete old stat data
    delete from jobs_stat
    where [date] between @startDate and @finishDate and periodType = @type;

    /*
     * We calculate detail information only for daily reports. Month and week stats
     * are based on daily stats.
     */

    if (@type = 'D')
    begin
        -- prepare users
        declare @users table
        (
            userID int not null,
            utilization bit not null,
            branchID int not null,
            departmentID int not null,
            capacity decimal(9, 2) not null default(8),
            holiday bit default(0), -- does user have holiday for the day
            percentUtilization int not null,
            workTypeID int
        )

        -- insert all active employees
        insert into @users
        select users.Id, users.Utilization, employees.branchID, departmentID, 8,
            (
                case when
                    (
                        exists (select * from calendarList where [date] = @startDate and branchID = employees.branchID and holiday = 1)
                        or exists (select * from calendarPersonal where [date] = @startDate and userId = users.Id and holiday = 1 and isSick = 0)
                    )
                    and not exists (select * from calendarPersonal where [date] = @startDate and userId = users.Id and holiday = 0)
                then 1
                else 0 end
            ) as 'holiday', UtilizationPercent,
            users.WorkTypeId
        from users
        inner join documents on documents.documentID = users.DocumentId
        inner join employees on employees.Id = users.Id
        where users.TypeId = 'E '
        and documents.created <= @finishDate
        and isnull((
                select top 1 document_status_history.statusID from document_status_history
                where document_status_history.documentID = documents.documentID
                and document_status_history.created <= @finishDate
                order by document_status_history.statusHistoryID desc
                ), -1) in (-1, 13)
        and employees.IsPartTime = 0;

        -- prepare billable capacity
        declare @usersCapacity table
        (
            userId int not null,
            branchId int not null,
            departmentId int not null,
            workTypeId int not null,
            billableCapacity decimal(9, 2) not null,
			totalCapacity decimal(9, 2) not null
        )

        insert into @usersCapacity
        select UserId, BranchId, DepartmentId, WorktypeId, BillableCapacity, TotalCapacity
        from UserStatistic
        where [Date] = @startDate

        -- prepare jobs
        declare @jobs table
        (
            jobID bigint not null,
            duration int not null,
            branchID int not null,
            departmentID int not null,
            jobType char(1) not null,
            utilized bit not null,
            userID int not null,
            workTypeID int
        )

        -- fill jobs
        insert into @jobs
        select
            jobs.jobID,
            jobs.duration,
            employees.branchID,
            lookup_workTypes.departmentID,
            _vJobsType.jobType,
            projects.utilization,
            jobs.createdBy,
            jobs.workType
        from
            _vJobsType
            inner join jobs on _vJobsType.jobID = jobs.jobID
            inner join users on jobs.createdBy = users.Id
            inner join employees on users.Id = employees.Id
            inner join projects on projects.projectID = jobs.projectID
            inner join lookup_workTypes on Jobs.WorkType = lookup_workTypes.workTypeID
        where
            jobs.jobDate between @startDate and @finishDate;

        -- insert total summary
        insert into jobs_stat (billable, overbudget, inhouse, unutilized, [admin], capacityTotal, capacityBillable, utilization, periodType,
             branchID, departmentID, [date], capacityTotalReal, capacityBillableReal, capacityBillableTodayReal)
        select
            (select isnull(sum(duration), 0) from @jobs where jobType = 'B') as 'billable',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'O') as 'overbudget',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'I') as 'inhouse',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'U') as 'unutilized',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'A') as 'admin',
            (select isnull(sum(capacity), 0) from @users) as 'capacityTotal',
            case
                when getdate() > @startDate then (select isnull(sum(billableCapacity), 0) from @usersCapacity)
                else 0
            end as 'capacityBillable',
            (select isnull(sum(duration), 0) from @jobs where utilized = 1) as 'utilization',
            @type as 'periodType',
            null as 'branchID',
            null as 'departmentID',
            @startDate as [date],
            (select isnull(sum(totalCapacity), 0) from @usersCapacity) as 'capacityTotalReal',
            (select isnull(sum(billableCapacity), 0) from @usersCapacity) as 'capacityBillableReal',
            case
                when getdate() > @startDate then (select isnull(sum(billableCapacity), 0) from @usersCapacity)
                else 0
            end as 'capacityBillableTodayReal';

        -- insert branches summary
        insert into jobs_stat (billable, overbudget, inhouse, unutilized, [admin], capacityTotal, capacityBillable, utilization, periodType,
             branchID, departmentID, [date], capacityTotalReal, capacityBillableReal, capacityBillableTodayReal)
        select
            (select isnull(sum(duration), 0) from @jobs where jobType = 'B' and branchID = [LookupBranch].[Id]) as 'billable',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'O' and branchID = [LookupBranch].[Id]) as 'overbudget',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'I' and branchID = [LookupBranch].[Id]) as 'inhouse',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'U' and branchID = [LookupBranch].[Id]) as 'unutilized',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'A' and branchID = [LookupBranch].[Id]) as 'admin',
            (select isnull(sum(capacity), 0) from @users where branchID = [LookupBranch].[Id]) as 'capacityTotal',
            case
                when getdate() > @startDate then
                    (select isnull(sum(billableCapacity), 0) from @usersCapacity where branchId = [LookupBranch].[Id])
                else 0
            end as 'capacityBillable',
            (select isnull(sum(duration), 0) from @jobs where utilized = 1 and
                branchID = [LookupBranch].[Id]) as 'utilization',
            @type as 'periodType',
            [LookupBranch].[Id] as 'branchID',
            null as 'departmentID',
            @startDate as [date],
            (select isnull(sum(totalCapacity), 0) from @usersCapacity where branchId = [LookupBranch].[Id]) as 'capacityTotalReal',
            (select isnull(sum(billableCapacity), 0) from @usersCapacity where branchId = [LookupBranch].[Id]) as 'capacityBillableReal',
            case
                when getdate() > @startDate then
                    (select isnull(sum(billableCapacity), 0) from @usersCapacity where branchId = [LookupBranch].[Id])
                else 0
            end as 'capacityBillableTodayReal'
        from [LookupBranch];

        -- insert workTypes summary
        insert into jobs_stat (billable, overbudget, inhouse, unutilized, [admin], capacityTotal, capacityBillable, utilization, periodType,
             workTypeID, departmentID, [date], capacityTotalReal, capacityBillableReal, capacityBillableTodayReal)
        select
            (select isnull(sum(duration), 0) from @jobs where jobType = 'B' and workTypeID = lookup_workTypes.workTypeID) as 'billable',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'O' and workTypeID = lookup_workTypes.workTypeID) as 'overbudget',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'I' and workTypeID = lookup_workTypes.workTypeID) as 'inhouse',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'U' and workTypeID = lookup_workTypes.workTypeID) as 'unutilized',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'A' and workTypeID = lookup_workTypes.workTypeID) as 'admin',
            (select isnull(sum(capacity), 0) from @users where workTypeID = lookup_workTypes.workTypeID) as 'capacityTotal',
            case
                when getdate() > @startDate then
                    (select isnull(sum(billableCapacity), 0) from @usersCapacity where workTypeId = lookup_workTypes.workTypeID)
                else 0
            end as 'capacityBillable',
            (select isnull(sum(duration), 0) from @jobs where utilized = 1 and
                workTypeID = lookup_workTypes.workTypeID) as 'utilization',
            @type as 'periodType',
            lookup_workTypes.workTypeID as 'workTypeID',
            null as 'departmentID',
            @startDate as [date],
            (select isnull(sum(totalCapacity), 0) from @usersCapacity where workTypeId = lookup_workTypes.workTypeID) as 'capacityTotalReal',
            (select isnull(sum(billableCapacity), 0) from @usersCapacity where workTypeId = lookup_workTypes.workTypeID) as 'capacityBillableReal',
            case
                when getdate() > @startDate then
                    (select isnull(sum(billableCapacity), 0) from @usersCapacity where workTypeId = lookup_workTypes.workTypeID)
                else 0
            end as 'capacityBillableTodayReal'
        from lookup_workTypes;

        -- insert departments summary
        insert into jobs_stat (billable, overbudget, inhouse, unutilized, [admin], capacityTotal, capacityBillable, utilization, periodType,
             branchID, departmentID, [date], capacityTotalReal, capacityBillableReal, capacityBillableTodayReal)
        select
            (select isnull(sum(duration), 0) from @jobs where jobType = 'B' and departmentID = [LookupDepartments].[Id]) as 'billable',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'O' and departmentID = [LookupDepartments].[Id]) as 'overbudget',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'I' and departmentID = [LookupDepartments].[Id]) as 'inhouse',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'U' and departmentID = [LookupDepartments].[Id]) as 'unutilized',
            (select isnull(sum(duration), 0) from @jobs where jobType = 'A' and departmentID = [LookupDepartments].[Id]) as 'admin',
            (select isnull(sum(capacity), 0) from @users where departmentID = [LookupDepartments].[Id]) as 'capacityTotal',
            case
                when getdate() > @startDate then
                    (select isnull(sum(billableCapacity), 0) from @usersCapacity where departmentId = [LookupDepartments].[Id])
                else 0
            end as 'capacityBillable',
            (select isnull(sum(duration), 0) from @jobs where utilized = 1 and
                departmentID = [LookupDepartments].[Id]) as 'utilization',
            @type as 'periodType',
            null as 'branchID',
            [LookupDepartments].[Id] as 'departmentID',
            @startDate as [date],
            (select isnull(sum(totalCapacity), 0) from @usersCapacity where departmentId = [LookupDepartments].[Id]) as 'capacityTotalReal',
            (select isnull(sum(billableCapacity), 0) from @usersCapacity where departmentId = [LookupDepartments].[Id]) as 'capacityBillableReal',
            case
                when getdate() > @startDate then
                    (select isnull(sum(billableCapacity), 0) from @usersCapacity where departmentId = [LookupDepartments].[Id])
                else 0
            end as 'capacityBillableTodayReal'
        from [LookupDepartments];
    end
    else
    begin
        insert into jobs_stat (billable, overbudget, inhouse, unutilized, [admin], capacityTotal, capacityBillable, utilization, periodType, branchID, departmentID, workTypeID,
             [date], capacityTotalReal, capacityBillableReal, capacityBillableTodayReal)
        select
            isnull(sum(billable), 0) as 'billable',
            isnull(sum(overbudget), 0) as 'overbudget',
            isnull(sum(inhouse), 0) as 'inhouse',
            isnull(sum(unutilized), 0) as 'unutilized',
            isnull(sum([admin]), 0) as 'admin',
            isnull(sum(capacityTotalReal), 0) as 'capacityTotal',
            isnull(sum(capacityBillableReal), 0) as 'capacityBillable',
            isnull(sum(utilization), 0) as 'utilization',
            @type as 'periodType',
            branchID,
            departmentID,
            workTypeID,
            @startDate,
            isnull(sum(capacityTotalReal), 0) as 'capacityTotalReal',
            isnull(sum(capacityBillableReal), 0) as 'capacityBillableReal',
            isnull(sum(capacityBillableTodayReal), 0) as 'capacityBillableTodayReal'
        from jobs_stat
        where periodType = 'D' and [date] between @startDate and @finishDate
        group by branchID, departmentID, workTypeID;
    end
END;