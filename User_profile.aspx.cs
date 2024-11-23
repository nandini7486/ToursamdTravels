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
    public partial class user_profile : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                if (!Page.IsPostBack)
                {
                    GetUser();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)//update button
        {
            string pass = "";
            if (pw.Text.Trim()=="")
            {
                pass = password.Text.Trim();
            }
            else
            {
                pass = pw.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE [user] SET fullname = @full_name, dob = @dob, contact_no = @contact_no, email = @email, state = @state, city = @city, pincode = @pincode, address = @address, password = @password WHERE user_name = @user_name;", con);
                cmd.Parameters.AddWithValue("@user_name", name.Text.Trim());
                cmd.Parameters.AddWithValue("@full_name", full.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", cont.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state.Text.Trim());
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pin.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@password", pass);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result>0)
                {
                    Response.Write("<script>alert('Your personal data updated successfully');</script>");
                    GetUser();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return;
            }
        }
        void GetUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (Session["user_name"] != null)
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string userName = Session["user_name"].ToString();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [user] WHERE user_name = @userName", con);
                    cmd.Parameters.AddWithValue("@userName", userName);
                    //SqlCommand cmd = new SqlCommand("SELECT * FROM [user] WHERE user_name='" + Session["user_name"].ToString() + "'", con);

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
                        password.Text = dr.GetValue(9).ToString();
                        }
                    }
                }
                else
                {
                    // Handle the case where the session value is null
                    Response.Redirect("User_login.aspx");  // Example action
                    return;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return;
            }
        }
    }
}