<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="webbansanphamapple.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset="utf-8" />
    <link href="~/content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <title>Apple Product Store</title>
    <style type="text/css">
        #form1 {
            width: 458px;
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
                <script>console.log('hello');</script>
                <a class="nav-link" href="#">Giỏ hàng (0)</a>
            </li>
        </ul>
    </nav>
    <!-- login form-->
    <form id="form1" runat="server" class="container-fluid" >
        <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
        <br />
        <asp:Button class="btn btn-primary" ID="btLogin" runat="server" Text="Login" OnClick="btLogin_Click" />
    </form>

    <!-- footer -->
    <footer class=" py-4 bg-dark text-light ">
        <div class="navbar-nav mx-auto col-md-10">
            <p class="mb-0">© Nguyễn Tiến Dũng</p>
            <p class="mb-0">Chuyên đề ASP.NET</p>
            <p class="mb-0">© Đại học Trà Vinh</p>
        </div>
    </footer>
    
</body>
</html>
