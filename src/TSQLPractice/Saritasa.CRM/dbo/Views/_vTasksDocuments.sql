/*
 * Remove progress column from tasks table.
 */
CREATE VIEW [dbo].[_vTasksDocuments]
AS
SELECT
	tasks.taskID,
	tasks.typeID,
	tasks.documentID,
	tasks.taskText,
	tasks.targetID,
	documents.created,
	tasks.lastestReestimationId,
	tasks.lastestReestimationLimitType,
	tasks.lastestReestimationDueDateType,
	null as 'lastestReestimationLimit',
	null as 'lastestReestimationDueDate',
	null as 'lastestReestimationStatus',
	null as 'lastestReestimationUserId',
	documents.updated,
	documents.deleted,
	documents.generalStatusID,
	documents.createdBy,
	documents.name,
	documents.[priority],
	documents.updatedBy,
	lookup_document_statuses.statusName,
	tasks.title,
	tasks.finishDate,
	tasks.startDate,
	lookup_document_statuses.colorCode,
	'GEN' as 'trackType',
	tasks.billable,
	tasks.clientID,
	tasks.projectID,
	tasks.durationLimit,
	cast(isnull(tasks.menHours, 0) as varchar) as 'menHours',
	projects.title AS projectName,
	tasks.testerID,
	tasks.isContainer,
	tasks.mayAddJobs,
	null as 'departmentID',
	null as 'departmentName',
	isnull(task_push.recipientID, - 1) AS ownerID,
	'AF' as 'typeName',
	tasks.technicalManagerID,
	tasks.priority AS taskPriority,
	tasks.sprintID,
	tasks.featureID,
	tasks.currentPushID,
	task_push.created as 'taskPushDate'
FROM
	tasks
	left join documents ON documents.documentID = tasks.documentID
	left join task_push on tasks.currentPushID = task_push.pushID
	left join projects ON projects.projectID = tasks.projectID
	left join lookup_document_statuses ON lookup_document_statuses.statusID = documents.generalStatusID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = '[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[16] 2[20] 3) )"
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
         Begin Table = "tasks"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 166
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "documents"
            Begin Extent = 
               Top = 6
               Left = 309
               Bottom = 123
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "projects"
            Begin Extent = 
               Top = 150
               Left = 562
               Bottom = 267
               Right = 746
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "lookup_document_statuses"
            Begin Extent = 
               Top = 127
               Left = 38
               Bottom = 260
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lookup_track_types"
            Begin Extent = 
               Top = 188
               Left = 312
               Bottom = 285
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dc"
            Begin Extent = 
               Top = 6
               Left = 514
               Bottom = 126
               Right = 674
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Parent"
            Begin Extent = 
               Top = 266
               Left = 48
               Bottom = 387
               Right = 232
            End
         ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vTasksDocuments';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = '   DisplayFlags = 280
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vTasksDocuments';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vTasksDocuments';

