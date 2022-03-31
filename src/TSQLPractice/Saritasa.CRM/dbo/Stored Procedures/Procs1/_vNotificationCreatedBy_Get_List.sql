
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vNotificationCreatedBy view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vNotificationCreatedBy_Get_List

AS


				
				SELECT
					[notificationID],
					[addressee],
					[subject],
					[notes],
					[type],
					[sendEmail],
					[received],
					[created],
					[createdBy],
					[fullName],
					[userDocID],
					[userTypeID]
				FROM
					[dbo].[_vNotificationCreatedBy]
					
				SELECT @@ROWCOUNT			
			


