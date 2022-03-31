
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_calendar_events_type table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_calendar_events_type_Insert
(

	@TypeID varchar (3)  ,

	@TypeName varchar (100)  
)
AS


				
				INSERT INTO [dbo].[lookup_calendar_events_type]
					(
					[typeID]
					,[typeName]
					)
				VALUES
					(
					@TypeID
					,@TypeName
					)
				
									
							
			


