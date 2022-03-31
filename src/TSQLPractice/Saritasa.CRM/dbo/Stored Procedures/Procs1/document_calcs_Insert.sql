
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the document_calcs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_Insert
(

	@CalcID bigint    OUTPUT,

	@DocumentID bigint   ,

	@TypeID varchar (20)  ,

	@Val varchar (300)  
)
AS


				
				INSERT INTO [dbo].[document_calcs]
					(
					[documentID]
					,[typeID]
					,[val]
					)
				VALUES
					(
					@DocumentID
					,@TypeID
					,@Val
					)
				
				-- Get the identity value
				SET @CalcID = SCOPE_IDENTITY()
									
							
			

