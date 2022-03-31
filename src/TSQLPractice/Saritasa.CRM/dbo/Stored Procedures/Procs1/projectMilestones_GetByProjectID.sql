
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectMilestones table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectMilestones_GetByProjectID]
(

	@ProjectId int   
)
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
				WHERE
					[ProjectId] = @ProjectId
				SELECT @@ROWCOUNT