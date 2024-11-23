<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="SuratDarshan.Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        if (Uname.trim() !== "" && Email.trim() !== "" && Cont.trim() !== "" && Address.trim() !== "" && No_of_p.trim() !== "") {
            agree.disabled = false;
        } else {
            btnAgree.disabled = true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <style>
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
</div><h2>Reservation Form</h2>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>User Name: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Uname" runat="server"></asp:TextBox>
                                </div>
                                <label>Contact Number:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Cont" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="Cont" ErrorMessage="Please enter a valid 10-digit Indian mobile number." ValidationExpression="^[6-9]\d{9}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Tour ID: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Tid" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <label>Tour Name: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TName" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Email: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Email" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Price: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Price" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Address: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Address" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="Validate_address" runat="server" ControlToValidate="Address" ErrorMessage="Please enter valid address." ValidationExpression="^[a-zA-Z0-9\s,.'-]{3,}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="Sdate" placeholder="YYYY-MM-DD" runat="server" ></asp:TextBox>
                                </div>
                            </div>
                        </div>
      
                        <div class="row">
                            <div class="col" align="center">
                                <div class="badge badge-pill bg-primary"><strong>Booking Credential</strong></div>
                            </div>
                        </div><br />
      
                        <div class="row">
                            <div class="col-md-6">
                                <label>Number of People: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="No_of_p" runat="server"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Only 1 to 5 people are allowed to come through your Musafir account." ControlToValidate="No_of_p" MaximumValue="5" MinimumValue="1" Type="Integer" ForeColor="Red"></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Payment: </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ReadOnly="True" ID="Tcost" runat="server"></asp:TextBox>
                                        <asp:Button CssClass="btn-primary" ID="Calc" runat="server" Text="Calculate Total Cost" OnClick="Calc_Click1" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <i>By clicking the AGREE button I acknoledge that I accept the <u>license Terms and Privecy Statement.</u></i>
                        </div><br />
                        <div class="form-group" align="center">
                            <asp:Button CssClass="btn btn-primary btn-info"  ID="Agree" runat="server" Text="Agree" Enabled="False" OnClick="Agree_Click"  />
                            <asp:Button  CssClass="btn btn-primary btn-success" ID="Book_button"  runat="server" Text="Book Now" Enabled="False" OnClick="Book_button_Click" />                        
                        </div>
                        <br />
                    </div>
                </div>
            </div>
            <asp:Button  CssClass="btn btn-primary btn-block" ID="Button1"  runat="server" Text="Back" OnClick="Button1_Click"  />
    </div>
    </div>
    <br />
    <br />
    <br /><br /><br />

</asp:Content>
