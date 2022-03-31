
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_email_types table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_email_types_GetByTypeID
(

	@TypeID char (2)  
)
AS


				SELECT
					[typeID],
					[typeName]
				FROM
					[dbo].[lookup_email_types]
				WHERE
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


