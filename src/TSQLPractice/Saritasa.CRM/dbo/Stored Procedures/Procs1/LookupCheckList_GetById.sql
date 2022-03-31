
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LookupCheckList table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.LookupCheckList_GetById
(

	@Id int   
)
AS


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
					[Id] = @Id
				SELECT @@ROWCOUNT