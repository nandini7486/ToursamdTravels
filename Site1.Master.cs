using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuratDarshan
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the current page name from the URL
                string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

                // Apply aria-current to the active page
                switch (currentPage)
                {
                    case "About_us.aspx":
                        About_us.CssClass += "active";
                        About_us.Attributes.Add("aria-current", "page");
                        break;

                    case "Home.aspx":
                        Home.CssClass += "active";
                        Home.Attributes.Add("aria-current", "page");
                        break;

                    case "Sign_up.aspx":
                        Sign_up.CssClass += "active";
                        Sign_up.Attributes.Add("aria-current", "page");
                        break;

                    case "User_login.aspx":
                        Log_in.CssClass += "active";
                        Log_in.Attributes.Add("aria-current", "page");
                        break;

                    case "Log_out.aspx":
                        Log_out.CssClass += "active";
                        Log_out.Attributes.Add("aria-current", "page");
                        break;

                        // Add more cases for other pages if needed
                }
            }
            try
            {
                if (Session["role"] == null || string.IsNullOrEmpty(Session["role"].ToString()))
                {
                    Log_in.Visible = true;//login button
                    Sign_up.Visible = true;//sign up button
                    Log_out.Visible = false;//log out button
                    Admin_login.Visible = true;//admin login
                    Tour_Data_Management.Visible = false;//tour data
                    User_Data_Management.Visible = false;//user data
                    Reservrd_Tour_Data.Visible = false;//reserved tour
                    Review_Management.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    Log_in.Visible = false;//login button
                    Sign_up.Visible = false;//sign up button
                    Log_out.Visible = false;//log out button
                    //User_Profile.Visible = true;//profile button
                    //User_Profile.Text = "Hello " + Session["user_name"].ToString();
                    Admin_login.Visible = false;//admin login
                    Reservrd_Tour_Data.Visible = false;//reserved tour data
                    Tour_Data_Management.Visible = false;//tour data
                    User_Data_Management.Visible = false;//user data
                    Review_Management.Visible = false;
                    LabelUser.Text = "Hello "+Session["user_name"].ToString();
                    phUserDropdown.Visible = true;
                    Linked_Profile.Visible = true;
                    Booked_Tours.Visible = true;
                    Reviews.Visible = true;
                    Log_out_user.Visible = true;
                }
                else
                {
                    Log_in.Visible = false;//login button
                    Sign_up.Visible = false;//sign up button
                    Log_out.Visible = true;//log out button
                    Admin_login.Visible = false;//admin login
                    LabelUser.Text = "Hello Admin";
                    Tour_Data_Management.Visible = true;//tour data
                    User_Data_Management.Visible = true;//user data
                    Reservrd_Tour_Data.Visible = true;//reserved tour data
                    Review_Management.Visible = true;
                }
            }
            catch (Exception)
            {

            }
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Sign_up_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sign_up.aspx");
        }

        protected void Log_out_Click(object sender, EventArgs e)
        {
            Session["user_name"] = "";
            Session["full_name"] = "";
            Session["role"] = "";

            Session["user_name"] = "";
            Session["role"] = "";
            Response.Redirect("Home.aspx");
        }

        protected void Log_in_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_login.aspx");
        }
        protected void Admin_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_login.aspx");
        }

        protected void Tour_Data_Management_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tour_data_management.aspx");
        }

        protected void Reservrd_Tour_Data_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reserved_tour_data.aspx");
        }

        protected void User_Data_Management_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_data.aspx");
        }

        protected void Testimonial_management_Click(object sender, EventArgs e)
        {
            Response.Redirect("Review_management.aspx");
        }

        protected void Your_Booked_Tours_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_booked_tours.aspx");

        }
        protected void Give_Review_Click(object sender, EventArgs e)
        {
            Response.Redirect("Review_form.aspx");

        }
        protected void Testimonial_Click(object sender, EventArgs e)
        {
            Response.Redirect("Musafir_reviews.aspx");

        }

        protected void Review_Management_Click(object sender, EventArgs e)
        {
            Response.Redirect("Review_Management.aspx");
        }

        protected void About_us_Click(object sender, EventArgs e)
        {
            Response.Redirect("About_us.aspx");
        }

        protected void Booked_Tours_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_booked_tours.aspx");
        }

        protected void Reviews_Click(object sender, EventArgs e)
        {
            Response.Redirect("Review_form.aspx");
        }

        protected void Linked_Profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_profile.aspx");
        }

        protected void Log_out_user_Click(object sender, EventArgs e)
        {
            Session["user_name"] = "";
            Session["full_name"] = "";
            Session["role"] = "";

            Session["user_name"] = "";
            Session["role"] = "";
            Response.Redirect("Home.aspx");
        }

        protected void Del_Click(object sender, EventArgs e)
        {
            Response.Redirect("Delete_Acc_Confirm.aspx");
        }
    }
}