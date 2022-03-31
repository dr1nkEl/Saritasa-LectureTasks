
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the email_templates table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_Update
(

	@EmailTemplateID int   ,

	@TemplateName varchar (100)  ,

	@Subject varchar (MAX)  ,

	@CcCopyTo varchar (MAX)  ,

	@Body varchar (MAX)  ,

	@FromName varchar (50)  ,

	@FromAddress varchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[email_templates]
				SET
					[templateName] = @TemplateName
					,[subject] = @Subject
					,[ccCopyTo] = @CcCopyTo
					,[body] = @Body
					,[fromName] = @FromName
					,[fromAddress] = @FromAddress
				WHERE
[emailTemplateID] = @EmailTemplateID 
				
			


