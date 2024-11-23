using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SuratDarshan
{
    public partial class Musafir_reviews : System.Web.UI.Page
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
            string query = "SELECT img_link, user_namr, ReviewText, DatePosted FROM Review"; // Added 'tour_id' in the query

            using (SqlConnection con = new SqlConnection(strcon))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // Dynamically build the homepage content
                while (reader.Read())
                {
                    string userName = reader["user_namr"].ToString();
                    string Rtext = reader["ReviewText"].ToString();
                    string imageUrl = reader["img_link"].ToString();
                    string Rdate = reader["DatePosted"].ToString();

                    // Use ResolveUrl to handle relative paths
                    string resolvedImageUrl = ResolveUrl(imageUrl);

                    // Create the HTML for the tour card with a clickable link to the tour details page
                    string tourHtml = $@"
                <div class='tour-card'>
                    <img src='{resolvedImageUrl}' alt='{userName}' class='tour-image' />
                    <h2>{userName}</h2>
                    <p>{Rtext}</p>
                    <p><strong>Date:</strong> {Rdate}</p>
                </div>
            </a>";

                    // Append the generated HTML to a placeholder or div on your page
                    tourContainer.InnerHtml += tourHtml;
                }
            }
        }
    }
}