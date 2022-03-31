-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create FUNCTION getManagerListByProjectID 
(	
    -- Add the parameters for the function here
    @projectID int 
)
RETURNS TABLE 
AS
RETURN 
(
    -- Add the SELECT statement with parameter references here
    select    projectID, 
    stuff((SELECT ',' +cast(x.documentid as varchar(4))
            FROM     _vProjectManagers x
            WHERE     x.projectID = @projectID and x.roleID='PM' FOR XML PATH('')), 1, 1, '') as managers
    from _vProjectManagers s
    where s.projectID=@projectID and s.roleID = 'PM'
    group by projectID
)