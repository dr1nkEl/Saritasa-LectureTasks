CREATE VIEW [dbo].[_vProjectCheckList]
AS
SELECT     dbo.[LookupCheckList].[Id] As CheckId, dbo.[LookupCheckList].[Name], dbo.[LookupCheckList].[IsKickOff], dbo.[LookupCheckList].[OrderId], dbo.[LookupCheckList].[ParentId], 
                      dbo.projectCheckList.projectID, dbo.projectCheckList.pmCheck, dbo.projectCheckList.amCheck, dbo.projectCheckList.actualDate, 
                      dbo.projectCheckList.projectCheckId, dbo.[LookupCheckList].[IsRequired], dbo.[LookupCheckList].[CheckType]
FROM         dbo.[LookupCheckList] LEFT OUTER JOIN
                      dbo.projectCheckList ON dbo.[LookupCheckList].[Id] = dbo.projectCheckList.checkID