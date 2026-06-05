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

       // private string ConnenctionString = "Data Source=SQL1026;Initial Catalog=TestPFP;TrustServerCertificate=True;User ID=sa;Password=Wstinol1";

        private string ConnenctionString = "Data Source=manyapc;Initial Catalog=DynamicContent;TrustServerCertificate=True;User ID=sa;Password=vpm031207";




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
       

    }
}
