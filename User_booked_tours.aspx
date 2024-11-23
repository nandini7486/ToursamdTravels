<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_booked_tours.aspx.cs" Inherits="SuratDarshan.User_booked_tours" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center">
    <div class="col-md-10">
                <div class="card">
                    <div class="card-body">
                        <div class="row" align="center">
                            <div class="col">
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
                                <h2>Your booked tour history...</h2>
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                                <br />
                            </div>
                        </div>
                        <div class="row">

                            <div class="col">
                               
                                <asp:GridView class="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="tour_id" HeaderText="ID" SortExpression="tour_id" />
                                        <asp:BoundField DataField="tour_name" HeaderText="TOUR" SortExpression="tour_name" />
                                        <asp:BoundField DataField="Guide" HeaderText="GUIDE" SortExpression="Guide" />
                                        <asp:BoundField DataField="Mo_No" HeaderText="CONTACT" SortExpression="Mo_No" />
                                        <asp:BoundField DataField="Sdate" HeaderText="DATE" SortExpression="Sdate" />
                                        <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" />
                                        <asp:BoundField DataField="No_of_Ppl" HeaderText="TOTAL TOURIST" SortExpression="No_of_Ppl" />
                                        <asp:BoundField DataField="Total_Cost" HeaderText="PAID AMOUNT" SortExpression="Total_Cost" />
                                    </Columns>

                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusafirDBConnectionString11 %>" SelectCommand="SELECT [tour_id], [tour_name], [Guide], [Mo_No], [Sdate], [Price], [No_of_Ppl], [Total_Cost] FROM [book] WHERE ([user_name] = @user_name)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="user_name" SessionField="user_name" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <br /><br />
                        <div class="row">
                            <div class="col-12" align="center">
                        <asp:Button align="center" ID="Back" cssclass="btn-link btn-sm" runat="server" Text="Back" OnClick="Back_Click"  />
                        </div>
                        </div><br /><br />    <br /><br /><br />
</asp:Content>
