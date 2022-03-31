
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LookupCheckList table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_GetByParentId
(

	@ParentId int   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[Id],
					[name],
					[isKickOff],
					[orderID],
					[parentID],
					[isRequired],
					[checkType]
				FROM
					[dbo].[LookupCheckList]
				WHERE
					[parentID] = @ParentId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON