--Get the number of GB of uploaded files to CRM every month. Order by years and months.

CREATE PROCEDURE [dbo].[__SizeOfFilesCreatedEachMonth] AS
BEGIN
	SELECT
		COUNT(*) As FilesCreatedCount,
		DATEPART(MONTH, Documents.Created) as Year,
		DATEPART(YEAR, Documents.Created) as Month,
		(CAST(SUM(Files.FileSize) AS Float)/CAST(POWER(2,30) AS Float)) AS FilesSize
	FROM Documents
	JOIN Files
	ON  Files.DocumentId = Documents.documentID
	GROUP BY DATEPART(MONTH, Documents.Created), DATEPART(YEAR, Documents.Created)
	ORDER BY DATEPART(YEAR, Documents.Created), DATEPART(MONTH, Documents.Created);
END
