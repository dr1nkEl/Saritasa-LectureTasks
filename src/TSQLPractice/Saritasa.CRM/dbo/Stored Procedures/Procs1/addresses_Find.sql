
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Finds records in the Addresses table passing nullable parameters
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[addresses_Find]
(

	@SearchUsingOR bit   = null ,

	@AddressID int   = null ,

	@City varchar (50)  = null ,

	@State varchar (30)  = null ,

	@Country varchar (30)  = null ,

	@Zip char (10)  = null ,

	@TargetId bigint   = null ,

	@TypeId char (2)  = null ,

	@Address varchar (300)  = null ,

	@Address2 varchar (300)  = null 
)
AS


				
  IF ISNULL(@SearchUsingOR, 0) <> 1
  BEGIN
    SELECT
	  [addressID]
	, [City]
	, [State]
	, [Country]
	, [Zip]
	, [TargetId]
	, [TypeId]
	, [Address]
	, [Address2]
    FROM
	[dbo].[Addresses]
    WHERE 
	 ([addressID] = @AddressID OR @AddressID IS NULL)
	AND ([City] = @City OR @City IS NULL)
	AND ([State] = @State OR @State IS NULL)
	AND ([Country] = @Country OR @Country IS NULL)
	AND ([Zip] = @Zip OR @Zip IS NULL)
	AND ([TargetId] = @TargetId OR @TargetId IS NULL)
	AND ([TypeId] = @TypeId OR @TypeId IS NULL)
	AND ([Address] = @Address OR @Address IS NULL)
	AND ([Address2] = @Address2 OR @Address2 IS NULL)
						
  END
  ELSE
  BEGIN
    SELECT
	  [addressID]
	, [City]
	, [State]
	, [Country]
	, [Zip]
	, [TargetId]
	, [TypeId]
	, [Address]
	, [Address2]
    FROM
	[dbo].[Addresses]
    WHERE 
	 ([addressID] = @AddressID AND @AddressID is not null)
	OR ([City] = @City AND @City is not null)
	OR ([State] = @State AND @State is not null)
	OR ([Country] = @Country AND @Country is not null)
	OR ([Zip] = @Zip AND @Zip is not null)
	OR ([TargetId] = @TargetId AND @TargetId is not null)
	OR ([TypeId] = @TypeId AND @TypeId is not null)
	OR ([Address] = @Address AND @Address is not null)
	OR ([Address2] = @Address2 AND @Address2 is not null)
	SELECT @@ROWCOUNT			
  END