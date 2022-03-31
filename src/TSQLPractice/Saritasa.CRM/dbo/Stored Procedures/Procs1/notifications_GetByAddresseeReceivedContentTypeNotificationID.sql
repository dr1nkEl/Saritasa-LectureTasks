
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Notifications table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_GetByAddresseeReceivedContentTypeNotificationID]
(

	@Addressee bigint   ,

	@Received datetime   ,

	@ContentType char (2)  ,

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
					AND [ContentType] = @ContentType
					AND [notificationID] = @NotificationID
				SELECT @@ROWCOUNT