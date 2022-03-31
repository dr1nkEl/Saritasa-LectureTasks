
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the ProjectMilestones table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_Get_List]

AS


				
				SELECT
					[Id],
					[ProjectId],
					[Name],
					[ReleaseVersion],
					[ScheduledDate],
					[LimitHours],
					[Released],
					[ActualReleaseDate],
					[Order],
					[CreatedAt],
					[CreatedByUserId],
					[UpdatedAt],
					[UpdatedByUserId]
				FROM
					[dbo].[ProjectMilestones]
					
				SELECT @@ROWCOUNT