CREATE view dbo._vEmployeesUsers
as
SELECT
  dbo.employees.Id as 'EmployeeId',
  dbo._vUsers.Id As userID, dbo._vUsers.firstName, dbo._vUsers.lastName, dbo._vUsers.title, dbo._vUsers.email, dbo._vUsers.typeID, 
  dbo._vUsers.documentID, dbo._vUsers.fullName, stuff((SELECT ',' +cast(x.superviserID as varchar(20))
                      FROM     user_supervisers x
                      WHERE     x.userID = dbo.employees.Id FOR XML PATH('')), 1, 1, '') as superviserIds, dbo.employees.onsite, dbo.employees.PreviousEmployment,
                      dbo.employees.ContractSignedAt, dbo.employees.branchID, 
                      dbo.employees.comments, dbo.employees.photo, dbo._vUsers.emailID, 
                      dbo._vUsers.birthday, dbo._vUsers.timeZone, dbo.employees.score, dbo._vUsers.timeZoneCode,
                      dbo.phones.phone as 'skype', dbo._vUsers.utilization
FROM         dbo.employees LEFT OUTER JOIN
                      dbo._vUsers ON dbo.employees.Id = dbo._vUsers.Id
                      left join dbo.phones on dbo._vUsers.documentID = dbo.phones.targetID and dbo.phones.typeID = 'SKP'
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = '[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "employees"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 309
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "_vUsers"
            Begin Extent = 
               Top = 6
               Left = 244
               Bottom = 247
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vEmployeesUsers';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vEmployeesUsers';

