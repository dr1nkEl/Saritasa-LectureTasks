/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vFavoriteTasks view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vFavoriteTasks_Get_List]

AS


				
				SELECT
					[documentID],
					[objectID],
					[typeID],
					[statusID],
					[name],
					[taskDocID],
					[taskName],
					[taskID],
					[projectID],
					[projDocID],
					[projName],
					[taskBillable],
					[projectBillable],
					[isContainer],
					[mayAddJobs],
					[projectShowClient],
					[favoriteUserID],
					[favoritesCreated],
					[makeJobsBillable],
					[projectOverbudget]
				FROM
					[dbo].[_vFavoriteTasks]
					
				SELECT @@ROWCOUNT
