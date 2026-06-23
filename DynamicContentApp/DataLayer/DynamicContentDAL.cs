using DynamicContentApp.Models;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynamicContentApp.DataLayer
{
 
     public class DynamicContentDAL
    {

        private string ConnenctionString = "Data Source=SQL1026;Initial Catalog=TestPFP;TrustServerCertificate=True;User ID=sa;Password=Wstinol1";

        // private string ConnenctionString = "Data Source=manyapc;Initial Catalog=DynamicContent;TrustServerCertificate=True;User ID=sa;Password=vpm031207";
        //private string ConnenctionString = "Data Source=manyapc;Initial Catalog=DynamicContentThird;TrustServerCertificate=True;User ID=sa;Password=vpm031207";


        public bool InsertAssetItemSchema(string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID, string AssetItemSchema, string AssetItemSchemaMapped)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_item_master", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", "");
                cmd.Parameters.AddWithValue("@ItemName", SchemaName);
                cmd.Parameters.AddWithValue("@ItemPath", SchemaPath);
                cmd.Parameters.AddWithValue("@IsPageItem", 0);
                cmd.Parameters.AddWithValue("@SchemaID", AssetItemSchema);
                cmd.Parameters.AddWithValue("@MasterPageLayoutPath", "");
                cmd.Parameters.AddWithValue("@ParentID", SchemaParent);
                cmd.Parameters.AddWithValue("@AssetType", AssetTypeID);
                cmd.Parameters.AddWithValue("@AssetItemSchemaMapped", AssetItemSchemaMapped);
                cmd.Parameters.AddWithValue("@Query", 1);

                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        public string InsertSchema(string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID)
        {
            SqlConnection con = null;
            //string result = "";
            string newId = string.Empty;
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", "");
                cmd.Parameters.AddWithValue("@SchemaName", SchemaName);
                cmd.Parameters.AddWithValue("@SchemaPath", SchemaPath);
                cmd.Parameters.AddWithValue("@ParentID", SchemaParent);
                cmd.Parameters.AddWithValue("@AssetTypeID", AssetTypeID);
                cmd.Parameters.AddWithValue("@Query", 1);

                con.Open();

               // cmd.ExecuteScalar();
                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                      newId = Convert.ToString(result);
                    //Console.WriteLine($"Newly Inserted ID: {newId}");
                }
                // result = cmd.ExecuteScalar().ToString();
                return newId;
            }
            catch (Exception ex)
            {
                return string.Empty; 
            }
            finally
            {
                con.Close();
            }
        }
        public bool InsertSchemaField(string SchemaID, string SchemaName, string SchemaFieldType)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema_fields", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", "");
                cmd.Parameters.AddWithValue("@SchemaID", SchemaID);
                cmd.Parameters.AddWithValue("@FieldTypeID", SchemaFieldType);
                cmd.Parameters.AddWithValue("@FieldName", SchemaName);
                cmd.Parameters.AddWithValue("@Query", 1);

                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }
        public bool UpdateSchema(string SchemaID, string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", SchemaID);
                cmd.Parameters.AddWithValue("@SchemaName", SchemaName);
                cmd.Parameters.AddWithValue("@SchemaPath", SchemaPath);
                cmd.Parameters.AddWithValue("@ParentID", SchemaParent);
                cmd.Parameters.AddWithValue("@AssetTypeID", AssetTypeID);
                cmd.Parameters.AddWithValue("@Query", 2);

                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        public bool UpdateAssetItemSchema(string SchemaID, string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID, string AssetItemSchema, string AssetItemSchemaMapped)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_item_master", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", SchemaID);
                cmd.Parameters.AddWithValue("@ItemName", SchemaName);
                cmd.Parameters.AddWithValue("@ItemPath", SchemaPath);
                cmd.Parameters.AddWithValue("@IsPageItem", 0);
                cmd.Parameters.AddWithValue("@SchemaID", AssetItemSchema);
                cmd.Parameters.AddWithValue("@MasterPageLayoutPath", "");
                cmd.Parameters.AddWithValue("@ParentID", SchemaParent);
                cmd.Parameters.AddWithValue("@AssetType", AssetTypeID);
                cmd.Parameters.AddWithValue("@AssetItemSchemaMapped", AssetItemSchemaMapped);
                cmd.Parameters.AddWithValue("@Query", 2);

 
                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }
        public SchemaDeleteModel DeleteAssetItemSchema(string SchemaID)
        {
            SqlConnection con = null;
            SchemaDeleteModel SchemaDeleteModel = new SchemaDeleteModel();
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_item_master", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", SchemaID);
                cmd.Parameters.AddWithValue("@ItemName", "");
                cmd.Parameters.AddWithValue("@ItemPath", "");
                cmd.Parameters.AddWithValue("@IsPageItem", 0);
                cmd.Parameters.AddWithValue("@SchemaID", "");
                cmd.Parameters.AddWithValue("@MasterPageLayoutPath", "");
                cmd.Parameters.AddWithValue("@ParentID", "");
                cmd.Parameters.AddWithValue("@AssetType", "");
                cmd.Parameters.AddWithValue("@Query", 3);

                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                SchemaDeleteModel.Error = string.Empty;
                SchemaDeleteModel.Status = true;
                SchemaDeleteModel.Message = "Schema has been deleted successfully";
                return SchemaDeleteModel;
            }
            catch (Exception ex)
            {
                SchemaDeleteModel.Error = ex.Message.ToString();
                SchemaDeleteModel.Status = false;
                SchemaDeleteModel.Message = "Opps! Error while deleting schema.";
                return SchemaDeleteModel;
            }
            finally
            {
                con.Close();
            }
        }

        public SchemaDeleteModel DeleteSchema(string SchemaID)
        {
            SqlConnection con = null;
            SchemaDeleteModel SchemaDeleteModel = new SchemaDeleteModel();
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", SchemaID);
                cmd.Parameters.AddWithValue("@SchemaName", "");
                cmd.Parameters.AddWithValue("@SchemaPath", "");
                cmd.Parameters.AddWithValue("@ParentID", "");
                cmd.Parameters.AddWithValue("@AssetTypeID", "");
                cmd.Parameters.AddWithValue("@Query", 3);

                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                SchemaDeleteModel.Error = string.Empty;
                SchemaDeleteModel.Status = true;
                SchemaDeleteModel.Message = "Schema has been deleted successfully";
                return SchemaDeleteModel;
            }
            catch (Exception ex)
            {
                SchemaDeleteModel.Error = ex.Message.ToString();
                SchemaDeleteModel.Status = false;
                SchemaDeleteModel.Message = "Opps! Error while deleting schema.";
                return SchemaDeleteModel;
            }
            finally
            {
                con.Close();
            }
        }



        public List<SchemaFieldType> GetFieldType()
        {


            SqlConnection con = null;
            DataSet ds = null;
            List<SchemaFieldType> custlist = null;
            try
            {
                custlist = new List<SchemaFieldType>();
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_fields_type", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", "");
                cmd.Parameters.AddWithValue("@FieldName", "");
                cmd.Parameters.AddWithValue("@FieldType", "");
                cmd.Parameters.AddWithValue("@Query", 5);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    SchemaFieldType cobj = new SchemaFieldType();
                    cobj.ID = ds.Tables[0].Rows[i]["ID"].ToString();
                    cobj.FieldName = ds.Tables[0].Rows[i]["FieldName"].ToString();
                    cobj.FieldType = ds.Tables[0].Rows[i]["FieldType"].ToString();
                    custlist.Add(cobj);
                }

                return custlist;

            }
            catch (Exception ex)
            {

                return custlist;
            }
            finally
            {
                con.Close();
            }
        }
        
        public List<ContentItemModel> GetAssetItemSchema(string SchemaID)
        {


            SqlConnection con = null;
            DataSet ds = null;
            List<ContentItemModel> custlist = null;
            try
            {
                custlist = new List<ContentItemModel>();
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", SchemaID);
                cmd.Parameters.AddWithValue("@ItemName", "");
                cmd.Parameters.AddWithValue("@ItemPath", "");
                cmd.Parameters.AddWithValue("@IsPageItem", 0);
                cmd.Parameters.AddWithValue("@SchemaID", "");
                cmd.Parameters.AddWithValue("@MasterPageLayoutPath", "");
                cmd.Parameters.AddWithValue("@ParentID", "");
                cmd.Parameters.AddWithValue("@AssetType", "");
                cmd.Parameters.AddWithValue("@Query", 4);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ContentItemModel cobj = new ContentItemModel();
                    cobj.ID = ds.Tables[0].Rows[i]["ID"].ToString();
                    cobj.SchemaName = ds.Tables[0].Rows[i]["ItemName"].ToString();
                     cobj.SchemaPath = ds.Tables[0].Rows[i]["ItemPath"].ToString();
                    cobj.ParentID = ds.Tables[0].Rows[i]["ParentID"].ToString();
                    cobj.IsPageItem = Convert.ToBoolean(ds.Tables[0].Rows[i]["IsPageItem"].ToString());
                    cobj.SchemaID = ds.Tables[0].Rows[i]["SchemaID"].ToString();
                    cobj.MasterPageLayoutPathaPath = ds.Tables[0].Rows[i]["MasterPageLayoutPath"].ToString();
                    cobj.AssetTypeID = ds.Tables[0].Rows[i]["AssetType"].ToString();
                    custlist.Add(cobj);
                }

                return custlist;

            }
            catch (Exception ex)
            {

                return custlist;
            }
            finally
            {
                con.Close();
            }
       }

        public List<SchemaModel> GetSchema(string SchemaID)
        {


            SqlConnection con = null;
            DataSet ds = null;
            List<SchemaModel> custlist = null;
            try
            {
                custlist = new List<SchemaModel>();
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", SchemaID);
                cmd.Parameters.AddWithValue("@SchemaName", "");
                cmd.Parameters.AddWithValue("@SchemaPath", "");
                cmd.Parameters.AddWithValue("@ParentID", "");
                cmd.Parameters.AddWithValue("@AssetTypeID", "");
                cmd.Parameters.AddWithValue("@Query", 4);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);
                string schemapath = string.Empty;
                if (ds.Tables[1] != null && ds.Tables[1].Rows != null)
                {
                    for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
                    {
                        schemapath = schemapath + "/" + ds.Tables[1].Rows[i]["SchemaName"].ToString();

                    }
                }

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    SchemaModel cobj = new SchemaModel();
                    cobj.ID = ds.Tables[0].Rows[i]["ID"].ToString();
                    cobj.SchemaName = ds.Tables[0].Rows[i]["SchemaName"].ToString();
                   // cobj.SchemaPath = ds.Tables[0].Rows[i]["SchemaPath"].ToString();
                    cobj.SchemaPath = schemapath;
                    cobj.ParentID = ds.Tables[0].Rows[i]["ParentID"].ToString();
                    cobj.AssetTypeID = ds.Tables[0].Rows[i]["AssetTypeID"].ToString();
                    cobj.AssetItemSchema = ds.Tables[0].Rows[i]["AssetItemSchema"].ToString();
                    cobj.AssetItemTreeeID = ds.Tables[0].Rows[i]["AssetItemSchemaMapped"].ToString();

                    custlist.Add(cobj);
                }

                return custlist;

            }
            catch (Exception ex)
            {

                return custlist;
            }
            finally
            {
                con.Close();
            }
        }
        public bool InsertPageContent(string PageUrl, string PageContent)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_insert_page_content", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PageUrl", PageUrl);
                cmd.Parameters.AddWithValue("@PageContent", PageContent);

                con.Open();

                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        public bool UpdatePageContent(string PageUrl, string PageContent)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_update_page_content", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageUrl", PageUrl);
                cmd.Parameters.AddWithValue("@PageContent", PageContent);

                con.Open();
                cmd.ExecuteScalar();
                // result = cmd.ExecuteScalar().ToString();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }





        public List<DynamicContentModel> GetPageContent(string PageUrl)
        {

           
            SqlConnection con = null;
            DataSet ds = null;
            List<DynamicContentModel> custlist = null;
            try
            {
                custlist = new List<DynamicContentModel>();
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_get_page_content", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageUrl", PageUrl);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DynamicContentModel cobj = new DynamicContentModel();
                    cobj.PageUrl = ds.Tables[0].Rows[i]["PageUrl"].ToString();
                    cobj.PageContent = ds.Tables[0].Rows[i]["PageContent"].ToString();
                    custlist.Add(cobj);
                }
                
                return custlist;

            }
            catch (Exception ex)
            {
               
                return custlist;
            }
            finally
            {
                con.Close();
            }
        }
       

             public List<AssertFieldsModel> GetAssetItemDetails(string AssetItemID, string AssetItemSchemaID, string AssetItemTreeeID)
        {


            SqlConnection con = null;
            DataSet ds = null;
            List<AssertFieldsModel> custlist = null;
            try
            {
                custlist = new List<AssertFieldsModel>();
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_item_field_details", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@AssetItemID", AssetItemID);
                cmd.Parameters.AddWithValue("@AssetItemSchemaID", AssetItemSchemaID);
                cmd.Parameters.AddWithValue("@AssetItemTreeeID", AssetItemTreeeID);
                cmd.Parameters.AddWithValue("@Query", 4);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    AssertFieldsModel cobj = new AssertFieldsModel();
                    cobj.SchemaFieldID = ds.Tables[0].Rows[i]["SchemaFieldID"].ToString();
                    cobj.SchemaParentID = ds.Tables[0].Rows[i]["SchemaParentID"].ToString();
                    cobj.SchemaFieldName = ds.Tables[0].Rows[i]["SchemaFieldName"].ToString();
                    cobj.SchemaFieldType = ds.Tables[0].Rows[i]["SchemaFieldType"].ToString();
                    cobj.AssetItemID = ds.Tables[0].Rows[i]["AssetItemID"].ToString();
                    cobj.AssetSchemaID = ds.Tables[0].Rows[i]["AssetSchemaID"].ToString();
                    cobj.AssetFieldID = ds.Tables[0].Rows[i]["AssetFieldID"].ToString();
                    cobj.AssetFieldValue = ds.Tables[0].Rows[i]["AssetFieldValue"].ToString();
                    custlist.Add(cobj);
                }

                return custlist;

            }
            catch (Exception ex)
            {

                return custlist;
            }
            finally
            {
                con.Close();
            }
        }
        public List<ContentTreeModel> GetContentTreeItems(string schemaID)
        {


            SqlConnection con = null;
            DataSet ds = null;
            List<ContentTreeModel> custlist = null;
            try
            {
                custlist = new List<ContentTreeModel>();
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_get_contenttree_item", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SchemaID", schemaID);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                ds = new DataSet();
                da.Fill(ds);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ContentTreeModel cobj = new ContentTreeModel();
                    cobj.ParentSchemaName = ds.Tables[0].Rows[i]["ParentSchemaName"].ToString();
                    cobj.ParentSchemaID = ds.Tables[0].Rows[i]["ParentSchemaID"].ToString();
                    cobj.ChildSchemaName = ds.Tables[0].Rows[i]["ChildSchemaName"].ToString();
                    cobj.ChildSchemaID = ds.Tables[0].Rows[i]["ChildSchemaID"].ToString();
                    custlist.Add(cobj);
                }

                return custlist;

            }
            catch (Exception ex)
            {

                return custlist;
            }
            finally
            {
                con.Close();
            }
        }


    }
}
