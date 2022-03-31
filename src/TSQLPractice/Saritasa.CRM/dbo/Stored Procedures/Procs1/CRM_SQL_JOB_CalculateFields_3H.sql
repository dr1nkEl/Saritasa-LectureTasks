/*
 * Ivan Kozhin
 *
 * Remove departmentsDaily.
 */

CREATE PROCEDURE [dbo].[CRM_SQL_JOB_CalculateFields_3H]
AS
BEGIN
    --st1:'daysJob' and 'daysJobUtilization' for last 5 days
    declare @d datetime
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

    --st2: taskCompleted (count task completed in day)
    set @d = getdate()
    set @d = dateadd(dd,-1, @d)
    exec [_setCalcDate]  'taskCompleted', 1, @d

    --st3: monthJobs, userMonthJob, monthJobsUtilization
    set @d = getdate()
    exec [_setCalcDate] 'monthJobs', 1, @d
    exec [_setCalcDate] 'userMonthJob' , 1, @d
    exec [_setCalcDate] 'monthJobsUtilization', 1, @d

    if (day(@d) < 7)
    begin
        set @d = dateadd(month, -1, @d)
        exec [_setCalcDate] 'monthJobs', 1, @d
        exec [_setCalcDate] 'userMonthJob' , 1, @d
        exec [_setCalcDate] 'monthJobsUtilization', 1, @d
    end
END