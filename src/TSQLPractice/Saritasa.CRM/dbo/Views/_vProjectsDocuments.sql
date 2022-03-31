
/*
 * Remove outsourceClientID column from projects table.
 */
CREATE VIEW [dbo].[_vProjectsDocuments]
AS
	SELECT
		dbo.projects.projectID, dbo.projects.startDate, dbo.projects.proposedFinishDate, dbo.projects.devSite, dbo.projects.actualSite, dbo.projects.actualFinishDate, 
		dbo.projects.description, dbo.projects.title, dbo.projects.parentProjectID, dbo.projects.notes, dbo.projects.completeLine, dbo.projects.documentID, 
        dbo.projects.discountID, dbo.projects.clientID, dbo.documents.priority, dbo.documents.created, dbo.documents.updated, dbo.documents.deleted, 
        dbo.documents.createdBy, dbo.documents.updatedBy, dbo.lookup_document_statuses.colorCode, 
        dbo.lookup_document_statuses.statusName, dbo.documents.generalStatusID, dbo.projects.billable, dbo.projects.showClient,
        dbo.projects.menHours, dbo.projects.utilization
	FROM
		dbo.projects LEFT OUTER JOIN
		dbo.documents ON dbo.projects.documentID = dbo.documents.documentID LEFT OUTER JOIN
		dbo.lookup_document_statuses ON dbo.documents.generalStatusID = dbo.lookup_document_statuses.statusID
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
         Begin Table = "documents"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 123
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lookup_document_statuses"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 243
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "projects"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 222
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vProjectsDocuments';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vProjectsDocuments';

