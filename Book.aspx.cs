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
    public partial class Book : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve values from the QueryString
                string tourId = Request.QueryString["id"];
                string tourName = Request.QueryString["name"];
                string price = Request.QueryString["price"];

                // Check if values are not null and set them to the respective TextBoxes
                if (!string.IsNullOrEmpty(tourId))
                {
                    Tid.Text = tourId;
                }
                if (!string.IsNullOrEmpty(tourName))
                {
                    TName.Text = tourName;
                }
                if (!string.IsNullOrEmpty(price))
                {
                    Price.Text = price;
                }
            }
        }
        protected void Book_button_Click(object sender, EventArgs e)
        {
            Uname.Attributes.Add("required", "required");
            Email.Attributes.Add("required", "required");
            Cont.Attributes.Add("required", "required");
            Address.Attributes.Add("required", "required");
            Sdate.Attributes.Add("required", "required");
            No_of_p.Attributes.Add("required", "required");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd1 = new SqlCommand("SELECT Guide, Mo_No FROM [tour] WHERE tour_id = @tid;", con);
                cmd1.Parameters.AddWithValue("@tid", Tid.Text.Trim());
                SqlDataReader reader = cmd1.ExecuteReader();

                String Guide = String.Empty;
                String Mo_No = String.Empty;

                if (reader.Read())
                {
                    // Set the tour details to the respective controls
                    Guide = reader["Guide"].ToString();
                    Mo_No = reader["Mo_No"].ToString();
                }
                reader.Close();

                SqlCommand cmd = new SqlCommand("INSERT INTO [book] (user_name, tour_id, tour_name, Contact, Email, Address, Price, Sdate, No_of_Ppl, Total_Cost, Guide, Mo_No) VALUES(@user_name, @tour_id, @tour_name, @Contact, @Email, @Address, @Price, @SDate, @No_Of_Ppl, @Total_Cost, @Guide, @Mo_No);", con);
                cmd.Parameters.AddWithValue("@user_name", Uname.Text.Trim());
                cmd.Parameters.AddWithValue("@tour_id", Tid.Text.Trim());
                cmd.Parameters.AddWithValue("@tour_name", TName.Text.Trim());
                cmd.Parameters.AddWithValue("@Contact", Cont.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", Address.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", Price.Text.Trim());
                cmd.Parameters.AddWithValue("@SDate", Sdate.Text.Trim());
                cmd.Parameters.AddWithValue("@No_Of_Ppl", No_of_p.Text.Trim());
                cmd.Parameters.AddWithValue("@Total_Cost", Tcost.Text.Trim());
                cmd.Parameters.AddWithValue("@Guide", Guide);
                cmd.Parameters.AddWithValue("@Mo_No", Mo_No);

                cmd.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Your tour is booked. Go to your profile and check your booked tour history for more info.');", true);
                Response.Redirect("User_profile.aspx");
                return;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Calc_Click1(object sender, EventArgs e)
        {
            // Check if Session["user_name"] exists and is not null
            if (Session["user_name"] != null)
            {
                // Compare session value with the entered username
                if (Session["user_name"].ToString().Trim().Equals(Uname.Text.Trim(), StringComparison.OrdinalIgnoreCase))
                {
                    try
                    {
                        // Get the price from Price TextBox
                        decimal price = Convert.ToDecimal(Price.Text);

                        // Get the number of people from No_of_p TextBox
                        int numberOfPeople = Convert.ToInt32(No_of_p.Text);

                        // Calculate the total cost
                        decimal totalCost = price * numberOfPeople;

                        // Set the total cost in the Tcost TextBox
                        Tcost.Text = totalCost.ToString("F2"); // "F2" to format as a decimal with two places

                        Agree.Enabled = true;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                        return;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please enter your UNIQUE NAME.');</script>");
                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('Session has expired or is null. Please log in again.');</script>");
                return;
            }
        }


        protected void Agree_Click(object sender, EventArgs e)
        {
            CompareTourDate();
            Book_button.Enabled = true;
        }

        protected void CompareTourDate()
        {
            try
            {
                // Step 1: Get the entered tour date from the TextBox

                bool isValidDate = DateTime.TryParse(Sdate.Text.Trim(), out DateTime enteredDate);

                if (!isValidDate)
                {
                    // If the entered date is not a valid date, show an error message.
                    Response.Write("<script>alert('Invalid date format. Please enter a valid date.');</script>");
                    return;
                }

                // Get the current date and time, and calculate 6 hours from now
                DateTime currentDateTime = DateTime.Now;
                DateTime currentDatePlus6Hours = currentDateTime.AddHours(6);

                // Compare the entered date with the current date + 6 hours
                if (enteredDate < currentDateTime)
                {
                    //  The entered date is in the past
                    Response.Write("<script>alert('Sorry, this tour has already expired. Try some other date');</script>");
                    return;
                }
                else if (enteredDate <= currentDatePlus6Hours)
                {
                    // The entered date is within the next 6 hours
                    Response.Write("<script>alert('Sorry, seats are not available. Try some other date');</script>");
                    return;
                }
                else
                {
                    return;
                }
            }
            catch (Exception ex)
            {
                // Handle any potential errors
                Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                return;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}