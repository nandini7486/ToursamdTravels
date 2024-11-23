<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Review_Management.aspx.cs" Inherits="SuratDarshan.Review_Management" %>
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
</div><h3>Review Management</h3></center>
    <br />
    <div class="container-fluid d-flex justify-content-center">
        <div class="row">
            <div class="col-md-12">
                <!-- Search Box and Delete Button -->
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        <!-- DataTables search box is auto-generated -->
                    </div>
                    <div>
                        <asp:TextBox placeholder="enter ID to delete" ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:Button ID="DeleteButton" runat="server" CssClass="btn btn-danger" Text="Delete Selected Reviews" OnClick="DeleteButton_Click" />
                    </div>
                </div>

                <!-- Centered GridView -->
                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="ReviewID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ReviewID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ReviewID" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-8">
                                        <div class="row">
                                            <b><asp:Label ID="Label1" runat="server" Text='<%# Eval("user_namr") %>'></asp:Label></b>
                                        </div>
                                        <div class="row">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ReviewText") %>'></asp:Label>
                                        </div><br />
                                        <div class="row">
                                            <i><asp:Label ID="Label3" runat="server" Text='<%# Eval("DatePosted") %>'></asp:Label></i>
                                        </div>
                                    </div>
                                    <div class="col-4" align="center">
                                        <asp:Image ID="Image1" CssClass="img-fluid" Height="75%" Width="50%" runat="server" ImageUrl='<%# Eval("img_link") %>' />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusafirDBConnectionString10 %>" SelectCommand="SELECT [ReviewID], [user_namr], [ReviewText], [DatePosted], [img_link] FROM [Review]"></asp:SqlDataSource>
            </div>
        </div>

    </div>
        <br /><br /><br />
</asp:Content>
