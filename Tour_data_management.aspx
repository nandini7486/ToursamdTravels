<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tour_data_management.aspx.cs" Inherits="SuratDarshan.tour_data_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        window.onload = function () {
            // Attach onchange event dynamically
            document.getElementById('<%= FileUpload1.ClientID %>').onchange = function () { readURL(this); };
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    // Set the image source to the file's result
                    document.getElementById('imgview').setAttribute('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="container-fluid">
        <br />
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" style="width: 150px; height: auto;" src="imgs/Musafir.jpg" />
                                    <br />
                                    <h1>Tour Details</h1>
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
                                <label>Tour ID: </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="id" placeholder="search by ID" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="regexValidatorID" runat="server" ControlToValidate="id" ErrorMessage="ID must be in the format 'T' followed by 3 digits, e.g., T001" ValidationExpression="^T\d{3}$" />
                                        <asp:Button CssClass="btn-info" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click"  />
                                    </div>
                                    </div>
                                <label>Category: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="cat" runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <label>Description: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="description"
                                        Rows="4" runat="server" placeholder="describe the place"
                                        TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Tour Name </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="name"
                                        runat="server" placeholder="name"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group">
                                    <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUpload1" runat="server" />
                                </div>
                                <br />
                                <label>Date: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <br />
                                <label>Price: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="12">
                                <label>Activity: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="act" runat="server" placeholder="optional"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>From: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="from" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="from" ErrorMessage="Please enter valid address." ValidationExpression="^[a-zA-Z0-9\s,.'-]{3,}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>To: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="To" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="Validate_address" runat="server" ControlToValidate="To" ErrorMessage="Please enter valid address." ValidationExpression="^[a-zA-Z0-9\s,.'-]{3,}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <label>Tour-Guide: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="guid" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Mobile No.: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="mono" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator
                                        ID="revMobile"
                                        runat="server"
                                        ControlToValidate="mono"
                                        ErrorMessage="Please enter a valid 10-digit Indian mobile number."
                                        ValidationExpression="^[6-9]\d{9}$"
                                        ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>Departure Time: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="departTime" runat="server" TextMode="Time"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Return Time: </label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="returnTime" runat="server" TextMode="Time"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Duration</label>
                                <div class="form-group">

                                    <asp:TextBox CssClass="form-control" ID="duration" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" align="center">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Upload Package" OnClick="Button1_Click" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Button CssClass="btn btn-info" ID="Button2" runat="server" Text="Update Package" OnClick="Button2_Click" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Button CssClass="btn btn-danger" ID="Button3" runat="server" Text="Delete Package" OnClick="Button3_Click" />
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row" align="center">
                            <div class="col">
                                <h1>Tour Data</h1>
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
                                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server"  AutoGenerateColumns="False" DataKeyNames="tour_id" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound1">
                                    <Columns>
                                        <asp:BoundField DataField="tour_id" HeaderText="ID" ReadOnly="True" SortExpression="tour_id" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-lg-9">
                                                        <div align="center" class="row">

                                                            <h3 align="center">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("tour_name") %>'></asp:Label></h3>

                                                        </div>
                                                        <br />
                                                        <div class="row">
                                                            <div class="col-3">
                                                                <b>Category:<br /></b><asp:Label ID="Label12" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-3">
                                                                <b>Package:</b><br /> Rs.<asp:Label ID="Label3" runat="server" Text='<%# Eval("Price") %>'></asp:Label>/-
                                                            </div>
                                                            <div class="col-3">
                                                                <b>Duration:</b><br /><asp:Label ID="Label4" runat="server" Text='<%# Eval("Duration") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-3">
                                                                <b>Date:</b><br /><asp:Label ID="Label13" runat="server" Text='<%# Eval("SDate", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <b>Description:</b><asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <b>Departure Time:</b><asp:Label ID="Label6" runat="server" Text='<%# Eval("StartTime") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-6">
                                                                <b>Return Time:</b><asp:Label ID="Label7" runat="server" Text='<%# Eval("EndTime") %>'></asp:Label>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <b>From:</b><asp:Label ID="Label8" runat="server" Text='<%# Eval("FromPoint") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <b>To:</b><asp:Label ID="Label9" runat="server" Text='<%# Eval("ToPoint") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <b>Guide:</b><asp:Label ID="Label10" runat="server" Text='<%# Eval("Guide") %>'></asp:Label>
                                                            </div>
                                                            <div class="col-6">
                                                                <b>Mobile No.:</b><asp:Label ID="Label11" runat="server" Text='<%# Eval("Mo_No") %>'></asp:Label>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("Img_link") %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusafirDBConnectionString5 %>" SelectCommand="SELECT * FROM [tour]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
        <br /><br /><br />
</asp:Content>
