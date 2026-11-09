

--TO ADD LANGUAGE AT ROOT LEVEL 
declare @assetitemid as varchar(100)= '60ECC04F-DFC5-4FB4-8757-C4C0BF57211D' -- assetitem
declare @assetitemidofRootNode as varchar(100)= '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'-- parent item of root node which need to update 

select * from assetitem where id =@assetitemid
select *  from assetschema where id = (select assetitemschemamapped from assetitem where id =@assetitemid)

update assetitem set parentid = @assetitemidofRootNode where id  =@assetitemid
update assetschema set parentid =@assetitemidofRootNode where id =(select id from assetschema where id = (select assetitemschemamapped from assetitem where id =@assetitemid))
select * from assetitem where id =@assetitemid
select *  from assetschema where id = (select assetitemschemamapped from assetitem where id =@assetitemid)

**********
--TO ADD FORM AT ROOT LEVEL 

declare @assetitemid as varchar(100)= 'B983803D-D303-4D48-9F81-CBFF54CA62FC' -- assetitem
declare @assetitemidofRootNode as varchar(100)= '4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE'-- parent item of root node which need to update 

select * from assetitem where id =@assetitemid
select *  from assetschema where id = (select assetitemschemamapped from assetitem where id =@assetitemid)

update assetitem set parentid = @assetitemidofRootNode where id  =@assetitemid
update assetschema set parentid =@assetitemidofRootNode where id =(select id from assetschema where id = (select assetitemschemamapped from assetitem where id =@assetitemid))
select * from assetitem where id =@assetitemid
select *  from assetschema where id = (select assetitemschemamapped from assetitem where id =@assetitemid)