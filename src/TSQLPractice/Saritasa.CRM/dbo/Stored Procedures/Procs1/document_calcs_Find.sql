
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the document_calcs table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_Find
(

	@SearchUsingOR bit   = null ,

	@CalcID bigint   = null ,

	@DocumentID bigint   = null ,

	@TypeID varchar (20)  = null ,

	@Val varchar (300)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [calcID]
	, [documentID]
	, [typeID]
	, [val]
    FROM
	[dbo].[document_calcs]
    WHERE 
	 ([calcID] = @CalcID OR @CalcID IS NULL)
	AND ([documentID] = @DocumentID OR @DocumentID IS NULL)
	AND ([typeID] = @TypeID OR @TypeID IS NULL)
	AND ([val] = @Val OR @Val IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [calcID]
	, [documentID]
	, [typeID]
	, [val]
    FROM
	[dbo].[document_calcs]
    WHERE 
	 ([calcID] = @CalcID AND @CalcID is not null)
	OR ([documentID] = @DocumentID AND @DocumentID is not null)
	OR ([typeID] = @TypeID AND @TypeID is not null)
	OR ([val] = @Val AND @Val is not null)
	SELECT @@ROWCOUNT			
  END
				

