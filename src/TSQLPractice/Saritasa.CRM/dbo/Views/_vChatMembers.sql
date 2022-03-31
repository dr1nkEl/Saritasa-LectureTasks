CREATE VIEW [dbo].[_vChatMembers]
AS
SELECT     cm.id, cm.chatId, cm.userId, cm.closed, u.fullName, u.documentID, u.email, e.photo, cm.viewedTextLength
FROM         dbo.chatMembers AS cm INNER JOIN
                      dbo._vUsers AS u ON u.Id = cm.userId INNER JOIN
                      dbo.employees AS e ON e.Id = cm.userId
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vChatMembers';

