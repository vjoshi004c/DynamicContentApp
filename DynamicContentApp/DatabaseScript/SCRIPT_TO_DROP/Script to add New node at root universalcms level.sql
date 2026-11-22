

--*****************

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

          -- *****************************

        -- to  insert assetitem which not existed for associated assetschema id 

        begin tran
INSERT INTO [dbo].[AssetItem]
           ([ItemName]
           ,[ItemPath]
           ,[SchemaID]
           ,[IsPageItem]
           ,[MasterPageLayoutPath]
           ,[ParentID]
           ,[AssetType]
           ,[AssetItemSchemaMapped]
           ,[LanguageID]
           ,[Version])
  
           select 
                    ass.SchemaName, 
                    ass.SchemaPath,
                    'EF62364C-F2AF-41CC-99C9-2D4D227AD736',
                    0,
                    null,
                    ass.ParentID,
                    ass.AssetTypeID,
                    ass.id,
                    'ABA8A444-C2F0-4EF5-AD74-A7CDB1D90C23',
                    1
                from assetschema  ass
                left  join assetitem  ait 
                on  ass.id = ait.AssetItemSchemaMapped
                where ait.LanguageID is  null
          

           rollback tran

           -- **************
           --To delete unnecessary item from assetitem , assetitemfields and componentpresenation table to make assetitem and assetschema should has same count of record
           begin tran

delete from assetitem where id in (
select ait.id
from assetschema  ass
right  join assetitem  ait 
on  ass.id = ait.AssetItemSchemaMapped
where ass.id is  null)

rollback tran
begin tran
delete from  AssetItemFields where AssetItemID in
(
select ait.id
from assetschema  ass
right  join assetitem  ait 
on  ass.id = ait.AssetItemSchemaMapped
where ass.id is  null
)
rollback tran
begin tran
delete from  ComponentPresentation where AssetItemID in
(
select ait.id
from assetschema  ass
right  join assetitem  ait 
on  ass.id = ait.AssetItemSchemaMapped
where ass.id is  null
)
rollback tran

select count(*) from assetitem
select count(*) from assetschema

--*********************************


