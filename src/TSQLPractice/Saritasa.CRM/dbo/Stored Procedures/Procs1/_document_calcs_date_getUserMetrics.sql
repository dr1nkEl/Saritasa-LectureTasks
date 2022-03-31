/*
 * Updates [_document_calcs_date_getUserMetrics] and [_tasks_checkForNew] sps. No logic changes - only to
 * make it possible to compile with nettiers.
 * add user month overtime metrics (Stas)
 *
 * ToanNguyen: Add branch ignore parameter to getPersonalDayOffs function 
 * Kostya: Remove isBugFixing column from jobs table
 * Kostya: Remove MonthUserTasksMade metric
 * Kostya: Rename columns in Users table
 */
CREATE PROCEDURE [dbo].[_document_calcs_date_getUserMetrics]
(
  @date datetime = null,
  @branchId int = null,
  @count int = null 
)
AS
BEGIN
declare @i int
declare @si  varchar(2)
declare @sdate  varchar(50)
declare @fdate  varchar(50)
declare @fdate0  datetime
declare @fdate1  datetime
declare @fdate2  datetime
declare @fdate3  datetime
declare @sql_select nvarchar(max)
declare @sql_from nvarchar(max)
declare @st int
declare @pwd varchar(100)
declare @date1 datetime
declare @date2 datetime
declare @date3 datetime
declare @utilDate datetime, @utilDate1 datetime, @utilDate2 datetime, @utilDate3 datetime
set @st = dbo.getDocStatusID('Fired','UE')

    -- Insert statements for procedure here     
        set @i = 0
        set @date = dbo.FirstDayMonth(dbo.DateOnly(@date))
        set @date1 = dateadd(month,-1,@date)
        set @date2 = dateadd(month,-1,@date1)
        set @date3 = dateadd(month,-1,@date2)
        if(dbo.LastDayMonth(@date) < dbo.DateOnly(getdate()))
                        set @fdate0 =dbo.LastDayMonth(@date)
                else    
                        set @fdate0 = dbo.DateOnly(getdate())
        if(dbo.LastDayMonth(@date1) < dbo.DateOnly(getdate()))
                        set @fdate1 =dbo.LastDayMonth(@date1)
                else    
                        set @fdate1 = dbo.DateOnly(getdate())
                        
        if(dbo.LastDayMonth(@date2) < dbo.DateOnly(getdate()))
                        set @fdate2 =dbo.LastDayMonth(@date2)
                else    
                        set @fdate2 = dbo.DateOnly(getdate())
        
        if(dbo.LastDayMonth(@date3) < dbo.DateOnly(getdate()))
                        set @fdate3 =dbo.LastDayMonth(@date3)
                else    
                        set @fdate3 = dbo.DateOnly(getdate())
        select	u.Id As userId,
                u.FirstName,
                u.LastName,
                u.Title,
                u.DocumentId,
                u.TypeId,
                u.Birthday,
                u.TimeZone,
                u.TimeZoneCode,
                u.Notes,
                u.DepartmentID,
                u.Utilization,
                u.HideBirthday,
                u.UtilizationPercent,
                u.FirstName + ' ' + u.LastName as fullname,
                e.branchID,
                e.onsite,
                CONVERT(int, isnull(umc.val, '0')) as U0,
                CONVERT(int, isnull(umc1.val, '0')) as U1,
                CONVERT(int, isnull(umc2.val, '0')) as U2,
                CONVERT(int, isnull(umc3.val, '0')) as U3,
                CONVERT(int, isnull(umc.val2, '0')) as BU0,
                CONVERT(int, isnull(umc1.val2, '0')) as BU1,
                CONVERT(int, isnull(umc2.val2, '0')) as BU2,
                CONVERT(int, isnull(umc3.val2, '0')) as BU3,
                CONVERT(int, isnull(bh.val2, '0')) as BUH0,
                CONVERT(int, isnull(bh1.val2, '0')) as BUH1,
                CONVERT(int, isnull(bh2.val2, '0')) as BUH2,
                CONVERT(int, isnull(bh3.val2, '0')) as BUH3,
                CONVERT(int, isnull(se.val, '0')) as SE0,
                CONVERT(int, isnull(se1.val, '0')) as SE1,
                CONVERT(int, isnull(se2.val, '0')) as SE2,
                CONVERT(int, isnull(se3.val, '0')) as SE3,
                CONVERT(int, isnull(ob.val, '0')) as OB0,
                CONVERT(int, isnull(ob1.val, '0')) as OB1,
                CONVERT(int, isnull(ob2.val, '0')) as OB2,
                CONVERT(int, isnull(ob3.val, '0')) as OB3,
                CONVERT(decimal(9,2), isnull(sp.val, '0')) as SP0,
                CONVERT(decimal(9,2), isnull(sp1.val, '0')) as SP1,
                CONVERT(decimal(9,2), isnull(sp2.val, '0')) as SP2,
                CONVERT(decimal(9,2), isnull(sp3.val, '0')) as SP3,
                CONVERT(decimal(9,2), isnull(sh.val, '0')) as SH0,
                CONVERT(decimal(9,2), isnull(sh1.val, '0')) as SH1,
                CONVERT(decimal(9,2), isnull(sh2.val, '0')) as SH2,
                CONVERT(decimal(9,2), isnull(sh3.val, '0')) as SH3,
                dbo.getPersonalDayOffs(u.Id, e.branchID, @date, @fdate0, 0) as 'PDO0',
                dbo.getPersonalDayOffs(u.Id, e.branchID, @date1, @fdate1, 0) as 'PDO1',
                dbo.getPersonalDayOffs(u.Id, e.branchID, @date2, @fdate2, 0) as 'PDO2',
                dbo.getPersonalDayOffs(u.Id, e.branchID, @date3, @fdate3, 0) as 'PDO3',
                cast(isnull(UMJ0.val,0) as int) UMJ0 , 
                isnull(TL0.totalLimit, 0) TL0 , 
                (isnull(TL0.totalLimit, 0) - isnull(LJ0.limitJobs, 0)) HS0 , 
                cast(isnull(L8H0.val,0) as int) L8H0 , 
                cast(isnull(L8H0.val2,0) as int) L8HAll0 , 
                cast(isnull(SCR0.val,0) as int) SCP0 , 
                cast(isnull(SCR0.val2,0) as int) SCM0 ,
                cast(isnull(SCR0.val,0) as int) + cast(isnull(SCR0.val2,0) as int) SCT0 , 
                dbo.getPersonalWorkedDays( u.Id, e.branchID, @date, @fdate0) MWD0 , 
                case when dbo.getPersonalWorkedDays(u.Id, e.branchID, @date, @fdate0) >0 then cast(isnull(UMJ0.val,0) as float)/dbo.getPersonalWorkedDays(u.Id, e.branchID, @date, @fdate0) else cast(isnull(UMJ0.val,0) as int) end ADH0 , 
                dbo.getBranchWorkedDays(e.branchID, @date, @fdate0) BWD0, 
                
                
                cast(isnull(UMJ1.val,0) as int) UMJ1 , isnull(TL1.totalLimit, 0) TL1 , (isnull(TL1.totalLimit, 0) - isnull(LJ1.limitJobs, 0)) HS1 , cast(isnull(L8H1.val,0) as int) L8H1 , cast(isnull(L8H1.val2,0) as int) L8HAll1 , cast(isnull(SCR1.val,0) as int) SCP1 , cast(isnull(SCR1.val2,0) as int) SCM1 , cast(isnull(SCR1.val,0) as int) + cast(isnull(SCR1.val2,0) as int) SCT1 , dbo.getPersonalWorkedDays(u.Id, e.branchID, @date1, @fdate1) MWD1 , case when dbo.getPersonalWorkedDays(u.Id, e.branchID, @date1, @fdate1) >0 then cast(isnull(UMJ1.val,0) as float)/dbo.getPersonalWorkedDays(u.Id, e.branchID, @date1, @fdate1) else cast(isnull(UMJ1.val,0) as int) end ADH1 , dbo.getBranchWorkedDays(e.branchID, @date1, @fdate1) BWD1 , 
                cast(isnull(UMJ2.val,0) as int) UMJ2 , isnull(TL2.totalLimit, 0) TL2 , (isnull(TL2.totalLimit, 0) - isnull(LJ2.limitJobs, 0)) HS2 , cast(isnull(L8H2.val,0) as int) L8H2 , cast(isnull(L8H2.val2,0) as int) L8HAll2 , cast(isnull(SCR2.val,0) as int) SCP2 , cast(isnull(SCR2.val2,0) as int) SCM2 , cast(isnull(SCR2.val,0) as int) + cast(isnull(SCR2.val2,0) as int) SCT2 , dbo.getPersonalWorkedDays(u.Id, e.branchID, @date2, @fdate2) MWD2 , case when dbo.getPersonalWorkedDays(u.Id, e.branchID, @date2, @fdate2) >0 then cast(isnull(UMJ2.val,0) as float)/dbo.getPersonalWorkedDays(u.Id, e.branchID, @date2, @fdate2) else cast(isnull(UMJ2.val,0) as int) end ADH2 , dbo.getBranchWorkedDays(e.branchID, @date2, @fdate2) BWD2 , 
                cast(isnull(UMJ3.val,0) as int) UMJ3 , isnull(TL3.totalLimit, 0) TL3 , (isnull(TL3.totalLimit, 0) - isnull(LJ3.limitJobs, 0)) HS3 , cast(isnull(L8H3.val,0) as int) L8H3 , cast(isnull(L8H3.val2,0) as int) L8HAll3 , cast(isnull(SCR3.val,0) as int) SCP3 , cast(isnull(SCR3.val2,0) as int) SCM3 , cast(isnull(SCR3.val,0) as int) + cast(isnull(SCR3.val2,0) as int) SCT3 , dbo.getPersonalWorkedDays(u.Id, e.branchID, @date3, @fdate3) MWD3 , case when dbo.getPersonalWorkedDays(u.Id, e.branchID, @date3, @fdate3) >0 then cast(isnull(UMJ3.val,0) as float)/dbo.getPersonalWorkedDays(u.Id, e.branchID, @date3, @fdate3) else cast(isnull(UMJ3.val,0) as int) end ADH3 , dbo.getBranchWorkedDays(e.branchID, @date3, @fdate3) BWD3 ,

                cast(isnull(umop.val, 0) as int) as 'UMOP0',
                cast(isnull(umop1.val, 0) as int) as 'UMOP1',
                cast(isnull(umop2.val, 0) as int) as 'UMOP2',
                cast(isnull(umop3.val, 0) as int) as 'UMOP3',
                
                cast(isnull(umop.val2, 0) as decimal) as 'UMOPM0',
                cast(isnull(umop1.val2, 0) as decimal) as 'UMOPM1',
                cast(isnull(umop2.val2, 0) as decimal) as 'UMOPM2',
                cast(isnull(umop3.val2, 0) as decimal) as 'UMOPM3',
                
                
                cast(isnull(umoh.val, 0) as int) as 'UMOH0',
                cast(isnull(umoh1.val, 0) as int) as 'UMOH1',
                cast(isnull(umoh2.val, 0) as int) as 'UMOH2',
                cast(isnull(umoh3.val, 0) as int) as 'UMOH3',
                CONVERT(decimal(9,2), isnull(brc.val, 0)) as 'BRC0',
                CONVERT(decimal(9,2), isnull(brc1.val, 0)) as 'BRC1',
                CONVERT(decimal(9,2), isnull(brc2.val, 0)) as 'BRC2',
                CONVERT(decimal(9,2), isnull(brc3.val, 0)) as 'BRC3'
                from users u 
                left join documents doc on u.DocumentId = doc.documentid  
                left join employees e on e.Id = u.Id 
                        left join document_calcs_date UMJ0 on UMJ0.documentid= u.Id and UMJ0.typeid='userMonthJob' and UMJ0.date = @date
                        left join document_calcs_date L8H0 on L8H0.documentid= u.Id and L8H0.typeid='CountLess8h' and L8H0.date = @date
                        left join document_calcs_date SCR0 on SCR0.documentid= u.Id and SCR0.typeid='scoreMonth' and SCR0.date = @date
                        left join (
                            select sum(durationLimit) totalLimit, ta.userID
                            from task_assigned ta
                            where ta.deleted is NULL and ta.durationLimit > 0 AND ta.finishedWork between @date and @fdate0
                            group by ta.userID) TL0 on TL0.userID= u.Id
                        left join (
                            select sum(jl.duration) limitJobs, jl.createdBy
                            from _vJobWithLimit jl
                            where jl.finishedWork between @date and @fdate0
                            group by jl.createdBy) LJ0 on LJ0.createdBy= u.Id 
                        left join document_calcs_date UMJ1 on UMJ1.documentid= u.Id and UMJ1.typeid='userMonthJob' and UMJ1.date = @date1
                        left join document_calcs_date L8H1 on L8H1.documentid= u.Id and L8H1.typeid='CountLess8h' and L8H1.date = @date1
                        left join document_calcs_date SCR1 on SCR1.documentid= u.Id and SCR1.typeid='scoreMonth' and SCR1.date = @date1
                        left join (
                            select sum(durationLimit) totalLimit, ta.userID
                            from task_assigned ta
                            where ta.deleted is NULL and ta.durationLimit > 0 AND ta.finishedWork between @date1 and @fdate1
                            group by ta.userID) TL1 on TL1.userID= u.Id
                        left join (
                            select sum(jl.duration) limitJobs, jl.createdBy
                            from _vJobWithLimit jl
                            where jl.finishedWork between @date1 and @fdate1
                            group by jl.createdBy) LJ1 on LJ1.createdBy= u.Id 
                        left join document_calcs_date UMJ2 on UMJ2.documentid= u.Id and UMJ2.typeid='userMonthJob' and UMJ2.date = @date2
                        left join document_calcs_date L8H2 on L8H2.documentid= u.Id and L8H2.typeid='CountLess8h' and L8H2.date = @date2
                        left join document_calcs_date SCR2 on SCR2.documentid= u.Id and SCR2.typeid='scoreMonth' and SCR2.date = @date2
                        left join (
                            select sum(durationLimit) totalLimit, ta.userID
                            from task_assigned ta
                            where ta.deleted is NULL and ta.durationLimit > 0 AND ta.finishedWork between @date2 and @fdate2
                            group by ta.userID) TL2 on TL2.userID= u.Id
                        left join (
                            select sum(jl.duration) limitJobs, jl.createdBy
                            from _vJobWithLimit jl
                            where jl.finishedWork between @date2 and @fdate2
                            group by jl.createdBy) LJ2 on LJ2.createdBy= u.Id 
                        left join document_calcs_date UMJ3 on UMJ3.documentid= u.Id and UMJ3.typeid='userMonthJob' and UMJ3.date = @date3
                        left join document_calcs_date L8H3 on L8H3.documentid= u.Id and L8H3.typeid='CountLess8h' and L8H3.date = @date3
                        left join document_calcs_date SCR3 on SCR3.documentid= u.Id and SCR3.typeid='scoreMonth' and SCR3.date = @date3
                        left join (
                            select sum(durationLimit) totalLimit, ta.userID
                            from task_assigned ta
                            where ta.deleted is NULL and ta.durationLimit > 0 AND ta.finishedWork between @date3 and @fdate3
                            group by ta.userID) TL3 on TL3.userID= u.Id
                        left join (
                            select sum(jl.duration) limitJobs, jl.createdBy
                            from _vJobWithLimit jl
                            where jl.finishedWork between @date3 and @fdate3
                            group by jl.createdBy) LJ3 on LJ3.createdBy= u.Id 
                        left join document_calcs_date umc on umc.documentID=u.DocumentId and umc.typeID='userMonthUtilization' and umc.[date]=@date
                        left join document_calcs_date umc1 on umc1.documentID=u.DocumentId and umc1.typeID='userMonthUtilization' and umc1.[date]=@date1
                        left join document_calcs_date umc2 on umc2.documentID=u.DocumentId and umc2.typeID='userMonthUtilization' and umc2.[date]=@date2                                                
                        left join document_calcs_date umc3 on umc3.documentID=u.DocumentId and umc3.typeID='userMonthUtilization' and umc3.[date]=@date3
                        left join document_calcs_date bh on bh.documentID=u.Id and bh.typeID='userMonthJob' and bh.[date]=@date
                        left join document_calcs_date bh1 on bh1.documentID=u.Id and bh1.typeID='userMonthJob' and bh1.[date]=@date1
                        left join document_calcs_date bh2 on bh2.documentID=u.Id and bh2.typeID='userMonthJob' and bh2.[date]=@date2                                                
                        left join document_calcs_date bh3 on bh3.documentID=u.Id and bh3.typeID='userMonthJob' and bh3.[date]=@date3
                        left join document_calcs_date se on se.documentID=u.DocumentId and se.typeID='userMonthSelfEdu' and se.[date]=@date
                        left join document_calcs_date se1 on se1.documentID=u.DocumentId and se1.typeID='userMonthSelfEdu' and se1.[date]=@date1
                        left join document_calcs_date se2 on se2.documentID=u.DocumentId and se2.typeID='userMonthSelfEdu' and se2.[date]=@date2                                                
                        left join document_calcs_date se3 on se3.documentID=u.DocumentId and se3.typeID='userMonthSelfEdu' and se3.[date]=@date3
                        left join document_calcs_date ob on ob.documentID=u.DocumentId and ob.typeID='userMonthOverBudget' and ob.[date]=@date
                        left join document_calcs_date ob1 on ob1.documentID=u.DocumentId and ob1.typeID='userMonthOverBudget' and ob1.[date]=@date1
                        left join document_calcs_date ob2 on ob2.documentID=u.DocumentId and ob2.typeID='userMonthOverBudget' and ob2.[date]=@date2                                                
                        left join document_calcs_date ob3 on ob3.documentID=u.DocumentId and ob3.typeID='userMonthOverBudget' and ob3.[date]=@date3
                        left join document_calcs_date sh on sh.documentID=u.DocumentId and sh.typeID='userSavedHours' and sh.[date]=@date
                        left join document_calcs_date sh1 on sh1.documentID=u.DocumentId and sh1.typeID='userSavedHours' and sh1.[date]=@date1
                        left join document_calcs_date sh2 on sh2.documentID=u.DocumentId and sh2.typeID='userSavedHours' and sh2.[date]=@date2                                                
                        left join document_calcs_date sh3 on sh3.documentID=u.DocumentId and sh3.typeID='userSavedHours' and sh3.[date]=@date3
                        left join document_calcs_date sp on sp.documentID=u.DocumentId and sp.typeID='userSpeed' and sp.[date]=@date
                        left join document_calcs_date sp1 on sp1.documentID=u.DocumentId and sp1.typeID='userSpeed' and sp1.[date]=@date1
                        left join document_calcs_date sp2 on sp2.documentID=u.DocumentId and sp2.typeID='userSpeed' and sp2.[date]=@date2                                                
                        left join document_calcs_date sp3 on sp3.documentID=u.DocumentId and sp3.typeID='userSpeed' and sp3.[date]=@date3
                        left join document_calcs_date umop on umop.documentID = u.DocumentId and umop.typeID = 'userMonthOvertimeP' and umop.[date] = @date
                        left join document_calcs_date umop1 on umop1.documentID = u.DocumentId and umop1.typeID = 'userMonthOvertimeP' and umop1.[date] = @date1
                        left join document_calcs_date umop2 on umop2.documentID = u.DocumentId and umop2.typeID = 'userMonthOvertimeP' and umop2.[date] = @date2
                        left join document_calcs_date umop3 on umop3.documentID = u.DocumentId and umop3.typeID = 'userMonthOvertimeP' and umop3.[date] = @date3
                        left join document_calcs_date umoh on umoh.documentID = u.DocumentId and umoh.typeID = 'userMonthOvertimeH' and umoh.[date] = @date
                        left join document_calcs_date umoh1 on umoh1.documentID = u.DocumentId and umoh1.typeID = 'userMonthOvertimeH' and umoh1.[date] = @date1
                        left join document_calcs_date umoh2 on umoh2.documentID = u.DocumentId and umoh2.typeID = 'userMonthOvertimeH' and umoh2.[date] = @date2
                        left join document_calcs_date umoh3 on umoh3.documentID = u.DocumentId and umoh3.typeID = 'userMonthOvertimeH' and umoh3.[date] = @date3
                        left join document_calcs_date brc on brc.documentID = u.DocumentId and brc.typeID = 'BugReopenCount' and brc.[date] = @date
                        left join document_calcs_date brc1 on brc1.documentID = u.DocumentId and brc1.typeID = 'BugReopenCount' and brc1.[date] = @date1
                        left join document_calcs_date brc2 on brc2.documentID = u.DocumentId and brc2.typeID = 'BugReopenCount' and brc2.[date] = @date2
                        left join document_calcs_date brc3 on brc3.documentID = u.DocumentId and brc3.typeID = 'BugReopenCount' and brc3.[date] = @date3

        where u.TypeId = 'E'  AND doc.generalStatusID <> @st  order by e.branchID, u.LastName

        select 1
END