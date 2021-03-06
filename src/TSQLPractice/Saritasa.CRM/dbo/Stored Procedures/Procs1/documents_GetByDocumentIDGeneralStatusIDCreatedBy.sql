
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByDocumentIDGeneralStatusIDCreatedBy]
(

	@DocumentID bigint   ,

	@GeneralStatusId int   ,

	@CreatedBy int   
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
				SELECT @@ROWCOUNT