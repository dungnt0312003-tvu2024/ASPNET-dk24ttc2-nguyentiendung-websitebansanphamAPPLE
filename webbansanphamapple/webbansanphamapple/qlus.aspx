<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="qlus.aspx.cs" Inherits="webbansanphamapple.QLUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .sp {
            width: 200px;
            height: 200px;
        }

        .uimg {
            width: 150px;
            height: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="d-flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <h4 class="text-white text-center py-3">ADMIN</h4>
                <div class="container">
                    <asp:Image runat="server" ID="uimg" class="uimg rounded-circle" />
                </div>
                <a href="default.aspx"> <i class="bi bi-apple"></i>Trang chủ</a>
                <a href="qlus.aspx" class="text-success">Quản lí người dùng</a>
                <a href="qlsp.aspx">Quản lí sản phẩm</a>
                <asp:Label runat="server" ID="lblXinchao" class="text-light"></asp:Label>
                <asp:Button runat="server" Text="Đăng Xuất" OnClick="log_out" class="btn btn-success" />
            </div>


            <!-- Main Content -->
            <div class="content flex-grow-1">
                <!-- Bảng danh sách người dùng -->
                <div class="container p-3">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <h2>Danh sách người dùng
                            </h2>
                             <div class="container">
                                 <div class="row">
                                     <div class="col-xl-10">
                                         <asp:TextBox ID="txtSearch" runat="server" Class="form-control" Placeholder="Tìm kiếm người dùng.."/>
             
                                     </div>
                                     <div class="col-sm-2">
                                         <asp:Button ID="btnSearch" runat="server" Text="Tìm người dùng" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                                     </div>
                                 </div>
                                 <br />
                             </div>
                                                        <br />
                            <!-- Repeater hiển thị người dùng -->
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">

                                <HeaderTemplate>
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Id Người dùng</th>
                                                <th>Tên người dùng</th>
                                                <th>Địa chỉ Email</th>
                                                <th>Quyền</th>
                                                <th>Hình Ảnh</th>
                                                <th>Họ và Tên người dùng</th>
                                                <th>Số điện thoại</th>
                                                <th>Địa chỉ</th>
                                                <th>Xóa</th>
                                                <th>Sửa</th>
                                            </tr>
                                        </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <!-- <tbody id="myTable"> -->
                                    <tr>
                                        <td><%#  Eval("UserId") %>   </td>
                                        <td><%#  Eval("Username") %>        </td>
                                        <td><%#  Eval("Email") %> </td>
                                        <td><%#  Eval("Role")     %>   </td>
                                        <td>
                                            <asp:Image class="card-img-top rounded sp" ImageUrl='<%#  Eval("Image") %>' runat="server" /></td>
                                        <td><%#  Eval("Name")     %>   </td>
                                        <td><%#  Eval("PhoneNB")     %>   </td>
                                        <td><%#  Eval("Address")     %>   </td>
                                        <td>
                                            <asp:Button ID="btSua" runat="server" class="btn btn-warning" CommandArgument='<%# Eval("UserId") %>' Text="Sửa" CommandName="EditItem" /></td>

                                        <td>
                                            <asp:Button ID="btXoa" runat="server" class="btn btn-danger" CommandArgument='<%# Eval("UserId") %>' Text="Xóa" CommandName="DeleteItem" /></td>
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
                                            <h5 class="modal-title">Sửa thông tin người dùng</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <asp:HiddenField ID="hfProductId" runat="server" />
                                            <!--Lưu ID sản phẩm để đổ vào sửa và xóa-->
                                            Tên người dùng:
                                       <asp:TextBox ID="txtEditUName" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                            Mật khẩu :
                                            <asp:TextBox ID="txtEditPass" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                            Email:
                                       <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                            Quyền:
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Admin" Value="admin" id="admin"></asp:ListItem>
                                            <asp:ListItem Text="User" Value="user" id="user"></asp:ListItem>
                                        </asp:DropDownList>
                                            <br />
                                            Họ và tên:
                                        <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                            Số điện thoại:
                                        <asp:TextBox ID="txtEditPhone" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                            Địa chỉ :
                                        <asp:TextBox ID="txtEditAdd" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                            Ảnh:
                                       <asp:Image ID="img" class="card-img-top rounded sp" runat="server" />
                                            <asp:TextBox ID="txtEditImage" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control btn btn-primary" />
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
                                            <h5 class="modal-title">Xóa người dùng</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn xóa người dùng này không?
                                       <asp:HiddenField ID="hfDeleteId" runat="server" />
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnConfirmDelete" runat="server" Text="Xóa" CommandName="cfmDelet" CssClass="btn btn-danger" OnClick="btnConfirmDelete_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- model Thêm -->
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnSave" />
                            <asp:PostBackTrigger ControlID="btnSearch" />
                        </Triggers>
                    </asp:UpdatePanel>

                </div>

            </div>
        </div>

    </form>
</asp:Content>
