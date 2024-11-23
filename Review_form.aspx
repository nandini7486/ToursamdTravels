<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Review_form.aspx.cs" Inherits="SuratDarshan.Review_form" %>
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
                                    <h1>Your Review</h1>
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

                            <div class="row">
                                <div class="col-4">
                                     <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="Rid" placeholder="search by ID" runat="server"></asp:TextBox>
                                        <asp:Button CssClass="btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                    </div>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="uname" placeholder="User Name: " runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-4">
                                       <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="Pdate" placeholder="Date: " runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div><br /><br />
                            <div class="row">
                                <div class="col-6">
                                    <asp:TextBox CssClass="form-control" ID="mind" Rows="3" runat="server" placeholder="Write your mind.." TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <div class="card">
                                    <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="FileUpload1" placeholder="size: 1x1 (this field is optional.)" runat="server" />
                                    <asp:Label ID="Label4" runat="server" color="grey" Text="Label"><i>(optional)</i></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />                     
                        <br />
                        
                    </div>
                    <div class="row" align="center">
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Post" OnClick="Button1_Click"  />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="Button2_Click"   />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <asp:Button ID="Button3" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="Button3_Click"  />
                            </div>
                        </div><br /><br />
                        <div class="row">
                            <div class="col-12">
                        <asp:Button align="center" ID="Back" cssclass="btn-link btn-sm" runat="server" Text="Back" OnClick="Back_Click" />
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
                                <h1>Your Reviews on Musafir</h1>
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
                                <asp:GridView ID="GridView1" CssClass="table" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ReviewID">
                                    <Columns>
                                        <asp:BoundField DataField="ReviewID" HeaderText="ID" SortExpression="ReviewID" InsertVisible="False" ReadOnly="True" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-8">
                                                        <div class="row">

                                                           <b> <asp:Label ID="Label3" runat="server" Text='<%# Eval("user_namr") %>'></asp:Label></b>

                                                        </div>
                                                        <div class="row">

                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ReviewText") %>'></asp:Label>

                                                        </div><br />
                                                        <div class="row">

                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("DatePosted") %>'></asp:Label>

                                                        </div>
                                                    </div>
                                                    <div class="col-4" align="center">
                                                        <asp:Image ID="Image1" ImageAlign="Middle" CssClass="img-fluid" Height="70%" Width="70%" runat="server" ImageUrl='<%# Eval("img_link") %>' />
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MusafirDBConnectionString9 %>" SelectCommand="SELECT [user_namr], [ReviewText], [DatePosted], [img_link], [ReviewID] FROM [Review] WHERE ([user_namr] = @user_namr)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="user_namr" SessionField="user_name" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
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
