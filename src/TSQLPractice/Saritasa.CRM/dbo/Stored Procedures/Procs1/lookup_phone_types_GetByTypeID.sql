
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_phone_types table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_phone_types_GetByTypeID
(

	@TypeID char (3)  
)
AS


				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_phone_types]
				WHERE
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


