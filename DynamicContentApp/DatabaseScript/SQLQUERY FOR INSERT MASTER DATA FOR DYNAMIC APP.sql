USE [DynamicContent]
GO
---------------------------------
delete  from assetschemafields
delete from assetschema
delete from assetfields
delete from assetitemfields
delete from assetitem
-------------------------------
--AssetSchema]
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


GO
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
select * from assetschema
select * from assetschemafields
select * from assetfields
select *  from assetitem
select * from assetitemfields

------------------------------------------------------------
delete from ComponentPresentation
delete from ComponentPresentation

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

     SELECT * from ComponentPresentation

     ___________________________________________

     GO

Delete PlaceholderPresentation
INSERT INTO [dbo].[PlaceholderPresentation] ([ID],[PlaceholderName] ,[PlaceholderPath])
     VALUES ('55BA03B9-6780-4FE8-B53C-43AB328315D8'  ,'PLACEHOLDER_FOOTER' ,'/Layout/Placeholder/PLACEHOLDER_FOOTER')
INSERT INTO [dbo].[PlaceholderPresentation] ([ID],[PlaceholderName] ,[PlaceholderPath])
     VALUES ('65B806FD-E7CA-4FAB-8E53-D97466ACAE91'  ,'PLACEHOLDER_CONTENTBODY' ,'//Layout/Placeholder/PLACEHOLDER_CONTENTBODY')
 INSERT INTO [dbo].[PlaceholderPresentation] ([ID],[PlaceholderName] ,[PlaceholderPath])
     VALUES ('CA321B81-28AA-4AEB-9DC8-7FE1B6DD3F7E'  ,'PLACEHOLDER_HEADER' ,'/Layout/Placeholder/PLACEHOLDER_HEADER')
GO

SELECT * FROM PlaceholderPresentation

_______________________

GO
--INSERT INTO [dbo].[PagePresentation]([ID] ,[Name],[AssetItemID] ,[ComponentID] ,[ComponentAssetID] ,[PlaceholderID] ,[AssetModelName])

delete PagePresentation

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

select * from PagePresentation


