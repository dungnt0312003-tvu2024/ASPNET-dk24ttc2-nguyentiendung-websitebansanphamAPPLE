<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Default.Master"  CodeBehind="default.aspx.cs" Inherits="webbansanphamapple._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<!-- NAVBAR -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
    <ul class="navbar-nav mx-auto col-md-8 ">
        <li class="nav-item">
            <a class="nav-link active" href="default.aspx">Trang chủ</a>
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
            <a class="nav-link" href="register.aspx">Đăng ký</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Giỏ hàng (0)</a>
        </li>
    </ul>
</nav>
<!-- Carousel -->
<div id="demo" class="carousel slide h-75" data-bs-ride="carousel">

    <!-- Indicators/dots -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>

    <!-- The slideshow/carousel -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/Carousel/carosel3.jpg" class="d-block w-100" />
        </div>
        <div class="carousel-item">
            <img src="img/Carousel/carosel.jpg" class="d-block w-100" />
        </div>
        <div class="carousel-item">
            <img src="img/Carousel/carosel2.jpg" class="d-block w-100" />
        </div>
    </div>

    <!-- Left and right controls/icons -->
    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>
<!-- HERO -->
<section class="py-5 text-center bg-white border-bottom">
    <div class="container">
        <h1 class="display-5 fw-bold">Cửa hàng Apple</h1>
        <p class="lead">Khám phá các sản phẩm Apple mới nhất với giá tốt nhất.</p>
        <a href="product.aspx" class="btn btn-primary btn-lg px-4">Xem sản phẩm</a>
    </div>
</section>
</asp:Content>
