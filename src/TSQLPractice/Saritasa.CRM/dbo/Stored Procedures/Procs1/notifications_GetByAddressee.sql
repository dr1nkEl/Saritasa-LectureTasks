
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Notifications table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_GetByAddressee]
(

	@Addressee bigint   
)
AS


				SET ANSI_NULLS OFF
				
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
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON