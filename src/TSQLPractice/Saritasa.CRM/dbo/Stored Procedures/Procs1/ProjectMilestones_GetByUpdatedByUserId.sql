
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectMilestones table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.ProjectMilestones_GetByUpdatedByUserId
(

	@UpdatedByUserId int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[UpdatedByUserId] = @UpdatedByUserId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON