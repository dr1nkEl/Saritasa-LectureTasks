
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_calc_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calc_types_Update
(

	@TypeID varchar (20)  ,

	@OriginalTypeID varchar (20)  ,

	@Description varchar (300)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_calc_types]
				SET
					[typeID] = @TypeID
					,[Description] = @Description
				WHERE
[typeID] = @OriginalTypeID 
				
			


