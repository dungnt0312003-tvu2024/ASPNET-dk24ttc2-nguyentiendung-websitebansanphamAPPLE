<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="webbansanphamapple.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset="utf-8" />
    <link href="~/content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <title>Apple Product Store</title>
    <style type="text/css">
        #form1 {
            width: 458px;
        }

        .sp {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <ul class="navbar-nav mx-auto col-md-8 ">
            <li class="nav-item">
                <a class="nav-link " href="default.aspx">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="product.aspx">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Liên hệ</a>
            </li>
        </ul>
        <!-- Đăng nhập / Đăng ký -->
        <ul class="navbar-nav ms-auto col-md-2">
            <li class="nav-item">
                <a class="nav-link active" href="#">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register.aspx">Đăng ký</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Giỏ hàng (0)</a>
            </li>
        </ul>
    </nav>
    <section class="py-5 text-center bg-white border-bottom">
        <div accesskey="main-content" class="container">
            <h2>Admin Page</h2>
            <p>Welcome to the admin section of the Apple Product Store.</p>
        </div>
    </section>


    <!-- Bảng danh sách sản phẩm -->
    <div class="container">
        <form runat="server" >
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="up1" runat="server">
                <ContentTemplate>

                    <h2>Danh sách Sản phẩm
                    </h2>
                    <input class="form-control" id="myInput" type="text" placeholder="Search.." />
                    <asp:Button runat="server" text="Thêm sản phẩm" CommandName="addItem" OnClick="Them_Click"/>
                    <br />
                    <!-- Repeater hiển thị sản phẩm -->
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Id sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Chi tiết</th>
                                        <th>Giá</th>
                                        <th>Hình Ảnh</th>
                                        <th>sửa sản phẩm</th>
                                        <th>xóa sản phẩm</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <!-- <tbody id="myTable"> -->
                                <tr>
                                    <td><%#  Eval("ProductId") %>   </td>
                                    <td><%#  Eval("Name") %>   </td>
                                    <td><%#  Eval("Description") %>   </td>
                                    <td><%#  Eval("Price")     %>   đ</td>
                                    <td>
                                        <asp:Image class="card-img-top rounded sp" ImageUrl='<%#  Eval("ImageUrl") %>' runat="server" /></td>
                                    <td>
                                        <asp:Button ID="btSua" runat="server" CommandArgument='<%# Eval("ProductId") %>' Text="Sửa"  CommandName="EditItem" /></td>
                                    <td>
                                        <asp:Button ID="btXoa" runat="server" CommandArgument='<%# Eval("ProductId") %>' Text="Xóa"  CommandName="DeleteItem" /></td>
                                </tr>
                             <!-- </tbody>-->
                        </ItemTemplate>

                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <!-- model sửa -->
                    <div class="modal fade" id="editModal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Sửa sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>

                                    <!--<asp:Button type="button" class="btn-close" data-bs-dismiss="modal" runat="server"/> -->
                                </div>
                                <div class="modal-body">
                                 <asp:HiddenField ID="hfProductId" runat="server" /> <!--Lưu ID sản phẩm để đổ vào sửa và xóa-->
                                    Tên sản phẩm:
                                 <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control"></asp:TextBox>
                                 <br />
                                 Chi tiết:
                                 <asp:TextBox ID="txtEditDesc" runat="server" CssClass="form-control"></asp:TextBox>
                                 <br />
                                 Giá:
                                 <asp:TextBox ID="txtEditPrice" runat="server" CssClass="form-control"></asp:TextBox>
                                 <br />
                                 Ảnh:
                                 <asp:Image ID="img" class="card-img-top rounded sp" runat="server" />

                                 <asp:TextBox ID="txtEditImage" runat="server" CssClass="form-control"></asp:TextBox>
                                 <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control btn btn-primary"  />
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal xóa -->
                    <div class="modal fade" id="deleteModal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Xóa sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có chắc chắn muốn xóa sản phẩm này không?
                                 <asp:HiddenField ID="hfDeleteId" runat="server" />
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnConfirmDelete" runat="server" Text="Xóa"  CommandName="cfmDelet" CssClass="btn btn-danger" OnClick="btnConfirmDelete_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- model Thêm -->
                    <div class="modal fade" id="addModal" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Thêm sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>

                                    <!--<asp:Button type="button" class="btn-close" data-bs-dismiss="modal" runat="server"/> -->
                                </div>
                                <div class="modal-body">
                                 <asp:HiddenField ID="HiddenField1" runat="server" /> <!--Lưu ID sản phẩm để đổ vào sửa và xóa-->
                                    Tên sản phẩm:
                                 <asp:TextBox ID="txttenSPADD" runat="server" CssClass="form-control"></asp:TextBox>
                                 <br />
                                 Chi tiết:
                                 <asp:TextBox ID="txtchiTietADD" runat="server" CssClass="form-control"></asp:TextBox>
                                 <br />
                                 Giá:
                                 <asp:TextBox ID="txtgiaSPADD" runat="server" CssClass="form-control"></asp:TextBox>
                                 <br />
                                 Ảnh:
                                 <asp:Image ID="Image1" class="card-img-top rounded sp" runat="server" />

                                 <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                 <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control btn btn-primary"  />
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="Button1" runat="server" Text="Thêm sản phẩm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSave" />  
                </Triggers>
            </asp:UpdatePanel>
        </form>
       

    </div>




    <!-- FOOTER -->
    <footer class="py-4 bg-dark text-light ">
        <div class="navbar-nav mx-auto col-md-10">
            <p class="mb-0">© Nguyễn Tiến Dũng</p>
            <p class="mb-0">Chuyên đề ASP.NET</p>
            <p class="mb-0">© Đại học Trà Vinh</p>
        </div>
    </footer>

</body>
</html>
