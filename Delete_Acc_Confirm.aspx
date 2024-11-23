<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Delete_Acc_Confirm.aspx.cs" Inherits="SuratDarshan.Delete_Acc_Confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
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
                                <h2>Delete Account On Musafir</h2>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr /><br /><br />
                        </div>
                    </div>
                    <div class="row">
                        <center>
                            <div class="col-10">
                                <div class="form-group">
                                    <label>User Name:</label>
                                    <asp:TextBox CssClass="form-control" ID="Uname" runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <label>Password:</label>
                                    <asp:TextBox CssClass="form-control" ID="Pword" runat="server" TextMode="Password"></asp:TextBox>

                                </div>
                                <br />
                                <div class="form-group">
                                    <label>Confirm Password:</label>
                                    <asp:TextBox CssClass="form-control" ID="C_pw" runat="server" TextMode="Password"></asp:TextBox>

                                </div>
                                <br />
                                <br />
                                <br />
                                <div class="form-group" align="center">
                                    <asp:Button CssClass="btn btn-primary btn-block btn-danger btn-lg" ID="Del_acc" OnClientClick="return confirm('Are you sure you want to delete your account? After clicking on YES, your whole data will be removed on Musafir.');" runat="server" Text="Delete" OnClick="Del_acc_Click" />&nbsp;&nbsp;
                        <asp:Button CssClass="btn btn-primary btn-block btn-info btn-lg" ID="Cancel_deletion" runat="server" Text="Cancel" OnClick="Cancel_deletion_Click" />&nbsp;&nbsp;
                          
                                </div>
                                <br />
                                <br />
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />



</asp:Content>
