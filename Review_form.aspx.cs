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
using System.Drawing;

namespace SuratDarshan
{
    public partial class Review_form : System.Web.UI.Page
    {
#pragma warning disable IDE0044 // Add readonly modifier
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
#pragma warning restore IDE0044 // Add readonly modifier
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Pdate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                uname.Text = Session["user_name"].ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string filepath = "~/imgs/Musafir.jpg"; // Default image file path

                if (FileUpload1.HasFile)
                {
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fileExtension = Path.GetExtension(filename).ToLower();

                    // Ensure the file is an image (e.g., .jpg, .jpeg, .png, etc.)
                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                    {
                        // Load the image to check its dimensions
                        using (Stream stream = FileUpload1.PostedFile.InputStream)
                        {
                            using (System.Drawing.Image img = System.Drawing.Image.FromStream(stream)) // Fully qualified reference
                            {
                                // Check if the image is 563x563 in size
                                if (img.Width == 563 && img.Height == 563)
                                {
                                    string savePath = Server.MapPath("imgs/" + filename);
                                    FileUpload1.SaveAs(savePath);
                                    filepath = "~/imgs/" + filename; // Update to use uploaded image path
                                }
                                else
                                {
                                    // Show error if the image is not 563x563
                                    Response.Write("<script>alert('Only 563x563 size images are allowed.');</script>");
                                    return;
                                }
                            }
                        }
                    }
                    else
                    {
                        // Show error if the file is not a valid image format
                        Response.Write("<script>alert('Only image files (jpg, jpeg, png) are allowed.');</script>");
                        return;
                    }
                }
                // Else block will use the default image if no file is uploaded
                else
                {
                    filepath = "~/imgs/Musafir.jpg"; // Use a default image if no file is uploaded
                }

                // Save review data to the database
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO [Review](user_namr, ReviewText, DatePosted, img_link) VALUES(@user_namr, @ReviewText, @DatePosted, @img_link)", con);

                cmd.Parameters.AddWithValue("@user_namr", uname.Text.Trim());
                cmd.Parameters.AddWithValue("@ReviewText", mind.Text.Trim());
                cmd.Parameters.AddWithValue("@DatePosted", Pdate.Text.Trim());
                cmd.Parameters.AddWithValue("@img_link", filepath); // Use filepath for the image (either uploaded or default)

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Posted successfully.');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_profile.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)//update
        {
            try
            {
                string filepath = "~/imgs/Musafir.jpg";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("imgs/" + filename));
                filepath = "~/imgs/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE [Review] SET user_namr = @user_namr, ReviewText = @ReviewText, DatePosted = @DatePosted, img_link = @img_link WHERE ReviewID = @Rid", con);
                cmd.Parameters.AddWithValue("@Rid", Rid.Text.Trim());
                cmd.Parameters.AddWithValue("@user_namr", uname.Text.Trim());
                cmd.Parameters.AddWithValue("@ReviewText", mind.Text.Trim());
                cmd.Parameters.AddWithValue("@DatePosted", Pdate.Text.Trim());
                cmd.Parameters.AddWithValue("@img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)//delete
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM [Review] WHERE ReviewID = @Rid", con);

                cmd.Parameters.AddWithValue("@Rid", Rid.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)//go button
        {
            GetReview();
        }
        void GetReview()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Review] WHERE ReviewID='"
               + Rid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        uname.Text = dr.GetValue(1).ToString();
                        Pdate.Text = dr.GetValue(3).ToString();
                        mind.Text = dr.GetValue(2).ToString();
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