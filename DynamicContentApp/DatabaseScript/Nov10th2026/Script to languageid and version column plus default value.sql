
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