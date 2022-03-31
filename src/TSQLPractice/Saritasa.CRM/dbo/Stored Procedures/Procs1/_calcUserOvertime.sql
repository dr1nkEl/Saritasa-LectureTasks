CREATE procedure [dbo].[_calcUserOvertime]
    @date datetime,
    @userID int
as
begin
    declare @startDate datetime = dbo.DateOnly(dbo.FirstDayMonth(@date));
    declare @finishDate datetime = dbo.SetMaxTime(dbo.LastDayMonth(@startDate));
    declare @metricName varchar(50) = 'userMonthOvertimeH';
    declare @metricNameP varchar(50) = 'userMonthOvertimeP';

    declare @userDocumentID bigint = (select documentID from users where Id = @userID);
    declare @userBranchID int = (select branchID from employees where Id=@userID);
    declare @capacity decimal = dbo.GetBranchWorkedDays(@userBranchID, @startDate, @finishDate) * 8;
    declare @tasks table
    (
        taskID int not null,
        documentID bigint not null, -- task document id
        durationLimit decimal default (0) not null, -- task limit
        durationTotal decimal default (0) not null, -- total time spent on task
        durationTotalUser decimal default (0) not null, -- current user total time spent on task
        durationTotalUserMonth decimal default (0) not null, -- current user total time spent on task this month
        previousOvertime bigint default (0) not null, -- previous months overtime of all users
        currentOvertime bigint default (0) not null, -- current months overtime of all users
        currentUserPerc decimal default (0.0) not null, -- how many time user spent on task according to other users
        currentUserOvertime bigint default (0) not null -- current user overtime hours
    )

    -- delete previous metrics
    delete from document_calcs_date
    where (typeID = @metricName or typeID = @metricNameP) and [date] = @startDate and documentID = @userDocumentID;

    -- select all tasks that refer to user
    insert into @tasks (taskID, documentID, durationLimit)
    select tasks.taskID, tasks.documentID, isnull(tasks.durationLimit, 0)
    from jobs
    inner join tasks on jobs.targetID = tasks.documentID
    inner join projects on tasks.projectID = projects.projectID and projects.utilization = 1
    where jobs.jobDate between @startDate and @finishDate and jobs.createdBy = @userID
    group by tasks.taskID, tasks.documentID, tasks.durationLimit

    -- calc previous overtime, current overtime and duration total
    update @tasks
    set
    previousOvertime =
        (select isnull(sum(jobs.duration) - durationLimit, 0)
        from jobs
        where jobs.jobDate < @startDate and jobs.targetID = documentID),
    currentOvertime =
        (select isnull(sum(jobs.duration), 0)
        from jobs
        where jobs.jobDate between @startDate and @finishDate and jobs.targetID = documentID),
    durationTotal =
        (select isnull(sum(jobs.duration), 0)
        from jobs
        where jobs.targetID = documentID and jobs.jobDate <= @finishDate),
    durationTotalUser = 
        (select isnull(sum(jobs.duration), 0)
        from jobs
        where jobs.targetID = documentID and jobs.createdBy = @userID and jobs.jobDate <= @finishDate),
    durationTotalUserMonth =
        (select isnull(sum(jobs.duration), 0)
        from jobs
        where jobs.targetID = documentID and jobs.createdBy = @userID and jobs.jobDate between @startDate and @finishDate)
    from @tasks;

    -- calc currentUserPerc
    update @tasks
    set currentUserPerc =
        case when currentOvertime > 0 then
            (cast(isnull(durationTotalUserMonth, 0) as float) / currentOvertime)
        else
            0
        end;

    -- if we had overtime in prev month - in this month we have overtime too
    update @tasks
    set currentOvertime =
        durationTotal - durationLimit -
            (case when previousOvertime > 0 then previousOvertime else 0 end);
    update @tasks
        set currentOvertime = (case when currentOvertime > 0 then currentOvertime else 0 end);

    update @tasks
        set currentUserOvertime = currentOvertime * currentUserPerc;

    -- insert into calcs
    insert into document_calcs_date (documentID, typeID, val, [date], val2)
    values (
        @userDocumentID,
        @metricName,
        round((select isnull(sum(currentUserOvertime), 0) from @tasks), 0),
        @startDate,
        '0'
    );

    -- calc overtime for user in percentage
    declare @allTasksTotalLimit decimal = 0; -- X
    select @allTasksTotalLimit = sum(durationLimit)
    from @tasks;

    declare @allTasksTotalDuration decimal = 0; -- Y
    select @allTasksTotalDuration = sum(durationTotal)
    from @tasks;

    declare @userTasksDuration decimal = 0; -- Z
    select @userTasksDuration = sum(durationTotalUser)
    from @tasks;

    declare @overtimeP decimal = 0;
    declare @overtimePersonal decimal = 0;

    if (@allTasksTotalDuration > 0 and @allTasksTotalLimit > 0)
    begin
        set @overtimeP = (@allTasksTotalDuration - @allTasksTotalLimit) * 100 / @allTasksTotalLimit;
        set @overtimePersonal = (@userTasksDuration / @allTasksTotalDuration) * @overtimeP;
        if (@overtimePersonal < 0)
        begin
            set @overtimePersonal = 0;
        end;
    end;

    declare @overtimeMonthly decimal = 0;
    declare @jobsMonthDuration decimal = 0;

    set @jobsMonthDuration = (select SUM(duration) from jobs where jobs.jobDate between @startDate and @finishDate and jobs.createdBy = @userID);

    if(@capacity > 0)
    begin
        set @overtimeMonthly = @jobsMonthDuration * 100.0 / (@capacity * 60);
    end

    insert into document_calcs_date (documentID, typeID, val, [date], val2)
    values (
        @userDocumentID,
        @metricNameP,
        isnull(round(@overtimePersonal, 0), 0),
        @startDate,
        isnull(@overtimeMonthly, 0)
    );

    -- debug
    --select @overtimeP as 'OT', @overtimePersonal as 'OTP';
    --select @allTasksTotalLimit as 'allTasksTotalLimit - X', @allTasksTotalDuration as 'allTasksTotalDuration - Y', @userTasksDuration as 'userTasksDuration - Z';
    --select * from @tasks;
end
