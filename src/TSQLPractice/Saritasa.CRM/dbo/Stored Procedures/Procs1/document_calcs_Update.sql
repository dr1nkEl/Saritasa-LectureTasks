
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the document_calcs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_Update
(

	@CalcID bigint   ,

	@DocumentID bigint   ,

	@TypeID varchar (20)  ,

	@Val varchar (300)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[document_calcs]
				SET
					[documentID] = @DocumentID
					,[typeID] = @TypeID
					,[val] = @Val
				WHERE
[calcID] = @CalcID 
				
			

