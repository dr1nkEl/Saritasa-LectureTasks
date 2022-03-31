
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the document_calcs_date table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_Insert
(

	@CalcID bigint    OUTPUT,

	@DocumentID bigint   ,

	@TypeID varchar (20)  ,

	@Val varchar (200)  ,

	@Date datetime   ,

	@Val2 varchar (50)  
)
AS


				
				INSERT INTO [dbo].[document_calcs_date]
					(
					[documentID]
					,[typeID]
					,[val]
					,[date]
					,[val2]
					)
				VALUES
					(
					@DocumentID
					,@TypeID
					,@Val
					,@Date
					,@Val2
					)
				
				-- Get the identity value
				SET @CalcID = SCOPE_IDENTITY()
									
							
			


