USE [TestDCA_V2]
GO

/****** Object:  StoredProcedure [dbo].[dca_curd_publish_queue]    Script Date: 9/18/2026 1:59:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[dca_curd_publish_queue]
    @ID varchar(100)='', 
    @PublishAssetID varchar(100)='',  
	@PublishAssetPath varchar(500)='',
    @PublishAssetPageID varchar(500)='',
    @PublishAssetPagePath varchar(500)='',
    @Query int
AS
BEGIN
  --select * from AssetSchemaFields
if(@Query=1)
BEGIN
    INSERT INTO [dbo].[PublishQueue]
           (
           [PublishAssetID]
           ,[PublishAssetPath]
           ,[PublishAssetPageID]
           ,[PublishAssetPagePath]
           ,[PublishDate ]
         )
     VALUES
           (
           @PublishAssetID, 
           @PublishAssetPath,
            @PublishAssetID, 
           @PublishAssetPath,
             @PublishAssetID
           )
END
if(@Query=2)
    BEGIN
        UPDATE [dbo].[PublishQueue]
         SET 
           [PublishDate ] =  GETDATE()
        WHERE ID= @ID
    END

if(@Query=3)
    BEGIN
           
        DELETE FROM [dbo].[PublishQueue]
            WHERE ID= @ID
    END

 if(@Query=4)
    BEGIN
           
      SELECT [ID]
          ,[PublishAssetID]
          ,[PublishAssetPath]
          ,[PublishDate]
          ,[PublishAssetPageID]
          ,[PublishAssetPagePath]
     FROM [dbo].[PublishQueue]
        where PublishAssetPagePath = @PublishAssetPagePath;
    END


   
        
END;
--exec dca_curd_asset_fields_type @ID = '0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA',     @FieldName='', 	@FieldType ='',  	    @Query =4
GO


