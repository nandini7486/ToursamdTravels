<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SuratDarshan.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

    /* Styling for the round image */
    .round-image {
        width: 50px; /* Set the width of the image */
        height: 50px; /* Set the height of the image */
        border-radius: 50%; /* Makes the image round */
        object-fit: cover; /* Ensures the image fits inside the circle */
        margin-right: 20px; /* Adds space between the image and the form */
        border: 2px solid #ddd; /* Optional: Add a border around the image */
    }

    /* Styling for the form */
    .form {
        flex-grow: 1; /* Makes the form take up the remaining space */
    }
</style>

<div class="form-container">
    <!-- Round image -->
    <img src="imgs/Musafir.jpg" class="round-image">
</div>

</asp:Content>
