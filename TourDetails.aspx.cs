using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuratDarshan
{
    public partial class TourDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tourId = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(tourId))
                {
                    LoadTourDetails(tourId);
                }
            }
        }

        private void LoadTourDetails(string tourId)
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string query = "SELECT tour_name, Description, Activity, Img_link, Price, SDate, Duration, Category, FromPoint, ToPoint, StartTime, EndTime FROM tour WHERE tour_id = @tourId";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@tourId", tourId);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Set the tour details to the respective controls
                    tourName.InnerText = reader["tour_name"].ToString();
                    tourDescription.InnerText = reader["Description"].ToString();
                    tourPrice.InnerText = "Price: Rupees " + reader["Price"].ToString();
                    tourDate.InnerText = "Available Date: " + Convert.ToDateTime(reader["SDate"]).ToString("dd-MM-yyyy");
                    cat.InnerText = "Category: " + reader["Category"].ToString();
                    act.InnerText = "Activities: " + reader["Activity"].ToString();
                    Stime.InnerText = "Departure Time: " + reader["StartTime"].ToString();
                    Etime.InnerText = "Return Time: " + reader["EndTime"].ToString();
                    due.InnerText = "Duration: " + reader["Duration"].ToString();
                    fromP.InnerText = "From: " + reader["FromPoint"].ToString();
                    toP.InnerText = "To: " + reader["ToPoint"].ToString();

                    // Resolve the image URL and set the image source
                    string imageUrl = reader["Img_link"].ToString();
                    tourImage.Src = ResolveUrl(imageUrl);
                }
            }
        }

        // Event handler for "Book Now" button click
        protected void BookNowButton_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null || string.IsNullOrEmpty(Session["role"].ToString()))
            {
                string script = @"
                    if (confirm('Do you have Musafir account? For Musafir Tour Reservation, You need Musafir account, please sign up now.')) {
                        window.location.href = 'Sign_up.aspx';
                        } else {
                        window.location.href = 'User_login.aspx';
                    }";

                // Register the script with ClientScript
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", script, true);
            }
            else
            {
                // If the user is logged in, redirect to the booking page with relevant details
                string tourId = Request.QueryString["id"];
                string tourname = tourName.InnerText;
                string tourprice = tourPrice.InnerText.Replace("Price: Rupees ", ""); // Clean up the price string

                // Redirect to the booking page with tour details
                Response.Redirect($"Book.aspx?id={tourId}&name={tourname}&price={tourprice}");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
