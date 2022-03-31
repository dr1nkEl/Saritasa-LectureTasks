
CREATE VIEW dbo._vSearchResults
AS
SELECT     dbo.search_results.resultID, dbo.search_results.title, dbo.search_results.description, dbo.search_results.searchID, dbo.search_results.documentID, 
                      dbo.documents.created, dbo.documents.updated, dbo.documents.createdBy, dbo.documents.updatedBy, dbo.documents.typeID, dbo.documents.generalStatusID, 
                      dbo.documents.objectID, dbo.lookup_document_statuses.colorCode, dbo.lookup_document_statuses.statusName, 
                      dbo.users.firstName + ' ' + dbo.users.lastName AS creater, users_1.firstName + ' ' + users_1.lastName AS updater
FROM         dbo.search_results LEFT OUTER JOIN
                      dbo.documents ON dbo.documents.documentID = dbo.search_results.documentID LEFT OUTER JOIN
                      dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID LEFT OUTER JOIN
                      dbo.users ON dbo.documents.createdBy = dbo.users.Id LEFT OUTER JOIN
                      dbo.users AS users_1 ON dbo.documents.updatedBy = users_1.Id

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
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
         Begin Table = "documents"
            Begin Extent = 
               Top = 6
               Left = 190
               Bottom = 271
               Right = 357
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "search_results"
            Begin Extent = 
               Top = 12
               Left = 10
               Bottom = 187
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lookup_document_statuses"
            Begin Extent = 
               Top = 176
               Left = 376
               Bottom = 309
               Right = 536
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "users"
            Begin Extent = 
               Top = 4
               Left = 378
               Bottom = 165
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "users_1"
            Begin Extent = 
               Top = 4
               Left = 552
               Bottom = 121
               Right = 712
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
        ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vSearchResults';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' Alias = 900
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vSearchResults';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vSearchResults';

