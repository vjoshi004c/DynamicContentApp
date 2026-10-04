USE db_acd562_vpmuniversal
DECLARE @sql NVARCHAR(MAX) = N'';

-- Build DROP statements for all stored procedures
SELECT @sql += N'DROP PROCEDURE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + ';' + CHAR(13)
FROM sys.procedures;

-- Execute the generated DROP statements
IF @sql <> ''
BEGIN
    PRINT '-- Dropping all stored procedures --';
    PRINT @sql; -- Optional: review before execution
    EXEC sp_executesql @sql;
END
ELSE
BEGIN
    PRINT 'No stored procedures found in this database.';
END