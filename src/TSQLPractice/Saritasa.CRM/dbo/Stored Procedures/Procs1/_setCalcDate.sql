/*
 * Ivan Kozhin
 *
 * 11/10/11 Added monthJobsUtilization type.
 * 12/14/11 Added calculations for reports/financial metrics page.
 * 12/16/11 Fix.
 * 01/25/12 Added departmentsMonthly.
 * 01/26/12 Added departmentsDaily.
 * 04/25/12 Fixed monthUserTaskCompl calculation.
 * 08/28/13 Added MonthUserTasksCreate calculation.
 */

CREATE PROCEDURE [dbo].[_setCalcDate] 
        @typeID varchar(50) = '', 
        @ID int = 0,
        @date datetime
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here     
    set @date = [dbo].[DateOnly](@date)
    declare @first datetime
    declare  @last datetime
    declare @currentDate datetime
    set @currentDate=GetDate()
    set @first = dbo.FirstDayMonth(@date)
    set @last = dbo.LastDayMonth(@date)

    if(@typeID = 'daysJob')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @date
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select 1, @typeID, @date,
                isnull(sum(case when billable=1 then duration else 0 end)/60, '0'),
                isnull(sum(case when billable=0 then duration else 0 end)/60 , '0')
        from jobs 
        where jobDate = @date
        --group by [dbo].[DateOnly](created)
    end

    if(@typeID = 'daysJobUtilization')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @date
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select 1, @typeID, @date,
                isnull(sum(case when billable=1 then duration else 0 end)/60, '0'),
                isnull(sum(case when billable=0 then duration else 0 end)/60, '0')
        from jobs
        inner join users on jobs.createdBy = users.Id
        where jobDate = @date and users.Utilization = 1
    end

    if(@typeID = 'monthJobs')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @first
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select 1, @typeID, @first,
                isnull(sum(case when billable=1 then duration else 0 end)/60, '0'),
                isnull(sum(case when billable=0 then duration else 0 end)/60, '0') 
        from jobs 
        where jobDate between @first and @last
    end

    if(@typeID = 'monthJobsUtilization')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @first
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select 1, @typeID, @first,
                isnull(sum(case when billable=1 then duration else 0 end)/60, '0'),
                isnull(sum(case when billable=0 then duration else 0 end)/60, '0') 
        from jobs 
        inner join users on jobs.createdBy = users.Id
        where jobDate between @first and @last and users.Utilization = 1
    end

    if(@typeID = 'taskCompleted')
    begin
        delete from document_calcs_date  where typeid =@typeID and date  = @date
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select 1, @typeID, @date, count(*),''
        from  tasks     
        where finishDate between @date and dateadd(day ,1, @date)   
    end

    -- job's sum-duration for a month for user
    if(@typeID = 'userMonthJob')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @first
        
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select jobs.createdby, @typeID, @first,
                isnull(sum(duration), '0'),
                isnull(sum(case when billable=1 then duration else 0 end), '0') 
        from jobs 
        where jobDate between @first and @last            
        group by jobs.createdby
    end

    --job's sum-duration for a month for project
    if(@typeID='projectMonthJob')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @first
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select jobs.projectID, @typeID, @first,
                isnull(sum(duration), '0'),
                isnull(sum(case when billable=1 then duration else 0 end), '0') 
        from jobs 
        where projectid is not null and jobDate between @first and @last
        group by jobs.projectID
    end

    --job's sum-duration for a month for client
    if(@typeID='clientMonthJob')
    begin
        delete from document_calcs_date  where typeid = @typeID and date  = @first;
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select clients.documentID, @typeID, @first,
                isnull(sum(duration), '0'),
                isnull(sum(case when jobs.billable=1 then duration else 0 end), '0') 
        from jobs
        inner join clients on jobs.clientID = clients.clientID
        where jobDate between @first and @last
        group by jobs.clientID, clients.documentID
    end

    --Count of missed daily reports for a month
    if(@typeID = 'CountLess8h')
    begin                   
        delete from document_calcs_date  where typeid = @typeID and date  = @first
        insert into document_calcs_date(documentID,typeID,date,val,val2)
        select u.Id , @typeID, @first, 
                 sum(case when isnull(j.durationDay,0) < 60*8 then 1 else 0 end),
                 sum(case when isnull(j.durationAll,0) < 60*8 then 1 else 0 end)
        from users u
        left join employees e on u.Id = e.Id
        left join calendarList cl on cl.date  between @first and @last and cl.branchID=e.branchID and cl.holiday =0 and cl.date < [dbo].[DateOnly](getdate())
        left join (select  createdby , jobDate created,
                                        isnull(sum(case when jobDate = [dbo].[DateOnly](jobDate) then duration else 0 end) , 0) durationDay,
                                        isnull(sum(duration) , 0) durationAll
                                from jobs 
                                where jobDate between @first and @last
                                group by createdby , jobDate
                          ) j 
                on j.createdby = u.Id and cl.date = j.created
        where e.onsite =1
        group by  u.Id
    end     

    if(@typeID = 'scoreMonth')
    begin                   
        delete from document_calcs_date  where typeid = @typeID and date  = @first
        insert into document_calcs_date(documentID,typeID,date,val,val2)                
        select u.Id , @typeID, @first, 
                 sum(case when points > 0 then points else 0 end),
                 sum(case when points < 0 then points else 0 end)                       
        from users u
        left join employmentScores e on u.Id = e.UserId
        where e.created between @first and dateadd(day,1, @last)
        group by  u.Id
    end     

    -- non-billable
    if (@typeID = 'projectsNBDaily') -- val - non util projects, val2 - util projects
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.DateOnly(@date);
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.DateOnly(@date),
            isnull(sum(case when projects.utilization = 0 then duration else 0 end), '0'),
            isnull(sum(case when projects.utilization = 1 then duration else 0 end), '0') 
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 0 and jobs.jobDate between dbo.DateOnly(@date) and dbo.SetMaxTime(dbo.DateOnly(@date));
    end;

    if (@typeID = 'projectsNBWeekly')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayWeek(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.FirstDayWeek(dbo.DateOnly(@date)),
            isnull(sum(case when projects.utilization = 0 then duration else 0 end), '0'),
            isnull(sum(case when projects.utilization = 1 then duration else 0 end), '0') 
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 0 and jobs.jobDate between dbo.FirstDayWeek(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayWeek(dbo.DateOnly(@date)));
    end;

    if (@typeID = 'projectsNBMonthly')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayMonth(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.FirstDayMonth(dbo.DateOnly(@date)),
                isnull(sum(case when projects.utilization = 0 then duration else 0 end), '0'),
                isnull(sum(case when projects.utilization = 1 then duration else 0 end), '0') 
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 0 and jobs.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@date)));
    end;
    
    -- non-billable for projects with billing type fixed
    if (@typeID = 'projectsNBDailyOb')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.DateOnly(@date);
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.DateOnly(@date), isnull(sum(jobs.duration), '0'), '0'
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 0 and projects.billingType = 'F' and projects.utilization = 1
            and jobs.jobDate between dbo.DateOnly(@date) and dbo.SetMaxTime(dbo.DateOnly(@date));
    end;

    if (@typeID = 'projectsNBWeeklyOb')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayWeek(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.FirstDayWeek(dbo.DateOnly(@date)), isnull(sum(jobs.duration), '0'), '0'
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 0 and projects.billingType = 'F' and projects.utilization = 1
            and jobs.jobDate between dbo.FirstDayWeek(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayWeek(dbo.DateOnly(@date)));
    end;

    if (@typeID = 'projectsNBMonthlyOb')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayMonth(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.FirstDayMonth(dbo.DateOnly(@date)), isnull(sum(jobs.duration), '0'), '0'
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 0 and projects.billingType = 'F' and projects.utilization = 1
            and jobs.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@date)));
    end;
    
    -- billable for projects with billing type fixed
    if (@typeID = 'projectsBDaily') -- val - non util projects, val2 - util projects
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.DateOnly(@date);
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.DateOnly(dbo.DateOnly(@date)),
                isnull(sum(case when projects.utilization = 0 then duration else 0 end), '0'),
                isnull(sum(case when projects.utilization = 1 then duration else 0 end), '0') 
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 1 and jobs.jobDate between dbo.DateOnly(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.DateOnly(@date));
    end;

    if (@typeID = 'projectsBWeekly')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayWeek(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.FirstDayWeek(dbo.DateOnly(@date)),
            isnull(sum(case when projects.utilization = 0 then duration else 0 end), '0'),
            isnull(sum(case when projects.utilization = 1 then duration else 0 end), '0') 
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 1 and jobs.jobDate between dbo.FirstDayWeek(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayWeek(dbo.DateOnly(@date)));
    end;

    if (@typeID = 'projectsBMonthly')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayMonth(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select 1, @typeID, dbo.FirstDayMonth(dbo.DateOnly(@date)),
                isnull(sum(case when projects.utilization = 0 then duration else 0 end), '0'),
                isnull(sum(case when projects.utilization = 1 then duration else 0 end), '0') 
        from jobs 
        inner join projects on jobs.projectID = projects.projectID
        where jobs.billable = 1 and jobs.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@date)));
    end;
    
    -- departments jobs summary
    if (@typeID = 'departmentsMonthly')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.FirstDayMonth(dbo.DateOnly(@date));
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select
            [LookupDepartments].[Id], @typeID, dbo.FirstDayMonth(dbo.DateOnly(@date)),
            isnull(sum(case when jobs.billable = 1 then duration else 0 end), '0'),
            isnull(sum(case when jobs.billable = 0 then duration else 0 end), '0')
        from
            [LookupDepartments] 
            inner join users on users.DepartmentId = [LookupDepartments].[Id]
            inner join jobs on users.Id = jobs.createdBy
        where
            jobs.projectID is not null and
            jobs.jobDate between dbo.FirstDayMonth(dbo.DateOnly(@date)) and dbo.SetMaxTime(dbo.LastDayMonth(dbo.DateOnly(@date)))
        group by
            [LookupDepartments].[Id];
    end;

    if (@typeID = 'departmentsDaily')
    begin
        delete from document_calcs_date where typeid = @typeID and [date] = dbo.DateOnly(@date);
        
        insert into document_calcs_date(documentID, typeID, [date], val, val2)
        select
            [LookupDepartments].[Id], @typeID, dbo.DateOnly(@date),
            isnull(sum(case when jobs.billable = 1 then duration else 0 end), '0'),
            isnull(sum(case when jobs.billable = 0 then duration else 0 end), '0')
        from
            [LookupDepartments] 
            inner join users on users.DepartmentId = [LookupDepartments].[Id]
            inner join jobs on users.Id = jobs.createdBy
        where
            jobs.projectID is not null and
            jobs.jobDate between dbo.DateOnly(@date) and dbo.SetMaxTime(dbo.DateOnly(@date))
        group by
            [LookupDepartments].[Id];
    end;
END