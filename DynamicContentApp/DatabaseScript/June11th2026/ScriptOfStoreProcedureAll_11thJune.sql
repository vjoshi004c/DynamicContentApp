USE [TestPFP]
GO
/****** Object:  StoredProcedure [dbo].[dca_curd_asset_fields_type]    Script Date: 6/17/2026 3:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_curd_asset_fields_type]
    @ID varchar(500)='', 
    @FieldName varchar(500), 
	@FieldType varchar(500),
    @Query int
AS
BEGIN
  --select * from AssetSchemaFields
if(@Query=1)
BEGIN
    INSERT INTO [dbo].[AssetFieldsType]
           (
           [FieldName]
           ,[FieldType]
         )
     VALUES
           (
           @FieldName, 
           @FieldType
           )
END
if(@Query=2)
    BEGIN
        UPDATE [dbo].[AssetFieldsType]
         SET 
           [FieldName] =  @FieldName,
            --[FieldData] =  @FieldData,
            [FieldType] = @FieldType
        WHERE ID= @ID
    END

if(@Query=3)
    BEGIN
           
        DELETE FROM [dbo].[AssetFieldsType]
            WHERE ID= @ID
    END

if(@Query=4)
    BEGIN
           
      SELECT  [ID]
      ,[FieldName]
      ,[FieldType]
     
      FROM 
        [dbo].[AssetFieldsType]

       WHERE ID= @ID
    END
    if(@Query=5)
    BEGIN
           
      SELECT  [ID]
      ,[FieldName]
      ,[FieldType]
     
      FROM 
       [dbo].[AssetFieldsType]

            Order BY [FieldType]
    END

   
   
        
END;
--exec dca_curd_asset_fields_type @ID = '0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA',     @FieldName='', 	@FieldType ='',  	    @Query =4
GO
/****** Object:  StoredProcedure [dbo].[dca_curd_asset_item_master]    Script Date: 6/17/2026 3:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_curd_asset_item_master]
	@ID varchar(500)= '',
    @ItemName varchar(500), 
	@ItemPath varchar(500)='', 
	@SchemaID  varchar(500),
    @IsPageItem varchar(500)=0,
    @MasterPageLayoutPath  varchar(500)= '',
    @ParentID varchar(500),
    @AssetType varchar(500),
    @AssetItemSchemaMapped varchar(500)='',
    @Query int

AS
BEGIN
  --select * from AssetSchema
if(@Query=1)
BEGIN
    INSERT INTO [dbo].[AssetItem]
           (
           [ItemName]
           ,[ItemPath]
           ,[SchemaID]
           ,[IsPageItem]
           ,[MasterPageLayoutPath]
           ,[ParentID]
           ,[AssetItemSchemaMapped]
           ,[AssetType])
     VALUES
           (
           @ItemName
           ,@ItemPath
           ,@SchemaID
           ,@IsPageItem
           ,@MasterPageLayoutPath
           ,@ParentID
           ,@AssetItemSchemaMapped
           ,@AssetType)
END
        if(@Query=2)

        IF EXISTS (SELECT * FROM  [AssetItem] where ID = @ID)
            BEGIN
                UPDATE [dbo].[AssetItem]
           SET 
              [ItemName] =  @ItemName,
              [ItemPath] = @ItemPath,
              [SchemaID] = @SchemaID,
              [IsPageItem] = @IsPageItem, 
              [MasterPageLayoutPath] = @MasterPageLayoutPath,
              [ParentID] = @ParentID, 
                [AssetType] = @AssetType

                WHERE [ID] = @ID

            END
            else
            Begin
                         INSERT INTO [dbo].[AssetItem]
                       (
                       [ItemName]
                       ,[ItemPath]
                       ,[SchemaID]
                       ,[IsPageItem]
                       ,[MasterPageLayoutPath]
                       ,[ParentID]
                       ,[AssetType])
                 VALUES
                       (
                       @ItemName
                       ,@ItemPath
                       ,@SchemaID
                       ,@IsPageItem
                       ,@MasterPageLayoutPath
                       ,@ParentID
                       ,@AssetType)

            END 

        if(@Query=3)
            BEGIN
                    DELETE FROM [dbo].[AssetItem]
                WHERE [ID] = @ID

            END
   
           if(@Query=4)
            BEGIN
                    SELECT [ID]
              ,[ItemName]
              ,[ItemPath]
              ,[SchemaID]
              ,[IsPageItem]
              ,[MasterPageLayoutPath]
              ,[ParentID]
              ,[AssetType]
                    FROM [dbo].[AssetItem]
                     WHERE [ID] = @ID
                

            END
        
END;
GO
/****** Object:  StoredProcedure [dbo].[dca_curd_asset_schema]    Script Date: 6/17/2026 3:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_curd_asset_schema]
	@ID varchar(500)= '',
    @SchemaName varchar(500), 
	@SchemaPath varchar(500)='', 
	@ParentID  varchar(500),
    @AssetTypeID varchar(500),
    @Query int

AS
BEGIN
  --select * from AssetSchema
if(@Query=1)
BEGIN
DECLARE @InsertedIDs TABLE (ID varchar(500));
    INSERT INTO [dbo].[AssetSchema]
           (
           [SchemaName]
           ,[SchemaPath]
           ,[AssetTypeID]
           ,[ParentID])
     OUTPUT INSERTED.ID INTO @InsertedIDs
     VALUES
           (
           @SchemaName,
           @SchemaPath,
           @AssetTypeID,
           @ParentID);

      SELECT ID FROM @InsertedIDs;
     --SELECT SCOPE_IDENTITY();
END
if(@Query=2)
    BEGIN
        UPDATE [dbo].[AssetSchema]
         SET 
            [SchemaName] =  @SchemaName,
            [SchemaPath] =  @SchemaPath,
            [AssetTypeID]=  @AssetTypeID,
            [ParentID] = [ParentID]
        WHERE ID= @ID
    END

if(@Query=3)
    BEGIN
            DELETE FROM [dbo].[AssetSchema]
            WHERE ID= @ID

    END
   
   if(@Query=4)
    BEGIN


        DECLARE @ParentIDOfSchema Varchar(500);
        set @ParentIDOfSchema= (SELECT  [ParentID] FROM [dbo].[AssetSchema]  WHERE ID= @ID);
        if exists(
            Select  * from assetschema ass 
            inner join assetitem aii
            on ass.id= aii.SchemaID
            and 
            ass.ParentID = aii.ParentID
            and 
            ass.parentid =@ParentIDOfSchema
            and ass.id =@ID )

           BEGIN 
                 Select 
             aii.ID as ID,
             aii.itemname  AS SchemaName, 
             aii.ItemPath AS SchemaPath ,
             aii.parentid AS parentID, 
             aii.assettype AS AssetTypeID ,
             aii.SchemaID as AssetItemSchema
 
             from assetschema ass 
             inner join assetitem aii
             on ass.id= aii.SchemaID
             and 
             ass.ParentID = aii.ParentID
             and 
             ass.parentid =@ParentIDOfSchema
             and ass.id =@ID;


                WITH BreadcrumbCTE AS (
                SELECT 
                    ID, 
                    SchemaName, 
                   ParentID, 
                    1 AS [Level] -- Track depth
                FROM AssetSchema
                WHERE ID = @ID

                UNION ALL
                SELECT 
                    c.ID, 
                    c.SchemaName, 
                    c.ParentID, 
                    b.[Level] + 1 AS [Level]
                FROM AssetSchema c
                INNER JOIN BreadcrumbCTE b ON c.ID = b.ParentID
  
                )
                SELECT ID, SchemaName, ParentID,Level
                FROM BreadcrumbCTE
                ORDER BY [Level] desc
           
            END  
            ELSE 
            BEGIN 
                SELECT [ID] as ID
                     ,[SchemaName] AS SchemaName
                    ,[SchemaPath] AS SchemaPath 
                    ,[AssetTypeID]AS AssetTypeID
                     ,[ParentID] AS parentID
                     ,'' as AssetItemSchema
                    FROM [dbo].[AssetSchema]
                WHERE ID=@ID;
                WITH BreadcrumbCTE AS (
                SELECT 
                    ID, 
                    SchemaName, 
                   ParentID, 
                    1 AS [Level] -- Track depth
                FROM AssetSchema
                WHERE ID = @ID

                UNION ALL
                SELECT 
                    c.ID, 
                    c.SchemaName, 
                    c.ParentID, 
                    b.[Level] + 1 AS [Level]
                FROM AssetSchema c
                INNER JOIN BreadcrumbCTE b ON c.ID = b.ParentID
  
                )
                SELECT ID, SchemaName, ParentID,Level
                FROM BreadcrumbCTE
                ORDER BY [Level] desc
            END   

    END
        
END;

--select * from AssetSchema where parentid ='D1B2BE76-C76B-447A-A30A-DDDF4959A8FC'
--exec [dbo].[dca_curd_asset_schema]	@ID='',    @SchemaName='test4000', 	@SchemaPath ='', 	@ParentID  ='D1B2BE76-C76B-447A-A30A-DDDF4959A8FC',    @AssetTypeID ='0101616E-6830-4C65-95E1-1E72F2C6D222',    @Query =1

GO
/****** Object:  StoredProcedure [dbo].[dca_curd_asset_schema_fields]    Script Date: 6/17/2026 3:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_curd_asset_schema_fields]
	@ID varchar(500)= '',
    @SchemaID varchar(500), 
	@FieldTypeID varchar(500), 
	--@FieldData  varchar(500)='',
    @FieldName  varchar(500),
    @Query int
AS
BEGIN
  --select * from AssetSchemaFields
if(@Query=1)
BEGIN
    INSERT INTO [dbo].[AssetSchemaFields]
           (
           [SchemaID]
           ,[FieldTypeID]
          -- ,[FieldData]
           ,[FieldName])
     VALUES
           (
           @SchemaID, 
           @FieldTypeID,
          -- @FieldData, 
           @FieldName )
END
if(@Query=2)
    BEGIN
        UPDATE [dbo].[AssetSchemaFields]
         SET 
            [FieldTypeID] =  @FieldTypeID,
            --[FieldData] =  @FieldData,
            [FieldName] = @FieldName
        WHERE ID= @ID
    END

if(@Query=3)
    BEGIN
           
        DELETE FROM [dbo].[AssetSchemaFields]
            WHERE ID= @ID
    END

    if(@Query=4)
    BEGIN
           
      SELECT TOP (1000) [ID]
      ,[SchemaID]
      ,[FieldTypeID]
     -- ,[FieldData]
      ,[FieldName]
  FROM [TestPFP].[dbo].[AssetSchemaFields]

            WHERE ID= @ID
    END
   
   
        
END;

--exec dca_curd_asset_schema_fields @ID = '0183C8A4-A2A0-4F34-A180-C245C03771CA',    @SchemaID='', 	@FieldTypeID ='',  	@FieldData  ='',     @FieldName ='',     @Query =4
--exec dca_curd_asset_schema_fields @ID = '0183C8A4-A2A0-4F34-A180-C245C03771CA',    @SchemaID='710FBE40-8EBD-4FDE-BA99-282501FA809A', 	@FieldTypeID ='1E0C6229-01D2-45E5-8A66-65F2964DDD8F',  	@FieldData  ='Test of Footer SingleText second',     @FieldName ='Title',     @Query =2
--exec dca_curd_asset_schema_fields @ID = '',  @SchemaID='710FBE40-8EBD-4FDE-BA99-282501FA809A', 	@FieldTypeID ='1E0C6229-01D2-45E5-8A66-65F2964DDD8F',  	@FieldData  ='Test of Footer SingleText forth',     @FieldName ='Title',     @Query =1
--exec dca_curd_asset_schema_fields @ID = 'A3FD697A-010F-415F-9974-08FE96DAFDDB',    @SchemaID='710FBE40-8EBD-4FDE-BA99-282501FA809A', 	@FieldTypeID ='1E0C6229-01D2-45E5-8A66-65F2964DDD8F',  	@FieldData  ='Test of Footer SingleText forth',     @FieldName ='Title',     @Query =3
--select * from AssetSchemaFields where schemaid = '710FBE40-8EBD-4FDE-BA99-282501FA809A'
--select * from AssetSchemaFields where id = '0183C8A4-A2A0-4F34-A180-C245C03771CA'
GO
/****** Object:  StoredProcedure [dbo].[dca_curd_AssetFields]    Script Date: 6/17/2026 3:33:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[dca_curd_AssetFields]
	@ID varchar(500)= '',
    @FieldName varchar(500), 
	@FieldType varchar(500), 
    @Query int
AS
BEGIN
  --select * from AssetSchemaFields
if(@Query=1)
BEGIN
    INSERT INTO [dbo].[AssetFields]
           (
           [FieldName],
           [FieldType])
     VALUES
           (
          @FieldName,
           @FieldType
           )
END
if(@Query=2)
    BEGIN
        UPDATE [dbo].[AssetFields]
   SET 
      [FieldName] = @FieldName,
      [FieldType] = @FieldType
        WHERE ID= @ID
    END

if(@Query=3)
    BEGIN
           
       DELETE FROM [dbo].[AssetFields]
            WHERE ID= @ID
    END

    if(@Query=4)
    BEGIN
           
     SELECT [ID]
      ,[FieldName]
      ,[FieldType]
  FROM [dbo].[AssetFields]
            
    END
   
   
        
END;

--EXEC dca_curd_AssetFields  @ID = '0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA',    @FieldName ='', 	@FieldType ='',     @Query =4

--SELECT * FROM AssetFields




GO
/****** Object:  StoredProcedure [dbo].[dca_get_contenttree_item]    Script Date: 6/17/2026 3:33:28 PM ******/
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
            ORDER BY  ass.SchemaName
            --) as newschema
            --on ID= newschema.ChildSchemaID
            --group by newschema.ParentSchemaID, newschema.ParentSchemaName, newschema.ChildSchemaID, newschema.ChildSchemaName
    END

-- EXEC dca_get_contenttree_item @SchemaID ='4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'

--EXEC dca_get_contenttree_item 


--select count(*) from assetschema where ParentID in ('1049D17E-6C1C-45A9-9B75-5F779B61023E',
--'111035FA-612A-4EB5-9CBC-8DF91E9152A3',
--'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC',
--'DC30B818-0EF8-4BF9-84E2-812EC508A483')
GO
/****** Object:  StoredProcedure [dbo].[dca_get_page_content]    Script Date: 6/17/2026 3:33:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[dca_get_schema]    Script Date: 6/17/2026 3:33:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[dca_insert_asset_item]    Script Date: 6/17/2026 3:33:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[dca_insert_asset_item_fields]    Script Date: 6/17/2026 3:33:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[dca_insert_page_content]    Script Date: 6/17/2026 3:33:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[dca_update_page_content]    Script Date: 6/17/2026 3:33:28 PM ******/
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
