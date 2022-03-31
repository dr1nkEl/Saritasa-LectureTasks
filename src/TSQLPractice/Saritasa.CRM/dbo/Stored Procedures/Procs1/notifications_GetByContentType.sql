
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Notifications table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_GetByContentType]
(

	@ContentType char (2)  
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
					[ContentType] = @ContentType
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON