
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Notifications table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_Insert]
(

	@NotificationID bigint    OUTPUT,

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


				
				INSERT INTO [dbo].[Notifications]
					(
					[Addressee]
					,[Subject]
					,[Created]
					,[CreatedBy]
					,[Type]
					,[Received]
					,[SendEmail]
					,[Notes]
					,[Guid]
					,[ContentType]
					)
				VALUES
					(
					@Addressee
					,@Subject
					,@Created
					,@CreatedBy
					,@Type
					,@Received
					,@SendEmail
					,@Notes
					,@Guid
					,@ContentType
					)
				
				-- Get the identity value
				SET @NotificationID = SCOPE_IDENTITY()