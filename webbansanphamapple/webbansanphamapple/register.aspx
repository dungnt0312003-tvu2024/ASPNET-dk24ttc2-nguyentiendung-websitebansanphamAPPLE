<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" MasterPageFile="~/Default.Master" Inherits="webbansanphamapple.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- NAVBAR -->
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
        <!-- Đăng nhập / Đăng ký -->
        <ul class="navbar-nav ms-auto col-md-2">
            <li class="nav-item">
                <a class="nav-link" href="login.aspx">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  active" href="register.aspx">Đăng ký</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Giỏ hàng (0)</a>
            </li>
        </ul>
    </nav>
    <!-- register form-->

    <form id="form1" runat="server">
        <asp:Label ID="lbkq" runat="server"></asp:Label>
        <br />
        Nhập Username<asp:TextBox ID="txtUser" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        Nhập Password
     <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        Nhập lại Password
     <asp:TextBox ID="txtPass2" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        Nhập Fullname
     <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        Nhập Address
     <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Button ID="btSignup" runat="server" Text="Đăng ký" OnClick="btSignup_Click" />
    </form>


</asp:Content>


