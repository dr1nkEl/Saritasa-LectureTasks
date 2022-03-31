
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the email_templates table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.email_templates_Get_List

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
					
				SELECT @@ROWCOUNT
			


