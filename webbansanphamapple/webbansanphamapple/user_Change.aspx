<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="user_Change.aspx.cs" Inherits="webbansanphamapple.user_Change" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .uimg{
            width: 50px;
            height: 50px;
        }
        img{
            width: 250px;
                height:250px;
        }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <!-- NAVBAR -->
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
                <ul class="navbar-nav mx-auto col-md-8 ">
                    <li class="nav-item">
                        <a class="nav-link" href="default.aspx">
                            <i class="bi bi-apple"></i>
                            Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="product.aspx">Sản phẩm</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                </ul>
                                <!-- Đăng xuất -->
                <ul class="navbar-nav ms-auto col-md-2" id="inf">
                    <li class="nav-item p-2">
                        <asp:Label ID="lblHello" class="text-light" Text="Xin chào :" runat="server" />
                        <asp:Image runat="server" class="uimg rounded-circle" id="uimg"/>
                    </li>
                    <li class="nav-item p-2">
                        <asp:Button runat="server" class="btn btn-primary mb-3" Text="Đăng xuất" OnClick="log_out" />
                    </li>

                </ul>

                <!-- Đăng nhập / Đăng ký -->
                <ul class="navbar-nav ms-auto col-md-2" id="login">
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

        <section class=" m-5 border-bottom p-5">
            <div class="container">
                <asp:Image runat="server" ID="Image1" class="rounded-circle img" />
            </div>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control btn btn-primary" placeholder="Đổi ảnh đại diện"/>
            <asp:Label ID="lbkq" runat="server"></asp:Label>
            <br />
            Tên người dùng<asp:TextBox ID="txtUser" runat="server" CssClass="form-control" ></asp:TextBox>
            <br />
             Password
                 <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox>
            <br />
            Nhập lại Password
                 <asp:TextBox ID="txtPass2" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox>
            <br />
            Họ và Tên
                 <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control" ></asp:TextBox>
            <br />
            Địa chỉ
                 <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" ></asp:TextBox>
            <br />
            Địa chỉ Email
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" ></asp:TextBox>
            <br />
            Số điện thoại
                 <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" ></asp:TextBox>
            <br />
            <asp:Button ID="btchannged" runat="server" Text="Thay đổi" class="btn btn-primary" OnClick="btchannged_Click" />

        </section>
    </form>
</asp:Content>
