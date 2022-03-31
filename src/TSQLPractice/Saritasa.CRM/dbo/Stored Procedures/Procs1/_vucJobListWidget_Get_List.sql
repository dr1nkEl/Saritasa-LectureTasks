/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucJobListWidget view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vucJobListWidget_Get_List]

AS


				
				SELECT
					[jobID],
					[billable],
					[description],
					[duration],
					[targetID],
					[createdBy],
					[isError],
					[errorBy],
					[errorReason]
				FROM
					[dbo].[_vucJobListWidget]
					
				SELECT @@ROWCOUNT