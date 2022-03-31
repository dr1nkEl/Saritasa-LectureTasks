
/*
 * Fix [_vContactsUsers] and [_vContactsUsersClients].
 */

CREATE VIEW [dbo].[_vContactsUsers]
AS
SELECT     dbo.contacts.contactID, dbo.contacts.userID, dbo.contacts.clientID, dbo.contacts.notes, dbo._vUsersDocuments.firstName, dbo._vUsersDocuments.lastName, 
                      dbo._vUsersDocuments.title, dbo._vUsersDocuments.typeID, dbo._vUsersDocuments.documentID, dbo._vUsersDocuments.created, dbo._vUsersDocuments.updated, 
                      dbo._vUsersDocuments.generalStatusID, dbo._vUsersDocuments.createdBy, dbo._vUsersDocuments.deleted, dbo._vUsersDocuments.name, 
                      dbo._vUsersDocuments.fullName, dbo._vUsersDocuments.updatedBy, dbo._vUsersDocuments.birthday, dbo._vUsersDocuments.timeZone, dbo.emails.emailID, 
                      dbo.emails.email, dbo._vUsersDocuments.timeZoneCode
FROM         dbo.contacts INNER JOIN
                      dbo._vUsersDocuments ON dbo.contacts.userID = dbo._vUsersDocuments.Id LEFT OUTER JOIN
                      dbo.emails ON dbo._vUsersDocuments.documentID = dbo.emails.targetID AND dbo.emails.typeID = 'P';

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = '[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[17] 2[20] 3) )"
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
         Begin Table = "contacts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "_vUsersDocuments"
            Begin Extent = 
               Top = 31
               Left = 244
               Bottom = 335
               Right = 411
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "emails"
            Begin Extent = 
               Top = 6
               Left = 441
               Bottom = 123
               Right = 601
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vContactsUsers';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vContactsUsers';

