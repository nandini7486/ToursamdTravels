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
    public partial class Review_Management : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [Review] WHERE ReviewID = @Rid", con);

                cmd.Parameters.AddWithValue("@Rid", TextBox1.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Deleted.');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}