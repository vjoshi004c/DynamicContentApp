USE [TestDCA_V2]
GO
/****** Object:  StoredProcedure [dbo].[dca_curd_duplicate_item]    Script Date: 10/15/2026 4:01:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[dca_curd_duplicate_item]
    @AssetItemId varchar(100)='', 
    @IsDuplicateSubitems bit = 0 ,
    @Query int
AS
BEGIN
   if(@Query=1)
    BEGIN
           
                    SELECT 
                        assetitemschemamapped as 'ID', 
                        ParentID, 
                        ItemPath, 
                        1 AS HierarchyLevel
                    FROM AssetItem
                    WHERE ParentID = @AssetItemId
               

    END 


if(@Query=2)
    BEGIN
     SET NOCOUNT ON;
    --Declare @AssetItemId as Varchar(500)
	--set @AssetItemId='4B3E4E17-A292-4CCB-8B4D-4EDE467A8B65'
    Declare @AssetItemSchemaMapped as Varchar(500)
   -- set @AssetItemSchemaMapped=(SELECT AssetItemSchemaMapped from ASSETITEM WHERE ID =  @AssetItemId)
    set @AssetItemSchemaMapped=@AssetItemId
    set @AssetItemId= (SELECT ID from ASSETITEM WHERE AssetItemSchemaMapped =  @AssetItemSchemaMapped)

    DECLARE @InsertedIDs TABLE (ID VARCHAR(500));
   -- SELECT AssetItemSchemaMapped from ASSETITEM WHERE ID =  @AssetItemId
   -- SELECT * FROM ASSETITEM WHERE ID =  @AssetItemId
   --SELECT * FROM ASSETSCHEMA WHERE ID = (SELECT AssetItemSchemaMapped from ASSETITEM WHERE ID =  @AssetItemId)
   --OUTPUT inserted.TargetIdentityColumn INTO @InsertedIDs(NewID) -- Captures the IDs
  
            INSERT INTO ASSETSCHEMA 
            (
                [SchemaName] 
               ,[SchemaPath]
               ,[ParentID]
               ,[AssetTypeID]
               ,[FieldDataSourceID]
               ,[FieldDataSourcePath]
            )
            OUTPUT INSERTED.ID INTO @InsertedIDs
            SELECT  
                [SchemaName]+'_Copy'
               ,[SchemaPath]
               ,[ParentID]
               ,[AssetTypeID]
               ,[FieldDataSourceID]
               ,[FieldDataSourcePath]
            FROM 
                ASSETSCHEMA
             WHERE 
                ID =  @AssetItemSchemaMapped;

              Declare @AssetSchemaNewInsertdID as Varchar(500)
              SET @AssetSchemaNewInsertdID= (SELECT ID FROM @InsertedIDs);

           

        DECLARE @InsertedAssetItemIDs TABLE (ID VARCHAR(500));
            INSERT INTO [dbo].[AssetItem]
                   (
                   [ItemName]
                   ,[ItemPath]
                   ,[SchemaID]
                   ,[IsPageItem]
                   ,[MasterPageLayoutPath]
                   ,[ParentID]
                   ,[AssetType]
                   ,[AssetItemSchemaMapped])
            OUTPUT INSERTED.ID INTO @InsertedAssetItemIDs
            SELECT  
                [ItemName]+'_Copy'
               ,[ItemPath]+'_Copy'
               ,[SchemaID]
               ,[IsPageItem]
               ,[MasterPageLayoutPath]
               ,[ParentID]
               ,[AssetType]
               ,@AssetSchemaNewInsertdID
            FROM 
                AssetItem
             WHERE 
                ID =  @AssetItemId;

            --SELECT * FROM assetitem WHERE id = 'C4DEB6F3-C7B9-4C39-A6BC-5BB94F217950'
             Declare @AssetItemNewInsertdID as Varchar(500)
              SET @AssetItemNewInsertdID= (SELECT ID FROM @InsertedAssetItemIDs);
               --SELECT * FROM ASSETitem WHERE ID =@AssetItemNewInsertdID

               INSERT INTO [dbo].[AssetItemFields]
                   (
                   [AssetFieldID]
                   ,[AssetFieldValue]
                   ,[AssetSchemaID]
                   ,[AssetItemID]
                   )
                SELECT  
                    [AssetFieldID]
                    ,[AssetFieldValue]
                    ,[AssetSchemaID]
                    ,@AssetItemNewInsertdID
                FROM 
                    assetitemfields
                WHERE 
                    AssetItemId =  @AssetItemId;

                INSERT INTO [dbo].[ComponentPresentation]
                   (
                   [AssetItemID]
                   ,[ComponentPath]
                   ,[LinkedAssetItem]
                   ,[PlaceholderPath]
                   )
                   SELECT  
                       @AssetItemNewInsertdID
                       ,[ComponentPath]
                       ,[LinkedAssetItem]
                       ,[PlaceholderPath]
                   FROM 
                        componentpresentation
                   WHERE 
                        AssetItemId =  @AssetItemId;
    END  
END

--dca_curd_duplicate_item  @AssetItemId = '4B3E4E17-A292-4CCB-8B4D-4EDE467A8B65',     @IsDuplicateSubitems=0, 	    @Query =2

  --select * from AssetSchemaFields
--if(@Query=1)
--    BEGIN
--            select * from AssetSchemaFields
--    end 
--END
--begin tran
--DELETE FROM ASSETSCHEMA WHERE  SCHEMANAME = 'test22' and id !='84D11312-FEFE-46CB-ADA5-B165E3A7163D' 
--rollback tran
--if(@Query=2)
--    BEGIN
--       select * from AssetSchemaFields
--    END 
  --select * from assetitem where id = '2F8B68E6-8991-41AE-A234-04BD7CDFBB33' --2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5
             --  select * from assetitemfields where assetitemid = '2F8B68E6-8991-41AE-A234-04BD7CDFBB33'
             --  select * from componentpresentation where assetitemid = '2F8B68E6-8991-41AE-A234-04BD7CDFBB33'
              -- 3. Retrieve or use the generated IDs
            -- Declare @AssetSchemaNewInsertdID as Varchar(500)='abc'
           --SET @AssetSchemaNewInsertdID= (SELECT NewID FROM @InsertedIDs);
           --SET @AssetSchemaNewInsertdID = CAST(SCOPE_IDENTITY() AS VARCHAR(500)); 
       -- PRINT 'The status of the employee is: ' + @AssetSchemaNewInsertdID;

    --     IF @AssetSchemaNewInsertdID IS NULL
    --BEGIN
    --    PRINT 'Failed to capture identity. SCOPE_IDENTITY() returned NULL.';
    --END
    --ELSE
    --BEGIN
    --    PRINT 'Success! New Identity ID: ' + CAST(@AssetSchemaNewInsertdID AS VARCHAR(10));
    --END


           -- SELECT * FROM ASSETSCHEMA WHERE ID ='4B3E4E17-A292-4CCB-8B4D-4EDE467A8B65'

         -- SELECT * FROM ASSETSCHEMA WHERE   schemaname like '%test22%'

        -- SELECT * from ASSETITEM WHERE AssetItemSchemaMapped =  'B0FF6956-9FD7-4E77-B917-E96A9423953C'


