
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByTypeIDDocumentID]
(

	@TypeId char (3)  ,

	@DocumentID bigint   
)
AS


				SELECT
					[documentID],
					[Priority],
					[Name],
					[Created],
					[Updated],
					[Deleted],
					[CreatedBy],
					[UpdatedBy],
					[TypeId],
					[GeneralStatusId],
					[ObjectId],
					[ClientId],
					[ProjectId]
				FROM
					[dbo].[Documents]
				WHERE
					[TypeId] = @TypeId
					AND [documentID] = @DocumentID
				SELECT @@ROWCOUNT