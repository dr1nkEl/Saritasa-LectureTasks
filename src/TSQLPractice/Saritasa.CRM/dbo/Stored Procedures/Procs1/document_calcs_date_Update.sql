
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the document_calcs_date table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_Update
(

	@CalcID bigint   ,

	@DocumentID bigint   ,

	@TypeID varchar (20)  ,

	@Val varchar (200)  ,

	@Date datetime   ,

	@Val2 varchar (50)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[document_calcs_date]
				SET
					[documentID] = @DocumentID
					,[typeID] = @TypeID
					,[val] = @Val
					,[date] = @Date
					,[val2] = @Val2
				WHERE
[calcID] = @CalcID 
				
			


