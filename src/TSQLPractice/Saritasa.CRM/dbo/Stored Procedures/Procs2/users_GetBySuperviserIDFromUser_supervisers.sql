
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records through a junction table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_GetBySuperviserIDFromUser_supervisers]
(

	@SuperviserId int   
)
AS


SELECT dbo.[Users].[Id]
       ,dbo.[Users].[FirstName]
       ,dbo.[Users].[LastName]
       ,dbo.[Users].[Title]
       ,dbo.[Users].[DocumentId]
       ,dbo.[Users].[TypeId]
       ,dbo.[Users].[Birthday]
       ,dbo.[Users].[TimeZone]
       ,dbo.[Users].[TimeZoneCode]
       ,dbo.[Users].[Notes]
       ,dbo.[Users].[DepartmentId]
       ,dbo.[Users].[Utilization]
       ,dbo.[Users].[HideBirthday]
       ,dbo.[Users].[UtilizationPercent]
       ,dbo.[Users].[DepartmentUpdatedAt]
       ,dbo.[Users].[WorkTypeId]
       ,dbo.[Users].[VendorId]
  FROM dbo.[Users]
 WHERE EXISTS (SELECT 1
                 FROM dbo.[user_supervisers] 
                WHERE dbo.[user_supervisers].[SuperviserId] = @SuperviserId
                  AND dbo.[user_supervisers].[UserId] = dbo.[Users].[Id]
                  )
				SELECT @@ROWCOUNT