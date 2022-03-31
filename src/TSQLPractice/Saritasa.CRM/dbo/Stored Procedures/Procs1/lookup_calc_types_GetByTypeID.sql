
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_calc_types table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calc_types_GetByTypeID
(

	@TypeID varchar (20)  
)
AS


				SELECT
					[typeID],
					[Description]
				FROM
					[dbo].[lookup_calc_types]
				WHERE
					[typeID] = @TypeID
				SELECT @@ROWCOUNT
					
			


