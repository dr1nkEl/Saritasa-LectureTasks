CREATE view _vCalendarPersonal
as
SELECT
  e.Id as UserId,
  e.BranchId,
    stuff((SELECT ',' +cast(x.superviserID as varchar(20))
    FROM     user_supervisers x
    WHERE     x.userID = e.Id FOR XML PATH('')), 1, 1, '') as superviserIds,
  e.Score, cal.cID, cal.date, cal.holiday, per.id AS perClId, per.num, per.holiday AS perHoliday, per.isSick,
  per.description, CASE WHEN per.id IS NULL THEN (CASE WHEN cal.holiday = 1 THEN 'SH' ELSE 'SW' END) 
  WHEN per.isSick = 1 THEN 'SD'
  WHEN per.holiday = 1 THEN (CASE WHEN cal.holiday = 1 THEN 'SH' ELSE 'PH' END) 
  WHEN per.holiday = 0 THEN (CASE WHEN cal.holiday = 1 THEN 'PW' ELSE 'SW' END) END AS dayType, e.onsite
FROM         dbo.Employees AS e LEFT OUTER JOIN
                      dbo.calendarList AS cal ON cal.branchID = e.branchID LEFT OUTER JOIN
                          (SELECT     f.id, f.num, cp.clId, cp.userId, cp.date, cp.holiday, cp.description, cp.isSick
                            FROM          (SELECT     MAX(clId) AS id, COUNT(*) AS num
                                  FROM          dbo.calendarPersonal
                                  GROUP BY date, userId) AS f LEFT OUTER JOIN
                                 dbo.calendarPersonal AS cp ON f.id = cp.clId) AS per ON per.userId = e.Id AND cal.date = per.date
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vCalendarPersonal';

