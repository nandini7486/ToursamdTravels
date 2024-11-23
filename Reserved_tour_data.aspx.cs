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
    public partial class reserved_tour_data : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GetUser();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [user] WHERE user_name = @userName", con);

                SqlCommand cmd1 = new SqlCommand("DELETE FROM [book] WHERE user_name = @userName", con);

                cmd.Parameters.AddWithValue("@userName", name.Text.Trim());
                cmd1.Parameters.AddWithValue("@userName", name.Text.Trim());
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('User details deleted from the Musafir successfully.');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void GetUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user] WHERE user_name='"
               + name.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        name.Text = dr.GetValue(8).ToString();
                        full.Text = dr.GetValue(0).ToString();
                        dob.Text = dr.GetValue(1).ToString();
                        email.Text = dr.GetValue(3).ToString();
                        cont.Text = dr.GetValue(2).ToString();
                        state.Text = dr.GetValue(4).ToString();
                        city.Text = dr.GetValue(5).ToString();
                        pin.Text = dr.GetValue(6).ToString();
                        address.Text = dr.GetValue(7).ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}