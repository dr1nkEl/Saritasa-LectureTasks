
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByDocumentIDCreatedByDeleted]
(

	@DocumentID bigint   ,

	@CreatedBy int   ,

	@Deleted datetime   
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
					[documentID] = @DocumentID
					AND [CreatedBy] = @CreatedBy
					AND [Deleted] = @Deleted
				SELECT @@ROWCOUNT