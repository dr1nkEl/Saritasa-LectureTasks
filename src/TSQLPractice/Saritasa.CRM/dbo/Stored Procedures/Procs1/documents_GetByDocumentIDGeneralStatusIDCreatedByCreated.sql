
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByDocumentIDGeneralStatusIDCreatedByCreated]
(

	@DocumentID bigint   ,

	@GeneralStatusId int   ,

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
					[documentID] = @DocumentID
					AND [GeneralStatusId] = @GeneralStatusId
					AND [CreatedBy] = @CreatedBy
					AND [Created] = @Created
				SELECT @@ROWCOUNT