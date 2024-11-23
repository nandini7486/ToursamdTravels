using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuratDarshan
{
    public partial class user_login : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {
            Uname.Attributes.Add("required", "required");
            Pword.Attributes.Add("required", "required");
        }

        protected void Log_in_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM [user] WHERE user_name = '" + Uname.Text.Trim() + "' AND password = '" + Pword.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('" + dr.GetValue(8).ToString()+ "');</script>");
                        Session["user_name"] = dr.GetValue(8).ToString();
                        Session["full_name"] = dr.GetValue(0).ToString();
                        Session["role"] = "user";
                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials. If do not have Musafir account Sign Up now!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}