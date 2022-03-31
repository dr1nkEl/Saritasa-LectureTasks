
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Notifications table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_GetByAddresseeReceivedTypeNotificationID]
(

	@Addressee bigint   ,

	@Received datetime   ,

	@Type tinyint   ,

	@NotificationID bigint   
)
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
				WHERE
					[Addressee] = @Addressee
					AND [Received] = @Received
					AND [Type] = @Type
					AND [notificationID] = @NotificationID
				SELECT @@ROWCOUNT