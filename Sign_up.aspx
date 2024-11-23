<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sign_up.aspx.cs" Inherits="SuratDarshan.sign_up" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
          function validateForm() {
              var password = document.getElementById('<%= password.ClientID %>').value;
        var passwordErrorLabel = document.getElementById('<%= lblPasswordError.ClientID %>');

              // Regular expression for 6 alphanumerical characters
              var passwordPattern = /^[a-zA-Z0-9]{6}$/;

              // Check if the password matches the pattern
              if (!passwordPattern.test(password)) {
                  passwordErrorLabel.style.display = 'block'; // Show error message
                  return false; // Prevent form submission
              } else {
                  passwordErrorLabel.style.display = 'none'; // Hide error message
                  return true; // Allow form submission
              }
          }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
</div>
                                    <h2>Registration Form</h2>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                                <br />
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="fullname" runat="server" placeholder="full name"></asp:TextBox>
                                </div>
                                <br />
                                <label>Contact Number:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="contact_no" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator
                                        ID="revMobile"
                                        runat="server"
                                        ControlToValidate="contact_no"
                                        ErrorMessage="Please enter a valid 10-digit Indian mobile number."
                                        ValidationExpression="^[6-9]\d{9}$"
                                        ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="dob" runat="server" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                                <br />
                                <label>Email: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="email" TextMode="Email"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State: </label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Assam" Value="Assam"></asp:ListItem>
                                        <asp:ListItem Text="Bihar" Value="Bihar"></asp:ListItem>
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh"></asp:ListItem>
                                        <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                                        <asp:ListItem Text="Gujarat" Value="Gujarat"></asp:ListItem>
                                        <asp:ListItem Text="Haryana" Value="Haryana"></asp:ListItem>
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand"></asp:ListItem>
                                        <asp:ListItem Text="Karnataka" Value="Karnataka"></asp:ListItem>
                                        <asp:ListItem Text="Kerala" Value="Kerala"></asp:ListItem>
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                                        <asp:ListItem Text="Manipur" Value="Manipur"></asp:ListItem>
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya"></asp:ListItem>
                                        <asp:ListItem Text="Mizoram" Value="Mizoram"></asp:ListItem>
                                        <asp:ListItem Text="Nagaland" Value="Nagaland"></asp:ListItem>
                                        <asp:ListItem Text="Odisha" Value="Odisha"></asp:ListItem>
                                        <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                                        <asp:ListItem Text="Sikkim" Value="Sikkim"></asp:ListItem>
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu"></asp:ListItem>
                                        <asp:ListItem Text="Telangana" Value="Telangana"></asp:ListItem>
                                        <asp:ListItem Text="Tripura" Value="Tripura"></asp:ListItem>
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"></asp:ListItem>
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand"></asp:ListItem>
                                        <asp:ListItem Text="West Bengal" Value="West Bengal"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="city" runat="server" placeholder="city"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pincode: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="pin" runat="server" placeholder="pincode" TextMode="Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revPincode" runat="server" ControlToValidate="pin" ValidationExpression="^\d{6}$" ErrorMessage="Please enter a valid 6-digit PIN code." ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <label>Address: </label>
                                <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="address" row="2" TextMode="MultiLine"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="Validate_address" runat="server" ControlToValidate="address" ErrorMessage="Please enter valid address." ValidationExpression="^[a-zA-Z0-9\s,.'-]{3,}$" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col" align="center">
                                <div class="badge badge-pill bg-primary">Login Credential</div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <label>User Name: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="u_name" runat="server" placeholder="unique name"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revUsername"  runat="server" ControlToValidate="u_name" ValidationExpression="^[a-zA-Z0-9]{1,15}$" ErrorMessage="Username must be alphanumeric and up to 15 characters long." ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
                                <label>Password: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="password" runat="server" placeholder="password"></asp:TextBox>
                                    <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red" Visible="false" Text="Password must be 6 alphanumerical characters."></asp:Label>

                                </div>
                                <br />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group" align="center">
                            <asp:Button CssClass="btn btn-block btn-lg btn-primary btn-success" ID="Sign_up" runat="server" Text="Sign Up" OnClick="Sign_up_Click" />
                        </div>
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
