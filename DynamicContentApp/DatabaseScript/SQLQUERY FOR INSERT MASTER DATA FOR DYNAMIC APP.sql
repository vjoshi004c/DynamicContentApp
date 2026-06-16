
GO
---------------------------------
delete  from assetschemafields
delete from assetfields 
delete from assetschema --where id <> '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'
delete  from pagepresentation 
delete from placeholderpresentation
delete from ComponentPresentation
delete from assetitemfields
delete from assetitem

select *  from assetschemafields
select * from assetfields 
select * from assetschema
select *  from pagepresentation 
select * from placeholderpresentation
select * from ComponentPresentation
select * from assetitemfields
select * from assetitem

-------------------------------
--AssetSchema]
select * from AssetSchema
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE',      'UniversalCMS',     '/Schema/DynamicContent', '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE')
update [dbo].[AssetSchema] set [ParentID]= null where id = '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'
update [dbo].[AssetSchema] set SchemaName=  'UniversalCMS' where id = '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'

select * from AssetSchema where id ='E17E4A01-ECCA-4B9F-886C-7BE198091843'

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('608AD90B-52F0-451A-8FE8-DB284ED0E3E4',      'BottomContent',     '/Schema/MySite/BottomContent')
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('710FBE40-8EBD-4FDE-BA99-282501FA809A',      'Footer',     '/Schema/MySite/Footer')
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('74826E3E-C2EA-45DC-A328-43F115F45161',      'Header',     '/Schema/MySite/Header')
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('88FDCEF5-EAAB-4349-93BE-08DCC3E7765D',      'MiddleContent',     '/Schema/MySite/MiddleContent')
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('A23BE558-72E9-4326-B2C7-BC5C99F38B34',      'SocialMedia',     '/Schema/MySite/SocialMedia')
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('A6676449-07F1-4DEA-B456-6D4BE646E351',      'MainNagivation',     '/Schema/MySite/MainNagiation')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('EB60F493-F53B-4388-B17E-B3D1A3A0456E',      'SecondAssetPage',     '/Schema/MySite/SecondAssePage')
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath])
VALUES    ('E9E34FBE-0F61-4B16-BA71-E938365FBA61',      'FirstAssetPage',     '/Schema/MySite/FirstAssePage')



INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('DC30B818-0EF8-4BF9-84E2-812EC508A483',      'Setting',     '/Schema/Generic/Setting', '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE')


select * from AssetSchema where id='DC30B818-0EF8-4BF9-84E2-812EC508A483'
select * from AssetSchema where id='4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'

select * from assetschema where id ='111035FA-612A-4EB5-9CBC-8DF91E9152A3'
INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('111035FA-612A-4EB5-9CBC-8DF91E9152A3',      'Layouts',     '/Schema/Generic/Laypouts', '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('2EB94A78-CC78-4C33-84EA-C2B583A9C8BD',      'PageTemplate',     '/Schema/Generic/PageTemplate', '111035FA-612A-4EB5-9CBC-8DF91E9152A3')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('E17E4A01-ECCA-4B9F-886C-7BE198091843',      'ComponentTemplate',     '/Schema/Generic/ComponentTemplate', '111035FA-612A-4EB5-9CBC-8DF91E9152A3')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('8CEE3BBE-195F-416A-A204-1B15BE16AD66',      'PlaceholderTemplate',     '/Schema/Generic/ComponentTemplate', '111035FA-612A-4EB5-9CBC-8DF91E9152A3')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('3B6B4A0A-CE7A-4CFA-8B9D-47ED4DC89DC0',      'Model',     '/Schema/Generic/Model', '111035FA-612A-4EB5-9CBC-8DF91E9152A3')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    (  '98765071-870F-4D6E-9C2B-7B4289CFD876'  ,  'Header',     '/Schema/Generic/PlaceholderTemplate', '8CEE3BBE-195F-416A-A204-1B15BE16AD66')
INSERT INTO [dbo].[AssetSchema]( [ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    (  '2AF482AE-C5D8-4D07-9F4A-010699A6BDC8',    'Footer',     '/Schema/Generic/PlaceholderTemplate', '8CEE3BBE-195F-416A-A204-1B15BE16AD66')
INSERT INTO [dbo].[AssetSchema]( [ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    (    'D45238F6-473B-4C54-AC4B-EC7DAD072A48',   'ContentBody',     '/Schema/Generic/PlaceholderTemplate', '8CEE3BBE-195F-416A-A204-1B15BE16AD66')
INSERT INTO [dbo].[AssetSchema]([ID] , [SchemaName] ,[SchemaPath], [ParentID])
VALUES    (   '40243409-86FE-488D-885B-F5573BF13884',    'ContentTop',     '/Schema/Generic/PlaceholderTemplate', '8CEE3BBE-195F-416A-A204-1B15BE16AD66')
INSERT INTO [dbo].[AssetSchema]([ID] , [SchemaName] ,[SchemaPath], [ParentID])
VALUES    (  'C06D2B89-2780-48A2-B2F8-7EEEE5C4A895',     'ContentMiddle',     '/Schema/Generic/PlaceholderTemplate', '8CEE3BBE-195F-416A-A204-1B15BE16AD66')
INSERT INTO [dbo].[AssetSchema]( [ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ( 'D2845137-E036-4536-8AE1-88733E3B3E8E' ,   'ContentBootom',     '/Schema/Generic/PlaceholderTemplate', '8CEE3BBE-195F-416A-A204-1B15BE16AD66')

select * from assetschema where id ='1049D17E-6C1C-45A9-9B75-5F779B61023E'

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('3DE3D088-C2CA-4B3C-99CD-612296509BE8',      'HomeViewModel',     '/Schema/Generic/Model/HomeViewModel', '3B6B4A0A-CE7A-4CFA-8B9D-47ED4DC89DC0')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('2F433119-3A7D-4CB3-A09D-443C74A653E0',      'ProductViewModel',     '/Schema/Generic/Model/HomeViewModel', '3B6B4A0A-CE7A-4CFA-8B9D-47ED4DC89DC0')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('1049D17E-6C1C-45A9-9B75-5F779B61023E',      'Schema',     '/Schema/Generic/Schema', '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('5F24782D-19C9-4BFF-B90C-ABC4BE48AA69',      'SystemSchema',     '/Schema/Generic/Schema/System', '1049D17E-6C1C-45A9-9B75-5F779B61023E')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('B1D85537-FBC1-49B8-887F-61A7DD62F2C7',      'ProjectSchema',     '/Schema/Generic/Schema/Project', '1049D17E-6C1C-45A9-9B75-5F779B61023E')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('32D4E807-DD87-4019-93D5-9524DD4D4293',      'CommonSchema',     '/Schema/Generic/Schema/Project', '1049D17E-6C1C-45A9-9B75-5F779B61023E')

--select * from assetschema where id ='D1B2BE76-C76B-447A-A30A-DDDF4959A8FC'


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('D1B2BE76-C76B-447A-A30A-DDDF4959A8FC',      'Content',     '/Schema/Generic/Content', '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('24EEE53B-5962-4442-ABC4-DB813DBE1B92',      'Home',     '/Schema/Generic/Content/Home', 'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('205BEE5A-8E89-4359-830D-591AB6798214',      'SampleSite1',     '/Schema/Generic/Content/SampleSite1', 'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('11CD8862-0CFA-4EB7-A670-9ABDF8217B29',      'SampleSite2',     '/Schema/Generic/Content/SampleSite2', 'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('B2E50BE7-F7BE-4778-AB3A-5E52773571F2',      'Workflow',     '/Schema/Generic/Setting/Workflow', 'DC30B818-0EF8-4BF9-84E2-812EC508A483')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('18D607FD-938E-42FD-936A-8003A8F604D7',      'Languages',     '/Schema/Generic/Setting.Languages', 'DC30B818-0EF8-4BF9-84E2-812EC508A483')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('C69B3996-65BE-4BFE-B545-0A7E419B0749',      'System',     '/Schema/Generic/Setting/System', 'DC30B818-0EF8-4BF9-84E2-812EC508A483')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9',      'Media',     '/Schema/Generic/Media', '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE')


INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('9A0B3186-1E5F-47A8-9ED6-C7FB4346CB0F',      'System',     '/Schema/Generic/Media/System', 'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('F6CEFB03-0492-42CF-AD84-EEDA1CF29668',      'Common',     '/Schema/Generic/Media/Common', 'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('1FD66191-4977-4931-B4BC-C9757F42A242',      'Project',     '/Schema/Generic/Media/Project', 'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF',      'SampleSite1',     '/Schema/Generic/Schema/Project/SampleSite1', 'B1D85537-FBC1-49B8-887F-61A7DD62F2C7')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('DA45384F-07F1-4BC2-BE5B-73183577E83C',      'SampleSite1',     '/Schema/Generic/Schema/Project/SampleSite1', 'B1D85537-FBC1-49B8-887F-61A7DD62F2C7')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('6656B0C9-60C0-4F13-9C95-5868FCCE9DA5',      'Base',     '/Schema/Generic/Schema/Project/SampleSite1/Base', '2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('74B2EF4B-C264-474F-ABA1-066F494264CD',      'Page',     '/Schema/Generic/Schema/Project//SampleSite2/Page', '2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('76A29DE8-C46C-49DE-9362-A073D3FB8E35',      'Component',     '/Schema/Generic/Schema/Project//SampleSite2/Component', '2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('F23A917E-8D1C-467B-8419-06E8F48A6FCF',      'Header',     '/Schema/Generic/Schema/Project/SampleSite1/Base/Header', '6656B0C9-60C0-4F13-9C95-5868FCCE9DA5')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('85B01480-B8AC-4EB2-ABA1-A280E0A6FA04',      'Footer',     '/Schema/Generic/Schema/Project/SampleSite1/Base/Footer', '6656B0C9-60C0-4F13-9C95-5868FCCE9DA5')

INSERT INTO [dbo].[AssetSchema]([ID] ,[SchemaName] ,[SchemaPath], [ParentID])
VALUES    ('07BE06E2-13C3-4F58-A8B5-67F8BA2FB0F7',      'Search',     '/Schema/Generic/Schema/Project/SampleSite1/Base/Search', '6656B0C9-60C0-4F13-9C95-5868FCCE9DA5')

update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = '608AD90B-52F0-451A-8FE8-DB284ED0E3E4'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = '710FBE40-8EBD-4FDE-BA99-282501FA809A'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = 'EB60F493-F53B-4388-B17E-B3D1A3A0456E'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = 'E9E34FBE-0F61-4B16-BA71-E938365FBA61'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = '74826E3E-C2EA-45DC-A328-43F115F45161'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = '88FDCEF5-EAAB-4349-93BE-08DCC3E7765D'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = 'A23BE558-72E9-4326-B2C7-BC5C99F38B34'
update [dbo].[AssetSchema] set [ParentID]='E17E4A01-ECCA-4B9F-886C-7BE198091843' where id = 'A6676449-07F1-4DEA-B456-6D4BE646E351'
update [dbo].[AssetSchema] set [ParentID]='2EB94A78-CC78-4C33-84EA-C2B583A9C8BD' where id = 'EB60F493-F53B-4388-B17E-B3D1A3A0456E'
update [dbo].[AssetSchema] set [ParentID]='2EB94A78-CC78-4C33-84EA-C2B583A9C8BD' where id = 'E9E34FBE-0F61-4B16-BA71-E938365FBA61'
update [dbo].[AssetSchema] set [ParentID]='2EB94A78-CC78-4C33-84EA-C2B583A9C8BD' where id = 'E9E34FBE-0F61-4B16-BA71-E938365FBA61'
update [dbo].[AssetSchema] set [ParentID]='2EB94A78-CC78-4C33-84EA-C2B583A9C8BD' where id = 'EB60F493-F53B-4388-B17E-B3D1A3A0456E'

GO
--select * from AssetFields
--[AssetFields][AssetFields]
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA','MultiList', 'MULTILIST')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E','MultilineText', 'MULTILINE_TEXT')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F','SimpleText', 'SIMPLLE_TEXT')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('395A153E-1967-490C-B293-42824E754DAF','Link', 'LINK')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('5CE9E74B-B79B-421C-A346-00DFA1410D76','Date', 'DATE')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('919175D2-D5D6-4BAB-B213-655E40E29FB0','Dropdown', 'DROPDOWN')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('A9F7BBE1-2FEA-40D4-BC43-0A0C2E20C824','Image', 'IMAGE')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('DC218D8D-1F5C-4C94-AF79-A90B75097EB1','Checkbox', 'CHECKBOX')
INSERT INTO [dbo].[AssetFields] ([ID] ,[FieldName] ,[FieldType])  
VALUES ('E19765AD-A559-40F0-837A-132841CAD972','HTMLText', 'HTML_TEXT')
GO


GO
--AssetSchemaFields
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '608AD90B-52F0-451A-8FE8-DB284ED0E3E4','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of BottomContent SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '608AD90B-52F0-451A-8FE8-DB284ED0E3E4','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of BottomContent Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '608AD90B-52F0-451A-8FE8-DB284ED0E3E4','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of BottomContent Rich text' ,'Description')



INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '710FBE40-8EBD-4FDE-BA99-282501FA809A','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of Footer SingleText' ,'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName])
VALUES  ( '710FBE40-8EBD-4FDE-BA99-282501FA809A','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of Footer Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '710FBE40-8EBD-4FDE-BA99-282501FA809A','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of Footer Rich text','Description')

INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '74826E3E-C2EA-45DC-A328-43F115F45161','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of Header SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '74826E3E-C2EA-45DC-A328-43F115F45161','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of Header Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '74826E3E-C2EA-45DC-A328-43F115F45161','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of Header Rich text','Description')

INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '88FDCEF5-EAAB-4349-93BE-08DCC3E7765D','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of MiddleContent SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '88FDCEF5-EAAB-4349-93BE-08DCC3E7765D','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of MiddleContent Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( '88FDCEF5-EAAB-4349-93BE-08DCC3E7765D','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of MiddleContent Rich text','Description')

INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'A23BE558-72E9-4326-B2C7-BC5C99F38B34','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of SocialMedia SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'A23BE558-72E9-4326-B2C7-BC5C99F38B34','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of SocialMedia Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'A23BE558-72E9-4326-B2C7-BC5C99F38B34','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of SocialMedia Rich text','Description')

INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'A6676449-07F1-4DEA-B456-6D4BE646E351','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of MainNagivation SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'A6676449-07F1-4DEA-B456-6D4BE646E351','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of MainNagivation Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'A6676449-07F1-4DEA-B456-6D4BE646E351','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of MainNagivation Rich text','Description')

--INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData])
--VALUES  ( 'C2D7D839-B819-437F-8822-D3579984A4B2','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of TopContent SingleText')
--INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData])
--VALUES  ( 'C2D7D839-B819-437F-8822-D3579984A4B2','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of TopContent Multiline text')
--INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData])
--VALUES  ( 'C2D7D839-B819-437F-8822-D3579984A4B2','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of TopContent Rich text')

INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'E9E34FBE-0F61-4B16-BA71-E938365FBA61','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of FirstAssetPage SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'E9E34FBE-0F61-4B16-BA71-E938365FBA61','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of FirstAssetPage Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'E9E34FBE-0F61-4B16-BA71-E938365FBA61','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of FirstAssetPage Rich text','Description')


INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'EB60F493-F53B-4388-B17E-B3D1A3A0456E','1E0C6229-01D2-45E5-8A66-65F2964DDD8F' ,'Test of SecondAssetPage SingleText', 'Title')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'EB60F493-F53B-4388-B17E-B3D1A3A0456E','E19765AD-A559-40F0-837A-132841CAD972' ,'Test of SecondAssetPage Multiline text','ShortDescription')
INSERT INTO [dbo].[AssetSchemaFields] ([SchemaID]  ,[FieldTypeID]  ,[FieldData],[FieldName] )
VALUES  ( 'EB60F493-F53B-4388-B17E-B3D1A3A0456E','115A7A1E-D135-42E7-BAB2-7E400F4AF29E' ,'Test of SecondAssetPage Rich text','Description')
GO

-- added assetitem

INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('3941B0BB-F2FD-483A-81EE-C73117F8C1F9','FirstAssetItem' ,'/Content/MySite/Data/FirstAssetItem' ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61'  ,1 ,'/Content/Layout/FirstMaster')
GO
INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('94ECC1CF-19BA-4B1F-99B8-BCF1778A139D','SecondtAssetItem' ,'/Content/MySite/Data/SecondAssetItem' ,'EB60F493-F53B-4388-B17E-B3D1A3A0456E'  ,1 ,'/Content/Layout/SecondMaster')
GO
INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('0EF047BE-60AD-44B8-A143-95606FED7873','Footer' ,'/Content/MySite/Data/Footer' ,'608AD90B-52F0-451A-8FE8-DB284ED0E3E4'  ,0 ,'')
GO
INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('1909CDAC-1FCC-4309-8409-83EAEB5703CD','TopContent' ,'/Content/MySite/Data/TopContent' ,'A6676449-07F1-4DEA-B456-6D4BE646E351'  ,0 ,'')
GO
INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('9AA185C3-CC75-4D64-A335-C51C10FC3A96','Header' ,'/Content/MySite/Data/Header' ,'710FBE40-8EBD-4FDE-BA99-282501FA809A'  ,0 ,'')
GO
INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('AD4A9404-87A3-46FA-94FE-F2978214C328','MiddleContent' ,'/Content/MySite/Data/MiddleContent' ,'74826E3E-C2EA-45DC-A328-43F115F45161'  ,0 ,'')
GO

INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('B6965FB9-B28D-4F4A-942F-1E34A8E24D84','MainNagivation' ,'/Content/MySite/Data/MainNagivation' ,'A23BE558-72E9-4326-B2C7-BC5C99F38B34'  ,0 ,'')
GO
INSERT INTO [dbo].[AssetItem]([ID],[ItemName] ,[ItemPath] ,[SchemaID] ,[IsPageItem] ,[MasterPageLayoutPath])
     VALUES ('B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69','BottomContent' ,'/Content/MySite/Data/BottomContent' ,'608AD90B-52F0-451A-8FE8-DB284ED0E3E4'  ,0 ,'')
GO
--exec dca_insert_asset_item  @ItemName='FirstAssetItem' , @ItemPath='/Content/MySite/Data/FirstAssetItem', @SchemaID='E9E34FBE-0F61-4B16-BA71-E938365FBA61', @IsPageItem=1,@MasterPageLayoutPath= '/Content/Layout/FirstMaster'
--exec dca_insert_asset_item  @ItemName='BottomContent' , @ItemPath='/Content/MySite/Data/BottomContent', @SchemaID='608AD90B-52F0-451A-8FE8-DB284ED0E3E4', @IsPageItem=0,@MasterPageLayoutPath= ''
--exec dca_insert_asset_item  @ItemName='Header' , @ItemPath='/Content/MySite/Data/Header', @SchemaID='710FBE40-8EBD-4FDE-BA99-282501FA809A', @IsPageItem=0,@MasterPageLayoutPath= ''
--exec dca_insert_asset_item  @ItemName='MainNagivation' , @ItemPath='/Content/MySite/Data/MainNagivation', @SchemaID='A23BE558-72E9-4326-B2C7-BC5C99F38B34', @IsPageItem=0,@MasterPageLayoutPath= ''
--exec dca_insert_asset_item  @ItemName='SecondAssetItem' , @ItemPath='/Content/MySite/Data/SecondAssetItem', @SchemaID='EB60F493-F53B-4388-B17E-B3D1A3A0456E', @IsPageItem=1,@MasterPageLayoutPath= '/Content/Layout/SecondMaster'
--exec dca_insert_asset_item  @ItemName='TopContent' , @ItemPath='/Content/MySite/Data/TopContent', @SchemaID='A6676449-07F1-4DEA-B456-6D4BE646E351', @IsPageItem=0,@MasterPageLayoutPath= ''
--exec dca_insert_asset_item  @ItemName='Footer' , @ItemPath='/Content/MySite/Data/Footer', @SchemaID='608AD90B-52F0-451A-8FE8-DB284ED0E3E4', @IsPageItem=0,@MasterPageLayoutPath= ''
--exec dca_insert_asset_item  @ItemName='MiddleContent' , @ItemPath='/Content/MySite/Data/MiddleContent', @SchemaID='74826E3E-C2EA-45DC-A328-43F115F45161', @IsPageItem=0,@MasterPageLayoutPath= ''

--go 
--add assetitemfields
GO
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data BottomContent'  ,'608AD90B-52F0-451A-8FE8-DB284ED0E3E4' ,'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data BottomContent'  ,'608AD90B-52F0-451A-8FE8-DB284ED0E3E4' ,'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test data BottomContent'  ,'608AD90B-52F0-451A-8FE8-DB284ED0E3E4' ,'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69'  )
GO
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data MiddleContent'  ,'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D' ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data MiddleContent'  ,'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D' ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test data MiddleContent'  ,'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D' ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  )
GO
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data Header'  ,'74826E3E-C2EA-45DC-A328-43F115F45161' ,'9AA185C3-CC75-4D64-A335-C51C10FC3A96'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data Header'  ,'74826E3E-C2EA-45DC-A328-43F115F45161' ,'9AA185C3-CC75-4D64-A335-C51C10FC3A96'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test data Header'  ,'74826E3E-C2EA-45DC-A328-43F115F45161' ,'9AA185C3-CC75-4D64-A335-C51C10FC3A96'  )
GO
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data SecondAssetItem'  ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61' ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data SecondAssetItem'  ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61' ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test data SecondAssetItem'  ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61' ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  )
GO

INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data FirstAssetItem'  ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61' ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data FirstAssetItem'  ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61' ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test data FirstAssetItem'  ,'E9E34FBE-0F61-4B16-BA71-E938365FBA61' ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  )
GO

INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data MainNagivation'  ,'A6676449-07F1-4DEA-B456-6D4BE646E351' ,'B6965FB9-B28D-4F4A-942F-1E34A8E24D84'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data MainNagivation'  ,'A6676449-07F1-4DEA-B456-6D4BE646E351' ,'B6965FB9-B28D-4F4A-942F-1E34A8E24D84'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test data MainNagivation'  ,'A6676449-07F1-4DEA-B456-6D4BE646E351' ,'B6965FB9-B28D-4F4A-942F-1E34A8E24D84'  )
GO

INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('115A7A1E-D135-42E7-BAB2-7E400F4AF29E'  ,'Test data Footer'  ,'710FBE40-8EBD-4FDE-BA99-282501FA809A' ,'0EF047BE-60AD-44B8-A143-95606FED7873'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('1E0C6229-01D2-45E5-8A66-65F2964DDD8F'  ,'Test data Footer'  ,'710FBE40-8EBD-4FDE-BA99-282501FA809A' ,'0EF047BE-60AD-44B8-A143-95606FED7873'  )
INSERT INTO [dbo].[AssetItemFields]([AssetFieldID]  ,[AssetFieldValue]  ,[AssetSchemaID]  ,[AssetItemID])
VALUES ('E19765AD-A559-40F0-837A-132841CAD972'  ,'Test dataFooter'  ,'710FBE40-8EBD-4FDE-BA99-282501FA809A' ,'0EF047BE-60AD-44B8-A143-95606FED7873'  )
GO
----------------------------------------------
--select * from assetschema
--select * from assetschemafields
--select * from assetfields
--select *  from assetitem
--select * from assetitemfields

------------------------------------------------------------


INSERT INTO [dbo].[ComponentPresentation] ([ID],[ComponentPath] ,[ComponenetName] ,[ViewRenderingPath] ,[ControllerName] ,[ControllerAction] ,[IsViewRender] ,[isControllerRender])
     VALUES    ('2930291B-D6A0-40EA-9860-BE0CC6A2F68B', '/Content/Layout/Component/View/Header' ,'Header'  ,'~/Views/Components/Header.cshtml'   ,'' ,'','1','0')
GO

INSERT INTO [dbo].[ComponentPresentation] ([ID],[ComponentPath] ,[ComponenetName] ,[ViewRenderingPath] ,[ControllerName] ,[ControllerAction] ,[IsViewRender] ,[isControllerRender])
     VALUES    ('E27FB315-707B-4F3D-8C14-6818BAB01CC8','/Content/Layout/Component/View/Footer' ,'Footer'  ,'~/Views/Components/Footer.cshtml'   ,'' ,'','1','0')

     INSERT INTO [dbo].[ComponentPresentation] ([ID],[ComponentPath] ,[ComponenetName] ,[ViewRenderingPath] ,[ControllerName] ,[ControllerAction] ,[IsViewRender] ,[isControllerRender])
     VALUES    ('F7D5F1E9-8B43-46E1-BCDE-3431647AB876','/Content/Layout/Component/View/ContentBody' ,'ContentBody'  ,'~/Views/Components/ContentBody.cshtml'   ,'' ,'','1','0')

     INSERT INTO [dbo].[ComponentPresentation] ([ID],[ComponentPath] ,[ComponenetName] ,[ViewRenderingPath] ,[ControllerName] ,[ControllerAction] ,[IsViewRender] ,[isControllerRender])
     VALUES    ('297CCE15-B7DC-4859-87CD-073DEA87B8E9','/Content/Layout/Component/View/MiddleContent' ,'MiddleContent'  ,'~/Views/Components/MiddleContent.cshtml'   ,'' ,'','1','0')

     INSERT INTO [dbo].[ComponentPresentation] ([ID],[ComponentPath] ,[ComponenetName] ,[ViewRenderingPath] ,[ControllerName] ,[ControllerAction] ,[IsViewRender] ,[isControllerRender])
     VALUES    ('E1DD5279-53AF-4381-83FA-7773BD661E35','/Content/Layout/Component/View/BottomContent' ,'BottomContent'  ,'~/Views/Components/BottomContent.cshtml'   ,'' ,'','1','0')

     INSERT INTO [dbo].[ComponentPresentation] ([ID],[ComponentPath] ,[ComponenetName] ,[ViewRenderingPath] ,[ControllerName] ,[ControllerAction] ,[IsViewRender] ,[isControllerRender])
     VALUES    ('A1156B76-93BD-48BF-8C98-88D188148C6C','/Content/Layout/Component/View/MainNagivation' ,'MainNagivation'  ,'~/Views/Components/MainNagivation.cshtml'   ,'' ,'','1','0')

     --SELECT * from ComponentPresentation

     

     GO

Delete PlaceholderPresentation
INSERT INTO [dbo].[PlaceholderPresentation] ([ID],[PlaceholderName] ,[PlaceholderPath])
     VALUES ('55BA03B9-6780-4FE8-B53C-43AB328315D8'  ,'PLACEHOLDER_FOOTER' ,'/Layout/Placeholder/PLACEHOLDER_FOOTER')
INSERT INTO [dbo].[PlaceholderPresentation] ([ID],[PlaceholderName] ,[PlaceholderPath])
     VALUES ('65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'PLACEHOLDER_CONTENTBODY' ,'//Layout/Placeholder/PLACEHOLDER_CONTENTBODY')
 INSERT INTO [dbo].[PlaceholderPresentation] ([ID],[PlaceholderName] ,[PlaceholderPath])
     VALUES ('CA321B81-28AA-4AEB-9DC8-7FE1B6DD3F7E'  ,'PLACEHOLDER_HEADER' ,'/Layout/Placeholder/PLACEHOLDER_HEADER')
GO


--_______________________

GO
--INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])



INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('85A474C8-5BAA-4D39-BDE4-9822C9BF2884','Header' ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  ,'2930291B-D6A0-40EA-9860-BE0CC6A2F68B'  ,'9AA185C3-CC75-4D64-A335-C51C10FC3A96'  ,'CA321B81-28AA-4AEB-9DC8-7FE1B6DD3F7E'  ,'Header')

INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('556C281E-3437-47D9-92F6-9FE3A58282D9','MiddleContent'  ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  ,'297CCE15-B7DC-4859-87CD-073DEA87B8E9'  ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'MiddleContent')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('00A75A20-D02E-4319-A21B-C1CE6FC6A8D4','MainNagivation'  ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  ,'A1156B76-93BD-48BF-8C98-88D188148C6C'  ,'B6965FB9-B28D-4F4A-942F-1E34A8E24D84'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'MainNagivation')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('E5761175-844C-4C4A-AFE4-1920A76D6D8C','BottomContent'  ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  ,'E1DD5279-53AF-4381-83FA-7773BD661E35'  ,'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'BottomContent')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('1AF94AC1-B0CE-46EC-A32D-823A959EA1D3','Footer'  ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  ,'E27FB315-707B-4F3D-8C14-6818BAB01CC8'  ,'0EF047BE-60AD-44B8-A143-95606FED7873'  ,'55BA03B9-6780-4FE8-B53C-43AB328315D8'  ,'Footer')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('40B334B1-DDE2-4478-9F17-BC56C2A26898','ContentBody'  ,'3941B0BB-F2FD-483A-81EE-C73117F8C1F9'  ,'F7D5F1E9-8B43-46E1-BCDE-3431647AB876'  ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'ContentBody')
GO




INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('A371121F-2073-4A0B-859D-D9A3336203D1','Header' ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  ,'2930291B-D6A0-40EA-9860-BE0CC6A2F68B'  ,'9AA185C3-CC75-4D64-A335-C51C10FC3A96'  ,'CA321B81-28AA-4AEB-9DC8-7FE1B6DD3F7E'   ,'Header')

INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('57CC2CA0-ED8C-4A35-9379-864085A640B8','MiddleContent'  ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  ,'297CCE15-B7DC-4859-87CD-073DEA87B8E9'  ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'MiddleContent')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('957C5F6A-E0A1-4A30-8265-7BC93E6AED04','MainNagivation'  ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  ,'A1156B76-93BD-48BF-8C98-88D188148C6C'  ,'B6965FB9-B28D-4F4A-942F-1E34A8E24D84'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'MainNagivation')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('7674DC3A-FA09-431B-8B6D-1E259B90E52A','BottomContent'  ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  ,'E1DD5279-53AF-4381-83FA-7773BD661E35'  ,'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'BottomContent')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('56BE46B6-721C-4C44-9DF1-C3FD1E8C59D0','Footer'  ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  ,'E27FB315-707B-4F3D-8C14-6818BAB01CC8'  ,'0EF047BE-60AD-44B8-A143-95606FED7873'  ,'55BA03B9-6780-4FE8-B53C-43AB328315D8'  ,'Footer')
GO
INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])
VALUES   ('71B6787A-7689-4AF9-B873-66D2DECDC180','ContentBody'  ,'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D'  ,'F7D5F1E9-8B43-46E1-BCDE-3431647AB876'  ,'AD4A9404-87A3-46FA-94FE-F2978214C328'  ,'65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'ContentBody')
GO

select *  from assetschemafields
select * from assetfields 
select * from assetschema
select *  from pagepresentation 
select * from placeholderpresentation
select * from ComponentPresentation
select * from assetitemfields
select * from assetitem


