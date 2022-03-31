/*
 * Remove outsourceClientID column from projects table.
 */
CREATE VIEW [dbo].[_vRelatedToJob]
AS
SELECT     d .documentID, d .objectID, d .typeID, d .generalStatusID AS statusID, t .title AS name, t .billable, p.showClient, t .documentID AS taskDocID, t .title AS taskName, 
                      t .taskID, t .billable AS taskBillable, t .isContainer AS isContainer, t .mayAddJobs, t .makeJobsBillable, p.projectID, p.documentID AS projDocID, p.title AS projName, 
                      pd.generalStatusID AS 'projectStatusID', p.billable AS projectBillable, std.objectID AS ParentTaskID, std.name AS ParentName, 
                      t .clientID, t .startDate AS 'startDate', t .finishDate AS 'finishDate', p.Overbudget As 'projectOverbudget'
FROM         dbo.tasks AS t LEFT OUTER JOIN
                      dbo.documents AS d ON t .documentID = d .documentID LEFT OUTER JOIN
                      dbo.projects AS p ON d .projectID = p.projectID LEFT OUTER JOIN
                      dbo.documents AS std ON std.documentID = t .targetID LEFT OUTER JOIN
                      dbo.documents AS pd ON pd.documentID = p.documentID
UNION
SELECT     d .documentID, d .objectID, d .typeID, d .generalStatusID AS statusID, p.title AS name, p.billable, p.showClient, NULL AS taskDocID, NULL AS taskName, NULL 
                      AS taskID, NULL AS taskBillable, NULL AS isContainer, CAST(1 AS bit) AS mayAddJobs, cast(0 AS bit) AS 'makeJobsBillable', p.projectID, p.documentID AS projDocID, 
                      p.title AS projName, d .generalStatusID AS 'projectStatusID', p.billable AS projectBillable, NULL AS ParentTaskID, NULL 
                      AS ParentName, p.clientID, NULL AS 'startDate', NULL AS 'finishDate', p.Overbudget as 'projectOverbudget'
FROM         dbo.projects AS p LEFT OUTER JOIN
                      dbo.documents AS d ON p.documentID = d .documentID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[16] 2[21] 3) )"
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
         Configuration = "(H (4[30] 2[36] 3) )"
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
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
      Begin ColumnWidths = 5
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vRelatedToJob';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vRelatedToJob';

