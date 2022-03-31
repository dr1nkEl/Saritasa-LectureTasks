
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_features table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_features_GetByDocumentID
(

	@DocumentID bigint   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[ID],
					[documentID],
					[projectID],
					[name],
					[limit],
					[description]
				FROM
					[dbo].[project_features]
				WHERE
					[documentID] = @DocumentID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


