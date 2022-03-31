

CREATE VIEW [dbo].[_vToDoList]
AS
SELECT     td.toDoID, tds.createrID, td.description, tds.userID, td.date, td.completed, tds.closed, cr.fullName AS creatorName, cr.email AS creatorEmail, 
                      u.fullName AS executorName, u.email AS executorEmail, ISNULL(tdu.color, tds.color) AS color, tdu.[top], tdu.[left], tdu.minimize, td.winID, tds.viewed, 
                      tdu.userId AS currentUser, tds.name
FROM         dbo.todos AS td LEFT OUTER JOIN
                      dbo.ToDoSettings AS tds ON tds.id = td.winID LEFT OUTER JOIN
                      dbo.todoUserSettings AS tdu ON tdu.todoWinId = tds.id LEFT OUTER JOIN
                      dbo._vUsers AS cr ON cr.Id = tds.createrID LEFT OUTER JOIN
                      dbo._vUsers AS u ON u.Id = tds.userID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = '[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[30] 2[19] 3) )"
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
         Begin Table = "td"
            Begin Extent = 
               Top = 0
               Left = 11
               Bottom = 117
               Right = 171
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tds"
            Begin Extent = 
               Top = 55
               Left = 222
               Bottom = 188
               Right = 371
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tdu"
            Begin Extent = 
               Top = 6
               Left = 691
               Bottom = 123
               Right = 851
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cr"
            Begin Extent = 
               Top = 128
               Left = 692
               Bottom = 245
               Right = 852
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 159
               Left = 505
               Bottom = 276
               Right = 665
            End
            DisplayFlags = 280
            TopColumn = 9
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
         Column = 2595
         Alias = 2115
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
E', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vToDoList';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = 'nd
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vToDoList';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vToDoList';

