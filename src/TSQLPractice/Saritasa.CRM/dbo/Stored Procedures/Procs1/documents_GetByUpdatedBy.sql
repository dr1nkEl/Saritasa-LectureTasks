
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Documents table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[documents_GetByUpdatedBy]
(

	@UpdatedBy int   
)
AS


				SET ANSI_NULLS OFF
				
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
					[UpdatedBy] = @UpdatedBy
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON