
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Addresses table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[addresses_GetByTypeID]
(

	@TypeId char (2)  
)
AS


				SELECT
					[addressID],
					[City],
					[State],
					[Country],
					[Zip],
					[TargetId],
					[TypeId],
					[Address],
					[Address2]
				FROM
					[dbo].[Addresses]
				WHERE
					[TypeId] = @TypeId
				SELECT @@ROWCOUNT