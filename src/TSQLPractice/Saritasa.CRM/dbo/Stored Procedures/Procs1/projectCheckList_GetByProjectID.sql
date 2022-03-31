
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectCheckList table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_GetByProjectID]
(

	@ProjectId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[ProjectCheckId],
					[CheckId],
					[ProjectId],
					[PmCheck],
					[AmCheck],
					[ActualDate]
				FROM
					[dbo].[ProjectCheckList]
				WHERE
					[ProjectId] = @ProjectId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON