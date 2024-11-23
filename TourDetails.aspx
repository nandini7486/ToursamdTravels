<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TourDetails.aspx.cs" Inherits="SuratDarshan.TourDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .tour-container {
            text-align: left;
        }

        .card {
            justify-content: center;
        }
    </style>
    <center>
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card">
                    <div class="container">
                        <h2 id="tourName" runat="server"></h2>
                        <br />
                        <img id="tourImage" src="imgs/surat.jpeg" runat="server" class="img-fluid tour-image" /><br /><br />
                        <div class="row ">
                            <p id="tourDescription" runat="server"></p>
                            <strong><p id="tourPrice" runat="server">Rupees </p></strong>
                            <strong><p id="tourDate" runat="server"></p></strong>
                            <!--<label id="cat" runat="server"></label>-->
                            <label id="act" runat="server"></label>
                            <label id="Stime" runat="server"></label><label id="Etime" runat="server"></label><label id="due" runat="server"></label>
                            <label id="fromP" runat="server"></label>
                            <label id="toP" runat="server"></label><br /><br />
            
                            <asp:Button CssClass="btn btn-primary btn-block btn-success btn-lg" ID="BookNowBut" runat="server" Text="Book Now" OnClick="BookNowButton_Click" /><br /><br />
                            <asp:Button CssClass="btn btn-primary btn-block btn-info btn-lg" ID="Button1" runat="server" Text="Back" OnClick="Button1_Click"  />
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </center>
    <br />
    <br />    <br /><br />
</asp:Content>
