
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Notifications table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[notifications_Find]
(

	@SearchUsingOR bit   = null ,

	@NotificationID bigint   = null ,

	@Addressee bigint   = null ,

	@Subject varchar (MAX)  = null ,

	@Created datetime   = null ,

	@CreatedBy int   = null ,

	@Type tinyint   = null ,

	@Received datetime   = null ,

	@SendEmail datetime   = null ,

	@Notes varchar (MAX)  = null ,

	@Guid uniqueidentifier   = null ,

	@ContentType char (2)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [notificationID]
	, [Addressee]
	, [Subject]
	, [Created]
	, [CreatedBy]
	, [Type]
	, [Received]
	, [SendEmail]
	, [Notes]
	, [Guid]
	, [ContentType]
    FROM
	[dbo].[Notifications]
    WHERE 
	 ([notificationID] = @NotificationID OR @NotificationID IS NULL)
	AND ([Addressee] = @Addressee OR @Addressee IS NULL)
	AND ([Subject] = @Subject OR @Subject IS NULL)
	AND ([Created] = @Created OR @Created IS NULL)
	AND ([CreatedBy] = @CreatedBy OR @CreatedBy IS NULL)
	AND ([Type] = @Type OR @Type IS NULL)
	AND ([Received] = @Received OR @Received IS NULL)
	AND ([SendEmail] = @SendEmail OR @SendEmail IS NULL)
	AND ([Notes] = @Notes OR @Notes IS NULL)
	AND ([Guid] = @Guid OR @Guid IS NULL)
	AND ([ContentType] = @ContentType OR @ContentType IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [notificationID]
	, [Addressee]
	, [Subject]
	, [Created]
	, [CreatedBy]
	, [Type]
	, [Received]
	, [SendEmail]
	, [Notes]
	, [Guid]
	, [ContentType]
    FROM
	[dbo].[Notifications]
    WHERE 
	 ([notificationID] = @NotificationID AND @NotificationID is not null)
	OR ([Addressee] = @Addressee AND @Addressee is not null)
	OR ([Subject] = @Subject AND @Subject is not null)
	OR ([Created] = @Created AND @Created is not null)
	OR ([CreatedBy] = @CreatedBy AND @CreatedBy is not null)
	OR ([Type] = @Type AND @Type is not null)
	OR ([Received] = @Received AND @Received is not null)
	OR ([SendEmail] = @SendEmail AND @SendEmail is not null)
	OR ([Notes] = @Notes AND @Notes is not null)
	OR ([Guid] = @Guid AND @Guid is not null)
	OR ([ContentType] = @ContentType AND @ContentType is not null)
	SELECT @@ROWCOUNT			
  END