
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_calc_types table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calc_types_Insert
(

	@TypeID varchar (20)  ,

	@Description varchar (300)  
)
AS


				
				INSERT INTO [dbo].[lookup_calc_types]
					(
					[typeID]
					,[Description]
					)
				VALUES
					(
					@TypeID
					,@Description
					)
				
									
							
			


