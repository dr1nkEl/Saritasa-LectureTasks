
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Notifications table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_Get_List]

AS


				
				SELECT
					[notificationID],
					[Addressee],
					[Subject],
					[Created],
					[CreatedBy],
					[Type],
					[Received],
					[SendEmail],
					[Notes],
					[Guid],
					[ContentType]
				FROM
					[dbo].[Notifications]
					
				SELECT @@ROWCOUNT