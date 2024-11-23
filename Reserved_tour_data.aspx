<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reserved_tour_data.aspx.cs" Inherits="SuratDarshan.reserved_tour_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container-fluid">
        <br />
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h2>User Data</h2>
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
                                <label>User Name: </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="name" runat="server"></asp:TextBox>
                                        <asp:Button CssClass="btn-primary" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Full Name:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="True" ID="full" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Date of Birth: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="True" ID="dob" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Email: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="True" ID="email" runat="server" placeholder="email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact Number:</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="True" ID="cont" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>State: </label>
                                <div class="form-group">
                                    <asp:TextBox ID="state" class="form-control" ReadOnly="True" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="True" ID="city" runat="server" placeholder="city"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pincode: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="True" ID="pin" runat="server" placeholder="pincode"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <label>Address: </label>
                                <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="address" row="2" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group col-8 mx-auto" align="center">
                            <asp:Button ID="Button1" CssClass="btn btn-block btn-lg btn-primary btn-danger" runat="server" Text="Delete User Permanently" OnClick="Button1_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row" align="center">
                            <div class="col">
                                <h2>Booked Tours</h2>
                                <br />
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
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" >
                                    <Columns>
                                        <asp:BoundField DataField="tour_id" HeaderText="ID" SortExpression="tour_id" />
                                        <asp:BoundField DataField="tour_name" HeaderText="TOUR" SortExpression="tour_name" />
                                        <asp:BoundField DataField="user_name" HeaderText="USER NAME" SortExpression="user_name" />
                                        <asp:BoundField DataField="Price" HeaderText="PRICE" SortExpression="Price" />
                                        <asp:BoundField DataField="SDate" HeaderText="DATE" SortExpression="SDate" />
                                        <asp:BoundField DataField="No_Of_Ppl" HeaderText="TOTAL TOURIST" SortExpression="No_Of_Ppl" />
                                        <asp:BoundField DataField="Total_Cost" HeaderText="PAID AMOUNT" SortExpression="Total_Cost" />
                                    </Columns>
                                    
                                </asp:GridView>
                                
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusafirDBConnectionString4 %>" SelectCommand="SELECT [tour_id], [tour_name], [user_name], [Price], [SDate], [No_Of_Ppl], [Total_Cost] FROM [book]"></asp:SqlDataSource>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br /><br /><br />

</asp:Content>
