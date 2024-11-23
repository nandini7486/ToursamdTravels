using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SuratDarshan
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTourData();
            }
        }

        private void LoadTourData()
        {
            string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            string query = "SELECT tour_id, tour_name, Img_link, Price, SDate, Category FROM tour"; // No need to select description here

            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DateTime today = DateTime.Today;
                // Dynamically build the homepage content
                while (reader.Read())
                {
                    string tourId = reader["tour_id"].ToString();
                    string tourName = reader["tour_name"].ToString();
                    string imageUrl = reader["Img_link"].ToString();
                    string price = reader["Price"].ToString();
                    DateTime sDate = Convert.ToDateTime(reader["SDate"]);
                    string category = reader["Category"].ToString();

                    string resolvedImageUrl = ResolveUrl(imageUrl);

                    // Create the HTML for the tour card
                    string tourHtml = $@"
                        <a href='TourDetails.aspx?id={tourId}' style='text-decoration:none; color:black;'>
                            <div class='tour-card'>
                                <img src='{resolvedImageUrl}' alt='{tourName}' class='tour-image' />
                                <h5>{tourName}</h5>
                                <p class='tour-price'><strong>Price:</strong> {price}</p>
                            </div>
                        </a>";

                    int lastDay = DateTime.DaysInMonth(today.Year, today.Month);
                    DateTime lastDateOfMonth = new DateTime(today.Year, today.Month, lastDay);

                    if (sDate >= today && sDate <= lastDateOfMonth)
                    {
                        Div1.InnerHtml += tourHtml; // Current Tours
                    }
                    else if (sDate.DayOfWeek == DayOfWeek.Saturday || sDate.DayOfWeek == DayOfWeek.Sunday || sDate<= lastDateOfMonth)
                    {
                        Div2.InnerHtml += tourHtml; // Weekend Tours
                    }
                    else if (category == "Summer" || category == "Winter" || category == "Monsoon")
                    {
                        tourContainer.InnerHtml += tourHtml; // Seasonal Tours
                    }
                }
            }
        }
    }
}
