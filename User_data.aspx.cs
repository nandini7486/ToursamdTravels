using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuratDarshan
{
    public partial class user_data : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)//delete user permanently
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [user] WHERE user_name = @userName", con);

                cmd.Parameters.AddWithValue("@userName", name.Text.Trim());            
                cmd.ExecuteNonQuery();
             
                con.Close();
                Response.Write("<script>alert('User details deleted from the Musafir successfully.');</script>");
               
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}