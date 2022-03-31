
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Notifications table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_Delete]
(

	@NotificationID bigint   
)
AS


				DELETE FROM [dbo].[Notifications] WITH (ROWLOCK) 
				WHERE
					[notificationID] = @NotificationID