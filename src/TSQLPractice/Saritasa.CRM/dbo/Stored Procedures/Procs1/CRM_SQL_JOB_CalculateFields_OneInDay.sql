/*
 * Ivan Kozhin
 *
 * 12/14/11 added projectsNBWeekly, projectsBWeekly, projectsNBMonthly and projectsBMonthly
 * 12/16/11 added overbudgets calculations
 * 01/18/12 got back projectsNBWeekly, projectsBWeekly, projectsNBMonthly and projectsBMonthly
 * 01/25/12 added departmentsMonthly
 * 02/03/12 added departmentsDaily, removed departmentsMonthly
 * 03/04/12 add self education and overbudget to calculation (Sergey)
 * 04/04/12 added jobs statistic calculation
 * 04/09/12 fixed jobs stat calculation
 * 05/30/12 added overtime metric calculation
 * 06/01/12 regression fixes (for jobs stats)
 * 08/28/13 Added MonthUserTasksCreate calculation.
 * 12/15/16 Added jobs stats calculation for future week, if need
 */

-- =============================================
CREATE PROCEDURE [dbo].[CRM_SQL_JOB_CalculateFields_OneInDay]
AS
BEGIN
    --st1:CountLess8hMissed
    declare @d datetime
    set @d = dateadd(dd,-1, getdate()) 
    exec [_setCalcDate] 'CountLess8h' , 0, @d

    --st3: userMonthJob  job's sum-duration for a month for user
    set @d = getdate()
    exec [_setCalcDate] 'userMonthJob' , 1, @d
    if(day(getdate()) <6)
    begin
        set @d = dateadd(dd,-15, @d) 
        exec [_setCalcDate] 'userMonthJob' , 1, @d
    end

    --st4: Employment Scores calc
    update employees 
    set score = (select sum(points) from employmentScores es
    where employees.Id = es.userID 
    and created >  dateadd(day, -30, getdate()))

    set @d = getdate()
    exec [_setCalcDate] 'scoreMonth' , 1, @d
    if(day(getdate()) <6)
    begin
        set @d = dateadd(dd,-15, @d) 
        exec [_setCalcDate] 'scoreMonth' , 1, @d
    end

    --st8: clientMonthJob job's sum-duration for a month for client
    set @d = getdate()
    exec [_setCalcDate] 'clientMonthJob' , 1, @d
    if(day(getdate()) <6)
    begin
        set @d = dateadd(dd,-15, @d) 
        exec [_setCalcDate] 'clientMonthJob' , 1, @d
    end

    --st9: calculates projectsNBWeekly, projectsNBWeeklyOverbudget and projectsBWeekly
    set @d = dbo.FirstDayWeek(dbo.DateOnly(getdate()));
    declare @i int = 0;
    while @i < 5
    begin
        exec _setCalcDate 'projectsNBWeekly', 1, @d;
        exec _setCalcDate 'projectsNBWeeklyOb', 1, @d;
        exec _setCalcDate 'projectsBWeekly', 1, @d;
        set @d = dateadd(week, -1, @d);
        set @i = @i + 1;
    end;

    --st10: calculates projectsNBMonthly, projectsNBMonthlyOverbudget and projectsBMonthly
    set @d = dbo.FirstDayWeek(dbo.DateOnly(getdate()));
    set @i = 0;
    while @i < 2
    begin
        exec _setCalcDate 'projectsNBMonthly', 1, @d;
        exec _setCalcDate 'projectsNBMonthlyOb', 1, @d;
        exec _setCalcDate 'projectsBMonthly', 1, @d;
        set @d = dateadd(month, -1, @d);
        set @i = @i + 1;
    end;

    --st11: calculates departmentsDaily
    set @d = getdate();
    set @i = 0;
    while @i < 5
    begin
        exec [_setCalcDate] 'departmentsDaily' , 1, @d;
        set @d = dateadd(day, -1, @d);
        set @i = @i + 1;
    end;

    --st12: calculates user utilization, selfEduc, overbudget
    DECLARE @userID int, @prevMonth datetime
    set @d = [dbo].[DateOnly](getdate());
    set @prevMonth = dbo.LastDayMonth(dateadd(month, -1, @d))
    DECLARE user_cursor CURSOR FOR 
    SELECT userID
    FROM _vEmployeesUsersDocuments
    where generalStatusID=13
    order By userID

    OPEN user_cursor

    FETCH NEXT FROM user_cursor 
    INTO @userID

    WHILE @@FETCH_STATUS = 0
    BEGIN
        exec _calcUserUtilization @userID, @d
        exec _calcUserUtilization @userID, @prevMonth
        exec _calcSelfEduAndOverbudget @userID, @d
        exec _calcSelfEduAndOverbudget @userID, @prevMonth

        exec _calcUserOvertime @d, @userID;
        if (day(@d) < 6)
        begin
            exec _calcUserOvertime @prevMonth, @userID;
        end;

        FETCH NEXT FROM user_cursor 
        INTO @userID
    END
    CLOSE user_cursor
    DEALLOCATE user_cursor

    --st13: calculate jobs statistic
    set @d = dbo.FirstDayMonth(dbo.DateOnly(getdate()));
    declare @endMonthDate datetime = dbo.SetMaxTime(dbo.LastDayMonth(@d));
    declare @curDate DATETIME = GETDATE();

    -- If does not exist one full week in future => add her
    if (DATEDIFF(DAY, dbo.LastDayWeek(@curDate), @endMonthDate) < 7)
    BEGIN
        SET @endMonthDate = DATEADD(DAY, 7 - DATEDIFF(DAY, dbo.LastDayWeek(@curDate), @endMonthDate), @endMonthDate);
    END

    while (@d <= @endMonthDate)
    begin
        exec _jobs_stat_calculate @d, 'D'
        set @d = dateadd(day, 1, @d);
    end;

    -- calculate week capacity for current week, previous (conditionally) and next one
    set @d = getdate();
    exec _jobs_stat_calculate @d, 'W'
    if (datepart(weekday, @d) < 4)
    begin
        set @d = dateadd(week, -1, @d);
        exec _jobs_stat_calculate @d, 'W'
    end
    set @d = dateadd(week, 1, getdate());
    exec _jobs_stat_calculate @d, 'W'

    set @d = getdate();
    exec _jobs_stat_calculate @d, 'M'
    if (datepart(day, @d) < 8)
    begin
        set @d = dateadd(month, -1, @d);
        exec _jobs_stat_calculate @d, 'M'
    end
END