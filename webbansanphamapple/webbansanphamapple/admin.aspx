<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="webbansanphamapple.admin" %>

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
    <div accesskey="main-content" class="container-fluid">
        <h2>Admin Page</h2>
        <p>Welcome to the admin section of the Apple Product Store.</p>
        </div>
</body>
</html>
