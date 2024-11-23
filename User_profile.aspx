<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_profile.aspx.cs" Inherits="SuratDarshan.user_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <center><div align="center">
 <div class="container" align="center">
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
        <div class="card">
        <div class="card-body">
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
</div><h2>Your Profile</h2></center>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <hr /><br /> <br />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                <label>Full Name: </label>
                    <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="full" runat="server" placeholder="full name"></asp:TextBox>
                    </div>
                    <br />
                <label>Contact Number:</label>
                    <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="cont" runat="server" placeholder="dd-mm-yyyy"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                <label>Date of Birth: </label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="dob" runat="server" placeholder="dd-mm-yyyy"></asp:TextBox>
                    </div> <br />
                    <label>Email: </label>
                        <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="email" TextMode="Email"></asp:TextBox>
                        </div><br />
                     </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                    <label>State: </label>
                        <div class="form-group">
                        <asp:TextBox ID="state" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <asp:TextBox CssClass="form-control" ID="pin" runat="server" placeholder="pincode" ></asp:TextBox>
                        </div>
                    </div>
                </div><br />
                <div class="row">
                    <div class="col">
                    <label>Address: </label>
                    <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="address" row="2" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div> <br /> <br />
                <div class="row">
                    <div class="col" align="center">
                    <div class="badge badge-pill bg-primary">Login Credential</div>
                    </div>
                </div><br />
                <div class="row">
                    <div class="col-md-4">
                    <label>User Name: </label>
                        <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="name" runat="server" placeholder="unique name" ReadOnly="True"></asp:TextBox>
                        </div><br />
                    </div>
                    <div class="col-md-4">
                    <label>Old Password: </label>
                        <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="password" runat="server" ReadOnly="True"></asp:TextBox>
                        </div><br />
                    </div>
                    <div class="col-md-4">
                    <label>New Password: </label>
                        <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="pw" runat="server"></asp:TextBox>
                    </div><br />
                  </div>
              </div><br /><br />
              <div class="form-group col-8 mx-auto" align="center">
                    <asp:LinkButton CssClass="btn btn-block btn-lg btn-primary btn-primary" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Update</asp:LinkButton>
              </div><br />
           </div>
        </div>
    </div>
 </div>
 </div></div></center>
 <br />
 <br />
        <br /><br /><br />
</asp:Content>
