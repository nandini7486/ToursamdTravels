<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About_us.aspx.cs" Inherits="SuratDarshan.About_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>

    /* Styling for the round image */
    .round-image {
        width: 70px; /* Set the width of the image */
        height: 70px; /* Set the height of the image */
        border-radius: 50%; /* Makes the image round */
        object-fit: cover; /* Ensures the image fits inside the circle */
        margin-right: 20px; /* Adds space between the image and the form */
        border: none; /* Optional: Add a border around the image */
    }

    /* Styling for the form */
    .form {
        flex-grow: 1; /* Makes the form take up the remaining space */
    }
</style>

<div class="form-container" align="center">
    <!-- Round image -->
    <img src="imgs/Musafir.jpg" class="round-image">
</div>

                            <h5 class="text-uppercase" align="center">About Us</h5><hr />
                            <div class="container">
                            <strong class="container">Hello, we’re Musafirs.</strong><br />
                            <p class="container">As the leading marketplace for travel experiences in Surat, we believe that making memories is what travel is all about. Musafir makes it easy to explore more than 5,000 travel experiences– everything from simple tours to extreme adventures and all the interesting stuff in between.And with real traveler reviews, industry-leading flexibility and 24/7 customer service, it's easy to book with confidence.</p>
                            <strong class="container">Why choose Musafir?</strong><br />
                            <ul>
                                <li class="container"><strong>Ultimate flexibility:</strong> Free cancellation and payment options to satisfy any plans or budget. </li>
                                <li class="container"><strong>Quality at our core:</strong> High quality standards. Reliable reviews. A Tripadvisor company.</li>
                                <li class="container"><strong>24/7 customer support:</strong> New price? New plan? No problem. We’re here to help, 24/7. </li>
                            </ul></div>
    <br />

                            <h5 class="text-uppercase" align="center">Contact Us</h5><hr />
                            <ul class="list-unstyled" align="center">
                                <li class="container"><strong>Email: </strong>ank@musafir.com</li>
                                <li class="container"><strong>Phone: </strong>+123 456 7890</li>
                                <li class="container"><strong>Address: </strong>Shyam Villa , Surat, Gujarat, India</li>
                                <li class="container"><b>Follow us on <a href="https://www.instagram.com/nandini_t7486?igsh=cDE2ZjNzamFnazVh" target="_blank">Instagram</a> and <a href="https://www.facebook.com/profile.php?id=61550573127565" target="_blank">Facebook</a></b></li>
                            </ul>
    <br /><br /><br />
    

</asp:Content>
