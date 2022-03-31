/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectsDocuments view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE [dbo].[_vProjectsDocuments_Get_List]

AS


				
				SELECT
					[projectID],
					[startDate],
					[proposedFinishDate],
					[devSite],
					[actualSite],
					[actualFinishDate],
					[description],
					[title],
					[parentProjectID],
					[notes],
					[completeLine],
					[documentID],
					[discountID],
					[clientID],
					[priority],
					[created],
					[updated],
					[deleted],
					[createdBy],
					[updatedBy],
					[colorCode],
					[statusName],
					[generalStatusID],
					[billable],
					[showClient],
					[menHours],
					[utilization]
				FROM
					[dbo].[_vProjectsDocuments]
					
				SELECT @@ROWCOUNT
