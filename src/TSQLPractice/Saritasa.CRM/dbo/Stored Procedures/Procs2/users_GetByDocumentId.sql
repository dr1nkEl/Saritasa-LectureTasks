
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Users table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[users_GetByDocumentId]
(

	@DocumentId bigint   
)
AS


				SELECT
					[Id],
					[FirstName],
					[LastName],
					[Title],
					[DocumentId],
					[TypeId],
					[Birthday],
					[TimeZone],
					[TimeZoneCode],
					[Notes],
					[DepartmentId],
					[Utilization],
					[HideBirthday],
					[UtilizationPercent],
					[DepartmentUpdatedAt],
					[WorkTypeId],
					[VendorId]
				FROM
					[dbo].[Users]
				WHERE
					[DocumentId] = @DocumentId
				SELECT @@ROWCOUNT