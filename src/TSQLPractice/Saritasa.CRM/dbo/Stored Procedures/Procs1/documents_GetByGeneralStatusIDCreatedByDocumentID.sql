
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByGeneralStatusIDCreatedByDocumentID]
(

	@GeneralStatusId int   ,

	@CreatedBy int   ,

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
					[GeneralStatusId] = @GeneralStatusId
					AND [CreatedBy] = @CreatedBy
					AND [documentID] = @DocumentID
				SELECT @@ROWCOUNT