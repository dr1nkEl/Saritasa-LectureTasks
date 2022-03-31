/*
 * Maxim Podreshetnikov
 * 
 * Change script. Don't use a view _vCalendarPersonal anymore.
 */

CREATE PROCEDURE dbo._users_getShameUsers
(
	@date datetime   = null 
)
AS
BEGIN
    set @date = [dbo].[DateOnly](@date)
  
    select u.Id,
        u.FirstName,
        u.LastName,
        u.Title,
        u.DocumentId,
        u.TypeId,
        u.Birthday,
        u.TimeZone,
        u.TimeZoneCode,
        u.Notes,
        u.DepartmentId,
        u.Utilization,
        u.UtilizationPercent,
        u.DepartmentUpdatedAt,
        e.Photo,
        isnull(JobsDuration, 0) Duration,
        e.Score,
        (case when dr.dailyReportID is null then 0 else 1 end) ReportId,
        e.DailyReportNotRequired,
        emails.email,
        ae.email as AlternativeEmail,
        phones.phone as 'Skype',
        e.IsPartTime,
        e.LastHrmContactAt
    from Users u
    left join Employees e on e.Id = u.Id
    left join Documents d on u.DocumentId = d.documentID
    left join emails on u.DocumentId = emails.targetID and emails.typeID = 'P'
    left join emails ae on u.DocumentId = ae.targetID and ae.typeID = 'A'
    left join phones on u.DocumentId = phones.targetID and phones.typeID = 'SKP'
    left join CalendarList cbranch on cbranch.BranchId = e.BranchId and cbranch.Date = @date and cbranch.Holiday = 1
    left join CalendarPersonal cpersonal on cpersonal.UserId = u.Id and cpersonal.Date = @date
    left join daily_reports dr on dr.UserId = u.Id and dr.ReportDate = @date
    left join (
		    select sum(isnull(j.Duration, 0)) JobsDuration, CreatedBy
		    from Jobs j
		    where j.JobDate = @date
		    group by CreatedBy
	    ) j on j.CreatedBy = u.Id
    where u.TypeId = 'E' and e.onsite = 1
	    and generalStatusID in (select StatusID from lookup_document_statuses where StatusName in ('Active', 'Outsourcing'))
        /* If it's a personal workday or it's a branch workday and not a personal holiday. */
	    and (cpersonal.Holiday = 0 or (cbranch.cID is null and (cpersonal.clId is null or cpersonal.Holiday = 0)))
	    and ((dr.dailyReportID is null and e.DailyReportNotRequired = 0) or (j.JobsDuration < 8 * 60 and e.IsPartTime = 0))
END;