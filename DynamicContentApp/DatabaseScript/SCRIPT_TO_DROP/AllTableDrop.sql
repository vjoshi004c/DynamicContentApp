USE db_acd562_vpmuniversal
DECLARE @sql NVARCHAR(MAX) = N'';

-- Generate DROP CONSTRAINT statements
SELECT @sql += 'ALTER TABLE [' + s.name + '].[' + t.name + '] DROP CONSTRAINT [' + fk.name + '];' + CHAR(13)
FROM sys.foreign_keys fk
JOIN sys.tables t ON fk.parent_object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id;

-- Execute the DROP CONSTRAINT statements
EXEC sp_executesql @sql;

-- Reset variable for DROP TABLE statements
SET @sql = N'';

-- Generate DROP TABLE statements
SELECT @sql += 'DROP TABLE [' + s.name + '].[' + t.name + '];' + CHAR(13)
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id;

-- Execute the DROP TABLE statements
EXEC sp_executesql @sql;