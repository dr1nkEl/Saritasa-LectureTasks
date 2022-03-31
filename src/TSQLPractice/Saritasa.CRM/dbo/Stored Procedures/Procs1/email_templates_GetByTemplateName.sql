
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the email_templates table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_GetByTemplateName
(

	@TemplateName varchar (100)  
)
AS


				SELECT
					[emailTemplateID],
					[templateName],
					[subject],
					[ccCopyTo],
					[body],
					[fromName],
					[fromAddress]
				FROM
					[dbo].[email_templates]
				WHERE
					[templateName] = @TemplateName
				SELECT @@ROWCOUNT
					
			


