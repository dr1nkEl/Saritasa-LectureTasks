
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Notifications table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_Update]
(

	@NotificationID bigint   ,

	@Addressee bigint   ,

	@Subject varchar (MAX)  ,

	@Created datetime   ,

	@CreatedBy int   ,

	@Type tinyint   ,

	@Received datetime   ,

	@SendEmail datetime   ,

	@Notes varchar (MAX)  ,

	@Guid uniqueidentifier   ,

	@ContentType char (2)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Notifications]
				SET
					[Addressee] = @Addressee
					,[Subject] = @Subject
					,[Created] = @Created
					,[CreatedBy] = @CreatedBy
					,[Type] = @Type
					,[Received] = @Received
					,[SendEmail] = @SendEmail
					,[Notes] = @Notes
					,[Guid] = @Guid
					,[ContentType] = @ContentType
				WHERE
[notificationID] = @NotificationID