
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the email_templates table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_GetByEmailTemplateID
(

	@EmailTemplateID int   
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
					[emailTemplateID] = @EmailTemplateID
				SELECT @@ROWCOUNT
					
			


