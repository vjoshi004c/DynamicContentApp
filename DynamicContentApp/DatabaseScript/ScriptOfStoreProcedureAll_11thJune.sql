USE [TestPFP]
GO
/****** Object:  StoredProcedure [dbo].[dca_get_contenttree_item]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_get_contenttree_item]
	@SchemaID  VARCHAR(100) = ''
	
AS




if( @SchemaID ='')
BEGIN
  SELECT * 
            FROM [AssetSchema] ASP 
            where asp.ParentID IS NULL
		
END
ELSE
    BEGIN 
   -- select count(*) from [AssetSchema] 
     --select count(*) as ChildChildCount, newschema.ParentSchemaID, newschema.ParentSchemaName, newschema.ChildSchemaID, newschema.ChildSchemaName  from [AssetSchema] 
     --inner join 
    -- (
		  SELECT 
            asp.SchemaName  AS ParentSchemaName,
            asp.ID AS ParentSchemaID,
            ass.SchemaName AS ChildSchemaName, 
            ass.id AS ChildSchemaID
           
           
        FROM 
        [AssetSchema] asp
        Inner JOIN 
    [AssetSchema] ass ON asp.ID = ass.ParentID
            where asp.id = @SchemaID
            --) as newschema
            --on ID= newschema.ChildSchemaID
            --group by newschema.ParentSchemaID, newschema.ParentSchemaName, newschema.ChildSchemaID, newschema.ChildSchemaName
    END

-- EXEC dca_get_contenttree_item @SchemaID ='4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'

--EXEC dca_get_contenttree_item


select count(*) from assetschema where ParentID in ('1049D17E-6C1C-45A9-9B75-5F779B61023E',
'111035FA-612A-4EB5-9CBC-8DF91E9152A3',
'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC',
'DC30B818-0EF8-4BF9-84E2-812EC508A483')
GO
/****** Object:  StoredProcedure [dbo].[dca_get_page_content]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_get_page_content]
	@PageUrl  varchar(500) 
	

AS
BEGIN

		SELECT 
                PageUrl,
				PageContent

	            FROM 
	                 dbo.PageContent  
					 WHERE   PageUrl = @PageUrl	
END;
GO
/****** Object:  StoredProcedure [dbo].[dca_get_schema]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_get_schema]
	@SchemaID  VARCHAR(100) = NULL
	

AS

if( @SchemaID!= NULL)
BEGIN
		select asf.SchemaID  , asa.SchemaName, asa.SchemaPath, asf.FieldID, af.FieldName, af.FieldType
		from AssetSchema asa 
		inner join AssetSchemaFields  asf 
		on asa.ID = asf.SchemaID
		inner join AssetFields af 
		on asf.FieldID= af.ID
		where asa.id= @SchemaID 
END
else 
BEGIN 
		select asf.SchemaID  , asa.SchemaName, asa.SchemaPath, asf.FieldID, af.FieldName, af.FieldType
		from AssetSchema asa 
		inner join AssetSchemaFields  asf 
		on asa.ID = asf.SchemaID
		inner join AssetFields af 
		on asf.FieldID= af.ID
		order by asa.SchemaName
END

-- EXEC dca_get_schema @SchemaID ='74826E3E-C2EA-45DC-A328-43F115F45161'
--EXEC dca_get_schema 
GO
/****** Object:  StoredProcedure [dbo].[dca_insert_asset_item]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_insert_asset_item]
	@ItemName  varchar(200), 
	@ItemPath varchar(200), 
	@SchemaID  varchar(200),
	@IsPageItem bit = 0,
	@MasterPageLayoutPath  varchar(200) =''

AS

  if(@IsPageItem = 0)
  Begin 
       INSERT INTO dbo.AssetItem (
           
	            ItemName ,
	            ItemPath ,
				SchemaID,
				 IsPageItem,
				MasterPageLayoutPath
	            
        )
        VALUES (
           @ItemName  ,
			 @ItemPath,
				@SchemaID,
				0,
				''
			 )
   
        
END
ELSE
BEGIN 
 INSERT INTO dbo.AssetItem (
           
	            ItemName ,
	            ItemPath ,
				SchemaID,
				IsPageItem,
				MasterPageLayoutPath
	           
	            
        )
        VALUES (
           @ItemName  ,
			 @ItemPath,
				@SchemaID,
				@IsPageItem,
				@MasterPageLayoutPath
			 )
END

/* 
Delete from AssetItem
select * from AssetItem
exec dca_insert_asset_item  @ItemName='FirstAssetItem' , @ItemPath='/Content/MySite/Data/FirstAssetItem', @SchemaID='E9E34FBE-0F61-4B16-BA71-E938365FBA61', @IsPageItem=1,@MasterPageLayoutPath= '/Content/Layout/FirstMaster'
exec dca_insert_asset_item  @ItemName='BottomContent' , @ItemPath='/Content/MySite/Data/BottomContent', @SchemaID='608AD90B-52F0-451A-8FE8-DB284ED0E3E4', @IsPageItem=0,@MasterPageLayoutPath= ''
exec dca_insert_asset_item  @ItemName='Header' , @ItemPath='/Content/MySite/Data/Header', @SchemaID='710FBE40-8EBD-4FDE-BA99-282501FA809A', @IsPageItem=0,@MasterPageLayoutPath= ''
exec dca_insert_asset_item  @ItemName='MainNagivation' , @ItemPath='/Content/MySite/Data/MainNagivation', @SchemaID='A23BE558-72E9-4326-B2C7-BC5C99F38B34', @IsPageItem=0,@MasterPageLayoutPath= ''
exec dca_insert_asset_item  @ItemName='SecondAssetItem' , @ItemPath='/Content/MySite/Data/SecondAssetItem', @SchemaID='EB60F493-F53B-4388-B17E-B3D1A3A0456E', @IsPageItem=1,@MasterPageLayoutPath= '/Content/Layout/SecondMaster'
exec dca_insert_asset_item  @ItemName='TopContent' , @ItemPath='/Content/MySite/Data/TopContent', @SchemaID='A6676449-07F1-4DEA-B456-6D4BE646E351', @IsPageItem=0,@MasterPageLayoutPath= ''
exec dca_insert_asset_item  @ItemName='Footer' , @ItemPath='/Content/MySite/Data/Footer', @SchemaID='608AD90B-52F0-451A-8FE8-DB284ED0E3E4', @IsPageItem=0,@MasterPageLayoutPath= ''
exec dca_insert_asset_item  @ItemName='MiddleContent' , @ItemPath='/Content/MySite/Data/MiddleContent', @SchemaID='74826E3E-C2EA-45DC-A328-43F115F45161', @IsPageItem=0,@MasterPageLayoutPath= ''

select * from AssetItem

*/
GO
/****** Object:  StoredProcedure [dbo].[dca_insert_asset_item_fields]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_insert_asset_item_fields]
	@AssetFieldID varchar(200), 
	@AssetFieldValue varchar(200), 
	@AssetSchemaID  varchar(200)

AS
BEGIN
  
       INSERT INTO dbo.AssetItemFields (
           
	            AssetFieldID ,
	            AssetFieldValue ,
				AssetSchemaID
	           
	            
        )
        VALUES (
           @AssetFieldID  ,
			 @AssetFieldValue,
				@AssetSchemaID
			 )
   
        
END;
GO
/****** Object:  StoredProcedure [dbo].[dca_insert_page_content]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_insert_page_content]
	@PageUrl  varchar(500), 
	@PageContent nvarchar(MAX)

AS
BEGIN
  
       INSERT INTO dbo.PageContent (
           
	            PageUrl ,
	            PageContent ,
				PageUpdatedDate
	           
	            
        )
        VALUES (
            @PageUrl ,
	          @PageContent,
			  GetDate()
   
        ); 
END;
GO
/****** Object:  StoredProcedure [dbo].[dca_update_page_content]    Script Date: 6/11/2026 9:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_update_page_content]
	@PageUrl  varchar(500), 
	@PageContent nvarchar(MAX)

AS
BEGIN

		UPDATE dbo.PageContent 
        SET
				PageContent= @PageContent ,
				PageUpdatedDate= GetDate()
        WHERE   PageUrl = @PageUrl
				
END;

-- EXEC  dca_update_page_content 'http://localhost:5287/product/index?id=2',  'tEST HTML '
-- SELECT *  FROM [TestPFP].[dbo].[PageContent]

  --DELETE FROM PageContent
GO
