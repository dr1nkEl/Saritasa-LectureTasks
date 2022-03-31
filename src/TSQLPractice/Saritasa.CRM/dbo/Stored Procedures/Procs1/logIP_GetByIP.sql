
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the LogIP table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_GetByIP]
(

	@IP varchar (15)  
)
AS


				SELECT
					[logID],
					[IP],
					[Date],
					[Login],
					[UserId],
					[Reason],
					[Clear],
					[ApplicationId]
				FROM
					[dbo].[LogIP]
				WHERE
					[IP] = @IP
				SELECT @@ROWCOUNT