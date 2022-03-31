

CREATE VIEW _vNotes
AS
SELECT     dbo.notes.noteID, dbo.notes.parentNoteID, dbo.notes.noteText, dbo.notes.typeID, dbo.notes.documentID, dbo.notes.targetID, dbo.notes.showClient, 
                      dbo.documents.name, dbo.documents.created, dbo.documents.createdBy, dbo.documents.updated, dbo.documents.updatedBy, dbo.documents.deleted, 
                      dbo.documents.generalStatusID, u.firstName, u.lastName, u.fullName, u.documentID AS creterDocID, u.emailID, u.email, u.birthday, u.timeZone, 
                      target.name AS targetName, target.typeID AS targetTypeID, target.objectID, dbo.notes.needAnswer, dbo.notes.viewed
FROM         dbo.notes INNER JOIN
                      dbo.documents ON dbo.notes.documentID = dbo.documents.documentID INNER JOIN
                      dbo.documents AS target ON dbo.notes.targetID = target.documentID LEFT OUTER JOIN
                      dbo._vUsers AS u ON dbo.documents.createdBy = u.Id

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
         Begin Table = "notes"
            Begin Extent = 
               Top = 25
               Left = 239
               Bottom = 265
               Right = 399
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "documents"
            Begin Extent = 
               Top = 17
               Left = 428
               Bottom = 269
               Right = 595
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "target"
            Begin Extent = 
               Top = 10
               Left = 12
               Bottom = 272
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 30
               Left = 668
               Bottom = 284
               Right = 828
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vNotes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vNotes';

