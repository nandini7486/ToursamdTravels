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
    public partial class Delete_Acc_Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Uname.Attributes.Add("required", "required");
            Pword.Attributes.Add("required", "required");
            C_pw.Attributes.Add("required", "required");
        }

        protected void Del_acc_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                if (Session["user_name"] != null)
                {
                    // Compare session value with the entered username
                    if (Session["user_name"].ToString().Trim().Equals(Uname.Text.Trim(), StringComparison.OrdinalIgnoreCase))
                    {
                        // Open connection once
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        SqlCommand cmd1 = new SqlCommand("SELECT password FROM [user] WHERE user_name = @uname;", con);
                        cmd1.Parameters.AddWithValue("@uname", Uname.Text.Trim());

                        SqlDataReader reader = cmd1.ExecuteReader();
                        string pw = string.Empty;

                        if (reader.Read())
                        {
                            pw = reader["password"].ToString().Trim();  // Trim database password
                        }
                        reader.Close();

                        // Compare the retrieved password with the entered password
                        if (pw == Pword.Text.Trim())
                        {
                            // Ensure Confirm Password also matches
                            if (Pword.Text.Trim() == C_pw.Text.Trim())
                            {
                                try
                                {
                                    // Execute the delete query
                                    SqlCommand cmd = new SqlCommand("DELETE FROM [user] WHERE user_name = @UserName", con);
                                    cmd.Parameters.AddWithValue("@UserName", Uname.Text.Trim());
                                    cmd.ExecuteNonQuery();

                                    // Close connection
                                    con.Close();

                                    // Redirect to Home page after deletion
                                    string script = "alert('Your Musafir Account deleted successfully.'); window.location='Home.aspx';";
                                    ClientScript.RegisterStartupScript(this.GetType(), "DeleteAccountRedirect", script, true);
                                    return;
                                }
                                catch (Exception ex)
                                {
                                    // Handle any exceptions
                                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Please enter the correct password in the confirm password box!');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Please enter the correct password!');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Please enter the correct User Name!');</script>");
                    }
                }
            }
        }

        protected void Cancel_deletion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
