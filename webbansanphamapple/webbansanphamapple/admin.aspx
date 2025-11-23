<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master" CodeBehind="admin.aspx.cs" Inherits="webbansanphamapple.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        #form1 {
            width: 458px;
        }

        .sp {
            width: 200px;
            height: 200px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form runat="server" > <!-- NAVBAR -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
        <ul class="navbar-nav mx-auto col-md-8 ">
            <li class="nav-item">
                <a class="nav-link" href="default.aspx">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="product.aspx">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Liên hệ</a>
            </li>
        </ul>
        <!-- Đăng xuất -->
        <ul class="navbar-nav ms-auto col-md-2">
            <li class="nav-item p-2">
                <asp:Label runat="server" ID="lblXinchao" class="text-light" ></asp:Label>
            </li>
            <li class="nav-item">
                <asp:Button runat="server" text="Đăng Xuất" OnClick="log_out" class="btn btn-success"/>
            </li>
            
            
        </ul>
        <!-- Đăng nhập / Đăng ký -->
        <ul class="navbar-nav ms-auto col-md-2" id="info">
            <li class="nav-item">
                <a class="nav-link" href="login.aspx">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register.aspx">Đăng ký</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Giỏ hàng (0)</a>
            </li>
        </ul>
    </nav>
    <!-- Bảng danh sách sản phẩm -->
    <div class="container p-3">
        
            <asp:ScriptManager ID="ScriptManager1" runat="server" /> 
            <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <h2>Danh sách Sản phẩm
                    </h2>
                    <input class="form-control" id="myInput" type="text" placeholder="Search.." />
                    <asp:Button runat="server" text="Thêm sản phẩm" CssClass="btn btn-primary" CommandName="addItem"/>
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

                                        <asp:Button ID="btSua" runat="server" class="btn btn-warning" CommandArgument='<%# Eval("ProductId") %>' Text="Sửa"  CommandName="EditItem" /></td>

                                    <td>
                                        <asp:Button ID="btXoa" runat="server" class="btn btn-danger"  CommandArgument='<%# Eval("ProductId") %>' Text="Xóa"  CommandName="DeleteItem" /></td>
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
                                 <asp:FileUpload ID="FileUpload1"  runat="server" CssClass="form-control btn btn-primary"  />
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
       
    </div>
        </form>

</asp:Content>


