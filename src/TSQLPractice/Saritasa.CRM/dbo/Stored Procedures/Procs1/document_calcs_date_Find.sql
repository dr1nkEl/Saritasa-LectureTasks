
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the document_calcs_date table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.document_calcs_date_Find
(

	@SearchUsingOR bit   = null ,

	@CalcID bigint   = null ,

	@DocumentID bigint   = null ,

	@TypeID varchar (20)  = null ,

	@Val varchar (200)  = null ,

	@Date datetime   = null ,

	@Val2 varchar (50)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [calcID]
	, [documentID]
	, [typeID]
	, [val]
	, [date]
	, [val2]
    FROM
	[dbo].[document_calcs_date]
    WHERE 
	 ([calcID] = @CalcID OR @CalcID IS NULL)
	AND ([documentID] = @DocumentID OR @DocumentID IS NULL)
	AND ([typeID] = @TypeID OR @TypeID IS NULL)
	AND ([val] = @Val OR @Val IS NULL)
	AND ([date] = @Date OR @Date IS NULL)
	AND ([val2] = @Val2 OR @Val2 IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [calcID]
	, [documentID]
	, [typeID]
	, [val]
	, [date]
	, [val2]
    FROM
	[dbo].[document_calcs_date]
    WHERE 
	 ([calcID] = @CalcID AND @CalcID is not null)
	OR ([documentID] = @DocumentID AND @DocumentID is not null)
	OR ([typeID] = @TypeID AND @TypeID is not null)
	OR ([val] = @Val AND @Val is not null)
	OR ([date] = @Date AND @Date is not null)
	OR ([val2] = @Val2 AND @Val2 is not null)
	SELECT @@ROWCOUNT			
  END
				


