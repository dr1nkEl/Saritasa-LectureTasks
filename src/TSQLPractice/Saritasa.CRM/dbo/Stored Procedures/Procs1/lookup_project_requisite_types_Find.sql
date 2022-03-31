
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the lookup_project_requisite_types table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_project_requisite_types_Find
(

	@SearchUsingOR bit   = null ,

	@RequisiteID int   = null ,

	@Requisite varchar (100)  = null ,

	@OrderBy int   = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [requisiteID]
	, [requisite]
	, [orderBy]
    FROM
	[dbo].[lookup_project_requisite_types]
    WHERE 
	 ([requisiteID] = @RequisiteID OR @RequisiteID IS NULL)
	AND ([requisite] = @Requisite OR @Requisite IS NULL)
	AND ([orderBy] = @OrderBy OR @OrderBy IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [requisiteID]
	, [requisite]
	, [orderBy]
    FROM
	[dbo].[lookup_project_requisite_types]
    WHERE 
	 ([requisiteID] = @RequisiteID AND @RequisiteID is not null)
	OR ([requisite] = @Requisite AND @Requisite is not null)
	OR ([orderBy] = @OrderBy AND @OrderBy is not null)
	SELECT @@ROWCOUNT			
  END
				


