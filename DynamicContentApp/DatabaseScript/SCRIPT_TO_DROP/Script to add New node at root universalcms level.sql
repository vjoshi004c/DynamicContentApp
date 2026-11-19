

*****************

--script to update languageid and versionid in following tables for multi language and multi version support

begin tran
UPDATE ASSETITEM SET version ='1' 
UPDATE ASSETITEM SET LanguageID ='ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23' 
UPDATE AssetItemFields SET version ='1' 
UPDATE AssetItemFields SET LanguageID ='ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23' 
UPDATE assetmediauploadedfiles SET version ='1' 
UPDATE assetmediauploadedfiles SET LanguageID ='ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23' 
UPDATE ComponentPresentation SET version ='1' 
UPDATE ComponentPresentation SET LanguageID ='ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23' 
UPDATE pagecontent SET version ='1' 
UPDATE pagecontent SET LanguageID ='ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23' 
UPDATE publishqueue SET version ='1' 
UPDATE publishqueue SET LanguageID ='ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23' 

rollback tran

-- script to add root node of universalcms at assetitem level as it is default entry alon with entry in assetschema for root item 

INSERT INTO [dbo].[AssetItem]
           ([ID]
           ,[ItemName]
           ,[ItemPath]
           ,[SchemaID]
           ,[IsPageItem]
           ,[MasterPageLayoutPath]
           ,[ParentID]
           ,[AssetType]
           ,[AssetItemSchemaMapped]
           ,[LanguageID]
           ,[Version])
     VALUES
           ('4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'
           ,'UniversalCMS'
           ,'/UniversalCMS'
           ,null
           ,0
           ,null
           ,null
           ,'5BC9CA65-E5A3-454A-A803-9DF082F323BE'
           ,'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'
           ,'ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23'
           ,1)