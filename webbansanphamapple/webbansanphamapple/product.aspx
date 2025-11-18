<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="webbansanphamapple.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <meta charset="utf-8" />
    <link href="~/content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <title>Product</title>
</head>
<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <ul class="navbar-nav mx-auto col-md-8 ">
            <li class="nav-item">
                <a class="nav-link " href="default.aspx">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="product.aspx">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Liên hệ</a>
            </li>
        </ul>
        <!-- Đăng nhập / Đăng ký -->
        <ul class="navbar-nav ms-auto col-md-2">
            <li class="nav-item">
                <a class="nav-link" href="#">Đăng nhập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Đăng ký</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Giỏ hàng (0)</a>
            </li>
        </ul>
    </nav>
    <!-- HERO -->
    <section class="py-5 text-center bg-white border-bottom">
        <div class="container">
            <h1 class="display-5 fw-bold">Cửa hàng điện thoại Apple</h1>
            <p class="lead">Khám phá các sản phẩm iPhone mới nhất với giá tốt nhất.</p>
            <a href="#products" class="btn btn-primary btn-lg px-4">Xem sản phẩm</a>
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
                        <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone16pro-gold" class="card-img-top" alt="iPhone 16 Pro" />
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
                        <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone15promax-black" class="card-img-top" alt="iPhone 15 Pro Max" />
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
                        <img src="https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone14-purple" class="card-img-top" alt="iPhone 14" />
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
    <footer class=" py-4 bg-dark text-light ">
        <div class="navbar-nav mx-auto col-md-10">
            <p class="mb-0">© Nguyễn Tiến Dũng</p>
            <p class="mb-0">Chuyên đề ASP.NET</p>
            <p class="mb-0">© Đại học Trà Vinh</p>
        </div>
    </footer>
</body>
</html>
