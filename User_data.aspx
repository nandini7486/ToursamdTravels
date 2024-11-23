<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_data.aspx.cs" Inherits="SuratDarshan.user_data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
</div><h3>User Data Management</h3></center>
    <br /><br />
    <div class="container-fluid d-flex justify-content-center">
        <div class="row">
            <div class="col-md-12">
                <!-- Search Box and Delete Button -->
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        <!-- DataTables search box is auto-generated -->
                    </div>
                    <div>
                        <asp:TextBox placeholder="enter ID to delete" ID="name" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Delete Selected User" OnClick="Button1_Click" />
                    </div>
                </div>
                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_name" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="fullname" HeaderText="FULL NAME" SortExpression="fullname" />
                                        <asp:BoundField DataField="user_name" HeaderText="USER NAME" SortExpression="user_name" ReadOnly="True" />
                                        <asp:BoundField DataField="email" HeaderText="EMAIL" SortExpression="email" />
                                        <asp:BoundField DataField="contact_no" HeaderText="MOBILE NO." SortExpression="contact_no" />
                                        <asp:BoundField DataField="dob" HeaderText="DATE OF BIRTH" SortExpression="dob" />
                                        <asp:BoundField DataField="address" HeaderText="ADDRESS" SortExpression="address" />
                                        <asp:BoundField DataField="city" HeaderText="CITY" SortExpression="city" />
                                        <asp:BoundField DataField="pincode" HeaderText="PINCODE" SortExpression="pincode" />
                                        <asp:BoundField DataField="state" HeaderText="STATE" SortExpression="state" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusafirDBConnectionString3 %>" SelectCommand="SELECT [fullname], [user_name], [email], [contact_no], [dob], [address], [city], [pincode], [state] FROM [user]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
    <br />
        <br />
</asp:Content>
