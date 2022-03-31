
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records through a junction table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Users_GetByJobIdFromAcceptedJobsUsers
(

	@JobId bigint   
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
                 FROM dbo.[AcceptedJobsUsers] 
                WHERE dbo.[AcceptedJobsUsers].[JobId] = @JobId
                  AND dbo.[AcceptedJobsUsers].[UserId] = dbo.[Users].[Id]
                  )
				SELECT @@ROWCOUNT