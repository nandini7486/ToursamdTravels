<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_login.aspx.cs" Inherits="SuratDarshan.user_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="row">
                    <div class="col">
                        <center><style>
    /* Styling for the round image */
    .round-image {
        width: 50px; 
        height: 50px; 
        border-radius: 50%; 
        object-fit: cover; 
        margin-right: 20px; 
        border: none; 
    }
</style>

<div class="form-container">
    <img src="imgs/Musafir.jpg" class="round-image">
</div><h2>User Login</h2></center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    <hr /><br /><br />
                    </div>
                </div>
                <div class="row">
                   <center> <div class="col-10">
                    <div class="form-group">     
                        <label>User Name:</label>
                        <asp:TextBox CssClass="form-control" ID="Uname" runat="server"></asp:TextBox>
                    </div><br />
                    <div class="form-group">
                        <label>Password:</label>
                        <asp:TextBox CssClass="form-control" ID="Pword" runat="server" TextMode="Password"></asp:TextBox>

                    </div><br />
                    <div class="form-group" align="center">
                        <asp:Button CssClass="btn btn-primary btn-block btn-success btn-lg" ID="Log_in" runat="server" Text="Login" OnClick="Log_in_Click"  />&nbsp;&nbsp;
                          
                    </div><br /><br />
                 </div></center>
            </div>
        </div>
        </div>
    </div>
</div><br /><br />
        <br /><br /><br />
  

</asp:Content>
