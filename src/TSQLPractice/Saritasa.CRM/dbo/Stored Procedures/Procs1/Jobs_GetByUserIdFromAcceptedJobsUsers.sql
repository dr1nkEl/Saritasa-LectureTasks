
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets records through a junction table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.Jobs_GetByUserIdFromAcceptedJobsUsers
(

	@UserId int   
)
AS


SELECT dbo.[Jobs].[jobID]
       ,dbo.[Jobs].[Billable]
       ,dbo.[Jobs].[Description]
       ,dbo.[Jobs].[Duration]
       ,dbo.[Jobs].[TargetId]
       ,dbo.[Jobs].[CreatedBy]
       ,dbo.[Jobs].[ClientId]
       ,dbo.[Jobs].[ProjectId]
       ,dbo.[Jobs].[JobDate]
       ,dbo.[Jobs].[IsError]
       ,dbo.[Jobs].[ErrorBy]
       ,dbo.[Jobs].[ErrorReason]
       ,dbo.[Jobs].[WorkType]
       ,dbo.[Jobs].[UpdatedAt]
       ,dbo.[Jobs].[JobType]
  FROM dbo.[Jobs]
 WHERE EXISTS (SELECT 1
                 FROM dbo.[AcceptedJobsUsers] 
                WHERE dbo.[AcceptedJobsUsers].[UserId] = @UserId
                  AND dbo.[AcceptedJobsUsers].[JobId] = dbo.[Jobs].[jobID]
                  )
				SELECT @@ROWCOUNT