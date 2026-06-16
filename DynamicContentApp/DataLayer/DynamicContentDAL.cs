using DynamicContentApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using Microsoft.Data;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DynamicContentApp.DataLayer
{
 
     public class DynamicContentDAL
    {

        //private string ConnenctionString = "Data Source=SQL1026;Initial Catalog=TestPFP;TrustServerCertificate=True;User ID=sa;Password=Wstinol1";

        // private string ConnenctionString = "Data Source=manyapc;Initial Catalog=DynamicContent;TrustServerCertificate=True;User ID=sa;Password=vpm031207";
        private string ConnenctionString = "Data Source=manyapc;Initial Catalog=DynamicContentSecond;TrustServerCertificate=True;User ID=sa;Password=vpm031207";


        public bool InsertSchema(string SchemaName, string SchemaPath, string SchemaParent)
        {
            SqlConnection con = null;
            //string result = "";
            try
            {
                con = new SqlConnection(ConnenctionString);
                SqlCommand cmd = new SqlCommand("dca_curd_asset_schema", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", "");
                cmd.Parameters.AddWithValue("@SchemaName", SchemaName);
                cmd.Parameters.AddWithValue("@SchemaPath", SchemaPath);
                cmd.Parameters.AddWithValue("@ParentID", SchemaParent);
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
        public bool UpdateSchema(string SchemaID, string SchemaName, string SchemaPath, string SchemaParent)
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
        public bool DeleteSchema(string SchemaID)
        {
            SqlConnection con = null;
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
                cmd.Parameters.AddWithValue("@Query", 3);

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
