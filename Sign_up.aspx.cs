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
    public partial class sign_up : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {

            fullname.Attributes.Add("required", "required");
            contact_no.Attributes.Add("required", "required");
            dob.Attributes.Add("required", "required");
            email.Attributes.Add("required", "required");
            city.Attributes.Add("required", "required");
            pin.Attributes.Add("required", "required");
            address.Attributes.Add("required", "required");
            u_name.Attributes.Add("required", "required");
            password.Attributes.Add("required", "required");

        }

        protected void Sign_up_Click(object sender, EventArgs e)
        {
            if (DateTime.TryParse(dob.Text,out DateTime dob1))
            {
                int age = DateTime.Now.Year - dob1.Year;
                if (dob1 > DateTime.Now.AddYears(-age)) age--;
                if(age < 18 )
                {
                    ClientScript.RegisterStartupScript(this.GetType(),"alert","alert('Kids under 18 cannot register on Musafir.');window.location='Home.aspx';",true);
                    return;
                }
            }

            if (Check_user_exist())
            {
                Response.Write("<script>alert('This User Name already exist. Try another unique one.');</script>");
            }
            else
            {
                New_user();
            }
        }

        bool Check_user_exist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user] WHERE user_name = '" + u_name.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void New_user()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [user] (fullname, dob, contact_no, email, state, city, pincode, address, user_name, password) VALUES(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@address,@user_name,@password)", con);

                cmd.Parameters.AddWithValue("@full_name", fullname.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", contact_no.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value.Trim());
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pin.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@user_name", u_name.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign up successfull. Now you are Musafir member. Login to your account');</script>");

                Response.Redirect("User_login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}