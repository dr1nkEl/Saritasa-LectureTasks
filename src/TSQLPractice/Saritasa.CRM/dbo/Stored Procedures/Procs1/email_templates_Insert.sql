
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the email_templates table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_Insert
(

	@EmailTemplateID int    OUTPUT,

	@TemplateName varchar (100)  ,

	@Subject varchar (MAX)  ,

	@CcCopyTo varchar (MAX)  ,

	@Body varchar (MAX)  ,

	@FromName varchar (50)  ,

	@FromAddress varchar (50)  
)
AS


				
				INSERT INTO [dbo].[email_templates]
					(
					[templateName]
					,[subject]
					,[ccCopyTo]
					,[body]
					,[fromName]
					,[fromAddress]
					)
				VALUES
					(
					@TemplateName
					,@Subject
					,@CcCopyTo
					,@Body
					,@FromName
					,@FromAddress
					)
				
				-- Get the identity value
				SET @EmailTemplateID = SCOPE_IDENTITY()
									
							
			


