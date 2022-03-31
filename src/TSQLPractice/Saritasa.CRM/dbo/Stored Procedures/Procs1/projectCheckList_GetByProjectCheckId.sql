
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the ProjectCheckList table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projectCheckList_GetByProjectCheckId]
(

	@ProjectCheckId int   
)
AS


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
					[ProjectCheckId] = @ProjectCheckId
				SELECT @@ROWCOUNT