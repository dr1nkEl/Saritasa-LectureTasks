
/*
 * 12/14/11 added projectsNBDaily and projectsBDaily (Ivan)
 * 12/16/11 added overbudget calculation (Ivan)
 * 04/13/12 added st10 - calculate jobs statistic (Ivan)
 * 04/19/12 added st11 - st16 (Ivan)
 * 08/14/12 removed 'TMH' calculation section (Quan)
 * 08/17/12 added back 'TMH' since we use it in another parts of system (Ivan)
 */

CREATE PROCEDURE [dbo].[CRM_SQL_JOB_CalculateFields_15m]
AS
BEGIN
    -- st1: calculates tasks count for project
    exec _document_calcs_Change 'PT'

    --st4: set current project for clients
    exec _document_calcs_Change 'CP'

    --st5: calculates count of task men-hours (sum of all jobs' duration)
    exec _document_calcs_Change 'TMH'

    --st8: calculates count of project men-hours (sum of all jobs' duration)
    exec _document_calcs_Change 'PMH'

    --st9: calculates projectsNBDaily and projectsBDaily
    declare @d datetime = dbo.DateOnly(getdate());
    declare @i int = 0;

    --st10: calculate jobs statistic
    set @d = getdate();
    exec _jobs_stat_calculate @d, 'D'
    exec _jobs_stat_calculate @d, 'W'
    exec _jobs_stat_calculate @d, 'M'

    --st11: 'daysJob' and 'daysJobUtilization' for last 5 days
    set @d = getdate()
    exec [_setCalcDate] 'daysJob', 1, @d
    exec [_setCalcDate] 'daysJobUtilization', 1, @d
    set @d = dateadd(dd,-1, @d) --1
    exec [_setCalcDate]  'daysJob', 1, @d
    exec [_setCalcDate]  'daysJobUtilization', 1, @d
    set @d = dateadd(dd,-1, @d) --2
    exec [_setCalcDate]  'daysJob', 1, @d
    exec [_setCalcDate]  'daysJobUtilization', 1, @d
    set @d = dateadd(dd,-1, @d) --3
    exec [_setCalcDate]  'daysJob', 1, @d
    exec [_setCalcDate]  'daysJobUtilization', 1, @d
    set @d = dateadd(dd,-1, @d) --4
    exec [_setCalcDate]  'daysJob', 1, @d
    exec [_setCalcDate]  'daysJobUtilization', 1, @d
    set @d = dateadd(dd,-1, @d) --5
    exec [_setCalcDate]  'daysJob', 1, @d
    exec [_setCalcDate]  'daysJobUtilization', 1, @d

    --st12: taskCompleted (count task completed in day)
    set @d = getdate()
    set @d = dateadd(dd,-1, @d) 
    exec [_setCalcDate]  'taskCompleted', 1, @d

    --st13: monthJobs, userMonthJob, monthJobsUtilization
    set @d = getdate()
    exec [_setCalcDate] 'monthJobs', 1, @d
    exec [_setCalcDate] 'userMonthJob' , 1, @d
    exec [_setCalcDate] 'monthJobsUtilization', 1, @d
    if(day(@d) < 7)
    begin
	    set @d = dateadd(month, -1, @d)
	    exec [_setCalcDate] 'monthJobs', 1, @d	
	    exec [_setCalcDate] 'userMonthJob' , 1, @d
	    exec [_setCalcDate] 'monthJobsUtilization', 1, @d
    end

    --st14: userMonthJob job's sum-duration for a month for user
    set @d = getdate()
    exec [_setCalcDate] 'userMonthJob' , 1, @d
    if(day(getdate()) <6)
    begin
	    set @d = dateadd(dd, -15, @d) 
	    exec [_setCalcDate] 'userMonthJob' , 1, @d
    end

    --st15: employment Scores calc
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

    --st16: projectMonthJob job's sum-duration for a month for project
    set @d = getdate()
    exec [_setCalcDate] 'projectMonthJob' , 1, @d
    if(day(getdate()) <6)
    begin
        set @d = dateadd(dd,-15, @d) 
        exec [_setCalcDate] 'projectMonthJob' , 1, @d
    end
	
    --st17: calculates user utilization, selfEduc, overbudget
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
	    FETCH NEXT FROM user_cursor 
	    INTO @userID
    END 
    CLOSE user_cursor
    DEALLOCATE user_cursor
END