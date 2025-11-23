<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="webbansanphamapple._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset="utf-8" />
    <link href="~/content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <title>Apple Product Store</title>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
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


    <!-- PRODUCT LIST -->
    <section class="py-5" id="products">
        <div class="container">
            <h2 class="mb-4 fw-semibold">Danh sách sản phẩm</h2>


            <div class="row g-4">
                <!-- iPhone 16 Pro -->
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="img/products/ip15.jpg" class="card-img-top" alt="iPhone 16 Pro" />
                        <div class="card-body">
                            <h5 class="card-title">iPhone 16 Pro</h5>
                            <p class="card-text">Chip A18 Pro, khung Titanium, Camera 48MP.</p>
                            <p class="fw-bold text-danger">Giá: 29.990.000₫</p>
                            <a href="#" class="btn btn-outline-primary w-100">Mua ngay</a>
                        </div>
                    </div>
                </div>


                <!-- iPhone 15 Pro Max -->
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="img/products/ip15.jpg" class="card-img-top" alt="iPhone 15 Pro Max" />
                        <div class="card-body">
                            <h5 class="card-title">iPhone 15 Pro Max</h5>
                            <p class="card-text">Titanium đẳng cấp, Camera Tele 5x.</p>
                            <p class="fw-bold text-danger">Giá: 27.490.000₫</p>
                            <a href="#" class="btn btn-outline-primary w-100">Mua ngay</a>
                        </div>
                    </div>
                </div>


                <!-- iPhone 14 -->
                <div class="col-md-4">
                    <div class="card h-100 shadow-sm">
                        <img src="img/products/imac.jpg" class="card-img-top" alt="iPhone 14" />
                        <div class="card-body">
                            <h5 class="card-title">iPhone 14</h5>
                            <p class="card-text">Màn hình Super Retina, Camera kép.</p>
                            <p class="fw-bold text-danger">Giá: 18.990.000₫</p>
                            <a href="#" class="btn btn-outline-primary w-100">Mua ngay</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


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
