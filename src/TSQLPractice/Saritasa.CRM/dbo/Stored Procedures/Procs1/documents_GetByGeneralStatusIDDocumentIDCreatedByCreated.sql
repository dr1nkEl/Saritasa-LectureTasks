
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByGeneralStatusIDDocumentIDCreatedByCreated]
(

	@GeneralStatusId int   ,

	@DocumentID bigint   ,

	@CreatedBy int   ,

	@Created datetime   
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
					[GeneralStatusId] = @GeneralStatusId
					AND [documentID] = @DocumentID
					AND [CreatedBy] = @CreatedBy
					AND [Created] = @Created
				SELECT @@ROWCOUNT