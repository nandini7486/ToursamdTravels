using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuratDarshan
{
    public partial class tour_data_management : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set the 'min' attribute to today's date in "yyyy-MM-dd" format
                TextBox2.Attributes.Add("min", DateTime.Now.ToString("yyyy-MM-dd"));
            }
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)//insert
        {
            if (CheckiftourExists())
            {
                Response.Write("<script>alert('Tour already exists to Musafir.');</script>");
            }
            else
            {
                Addtour();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)//update
        {
            if (CheckiftourExists())
            {
                UpdateTour();
            }
            else
            {
                Response.Write("<script>Tour is not uploaded on Musafir.</ script > ");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)//delete
        {
            if (CheckiftourExists())
            {
                DeleteTour();
            }
            else
            {
                Response.Write("<script>Tour is not uploaded on Musafir.</ script > ");
            }
        }
        bool CheckiftourExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [tour] WHERE tour_id = @tourId OR tour_name = @tourName; ", con);
                cmd.Parameters.AddWithValue("@tourId", id.Text.Trim());
                cmd.Parameters.AddWithValue("@tourName", name.Text.Trim());
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
                Response.Write("<script>alert('" + ex.Message +"');</script>");
                return false;
            }
        }
        void Addtour()
        {
            try
            {
                string filepath = "~/imgs/surat.jpeg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("imgs/" + filename));
                filepath = "~/imgs/" + filename;
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)    
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO [tour](tour_id, tour_name, Description, Activity, Img_link, Price, SDate, Duration, Category, FromPoint, ToPoint, StartTime, EndTime, Guide, Mo_No) VALUES(@tourId, @tourName, @Description,@act, @ImgLink, @Price, @StartDate, @Duration, @Category, @FromPoint, @ToPoint, @StartTime, @EndTime, @Guid, @Mono)", con);
               
                cmd.Parameters.AddWithValue("@tourId", id.Text.Trim());
                cmd.Parameters.AddWithValue("@tourName", name.Text.Trim());
                cmd.Parameters.AddWithValue("@Description",description.Text.Trim());
                cmd.Parameters.AddWithValue("@act", act.Text.Trim());
                cmd.Parameters.AddWithValue("@ImgLink", filepath);
                cmd.Parameters.AddWithValue("@Price", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@StartDate",TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Duration", duration.Text.Trim());
                cmd.Parameters.AddWithValue("@Category",cat.Text.Trim());
                cmd.Parameters.AddWithValue("@FromPoint", from.Text.Trim());
                cmd.Parameters.AddWithValue("@ToPoint", To.Text.Trim());
                cmd.Parameters.AddWithValue("@StartTime",departTime.Text.Trim());
                cmd.Parameters.AddWithValue("@EndTime",returnTime.Text.Trim());
                cmd.Parameters.AddWithValue("@Guid", guid.Text.Trim());
                cmd.Parameters.AddWithValue("@Mono", mono.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Tour detail of '" +name.Text.Trim() + "'added to the Musafir successfully.');</script>");
                GridView1.DataBind();
                Response.Redirect("Tour_data_management.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message +"');</script>");
            }
        }
        void UpdateTour()
        {
            try
            {
                string filepath = "~/imgs/surat.jpeg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("imgs/" + filename));
                filepath = "~/imgs/" + filename;
                
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE [tour] SET tour_name = @tourName, Description = @Description, Activity = @act, Img_link = @ImgLink, Price = @Price, SDate = @StartDate, Duration = @Duration, Category = @Category, FromPoint = @FromPoint, ToPoint = @ToPoint, StartTime = @StartTime, EndTime = @EndTime, Guide = @Guid, Mo_No = @Mono WHERE tour_id = @tourId", con);
               
                cmd.Parameters.AddWithValue("@tourId", id.Text.Trim());
                cmd.Parameters.AddWithValue("@tourName", name.Text.Trim());
                cmd.Parameters.AddWithValue("@Description",description.Text.Trim());
                cmd.Parameters.AddWithValue("@act", act.Text.Trim());
                cmd.Parameters.AddWithValue("@ImgLink", filepath);
                cmd.Parameters.AddWithValue("@Price", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@StartDate",TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Duration", duration.Text.Trim());
                cmd.Parameters.AddWithValue("@Category",cat.Text.Trim());
                cmd.Parameters.AddWithValue("@FromPoint", from.Text.Trim());
                cmd.Parameters.AddWithValue("@ToPoint", To.Text.Trim());
                cmd.Parameters.AddWithValue("@StartTime",departTime.Text.Trim());
                cmd.Parameters.AddWithValue("@EndTime",returnTime.Text.Trim());
                cmd.Parameters.AddWithValue("@Guid", guid.Text.Trim());
                cmd.Parameters.AddWithValue("@Mono", mono.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Tour detail of '" +name.Text.Trim() + "'updated to the Musafir successfully.');</script>");
                GridView1.DataBind();
                Response.Redirect("Tour_data_management.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message +"');</script>");
            }
        }
        void DeleteTour()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [tour] WHERE tour_name = @tourName OR tour_id = @tourId", con);
               
                cmd.Parameters.AddWithValue("@tourId", id.Text.Trim());
                cmd.Parameters.AddWithValue("@tourName", name.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Tour details deleted from the Musafir successfully.');</script>");
               
                GridView1.DataBind();
                Response.Redirect("Home.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message +"');</script>");
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Assuming the tour date is stored in a column with ID "Sdate" (index may vary)
                 
                // Try to parse the date in that column, replace 2 with the actual column index for Sdate
                if (DateTime.TryParse(e.Row.Cells[2].Text, out DateTime tourDate))
                {
                    DateTime now = DateTime.Now;
                    DateTime expiryLimit = now.AddHours(6);

                    if (tourDate < now || tourDate <= expiryLimit)
                    {
                        // Apply red border if the tour date is past or will expire in the next 6 hours
                        e.Row.Style.Add("border", "2px solid red");
                    }
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GetTour();
        }
        void GetTour()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                // Use parameterized query to avoid SQL injection
                SqlCommand cmd = new SqlCommand("SELECT * FROM [tour] WHERE tour_id=@tour_id", con);
                cmd.Parameters.AddWithValue("@tour_id", id.Text.Trim());

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        // Assigning values to controls
                        cat.Text = dr.GetValue(8).ToString();
                        description.Text = dr.GetValue(2).ToString();
                        name.Text = dr.GetValue(1).ToString();
                        TextBox2.Text = dr.GetValue(6).ToString();
                        TextBox1.Text = dr.GetValue(5).ToString();
                        act.Text = dr.GetValue(3).ToString();
                        from.Text = dr.GetValue(9).ToString();
                        To.Text = dr.GetValue(10).ToString();
                        guid.Text = dr.GetValue(13).ToString();
                        mono.Text = dr.GetValue(14).ToString();
                        departTime.Text = dr.GetValue(11).ToString();
                        returnTime.Text = dr.GetValue(12).ToString();
                        duration.Text = dr.GetValue(7).ToString();
                    }
                }
                else
                {
                    // If no rows found, show alert
                    Response.Write("<script>alert('Tour does not exist.');</script>");
                }

                con.Close();
            }
            catch (Exception ex)
            {
                // Show the actual exception for debugging
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }

        }
        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Assuming 'SDate' is the date field and it's a DateTime in your database
                DateTime tourDate = Convert.ToDateTime(DataBinder.Eval(e.Row.DataItem, "SDate"));

                if (tourDate < DateTime.Now)
                {
                    // Apply pale red background color if the date is less than today
                    e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                }
            }
        }
    }
}