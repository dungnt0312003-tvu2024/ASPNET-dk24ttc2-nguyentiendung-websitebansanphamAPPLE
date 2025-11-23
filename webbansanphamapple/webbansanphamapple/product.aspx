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
    <!-- HERO -->
    <section class="py-5 text-center bg-white border-bottom p-5 m-5">
        <div class="container">
            <h1 class="display-5 fw-bold">Cửa hàng Apple</h1>
            <p class="lead">Khám phá các sản phẩm Apple mới nhất với giá tốt nhất.</p>
        </div>
    </section>


    <!-- PRODUCT LIST -->
    
    <form runat="server">
       <div class="container ">
           <div class="row">
               <div class="col-xl-10">
                   <asp:TextBox ID="txtSearch" runat="server" Class="form-control" Placeholder="Search.." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" />
               </div>
               <div class="col-sm-2">
                   <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" class="btn btn-primary mb-3" OnClick="btnSearch_Click" />
               </div>
            </div>
        </div>
        <section class="py-5" id="products">
            <div class="container">
                <div class="row g-4">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <!-- iPhone 16 Pro -->
                            <div class="col-md-4">
                                <div class="card h-100 shadow-sm">
                                    <!-- <img src="img/products/ip15.jpg" class="card-img-top" alt="iPhone 16 Pro" />-->
                                    <asp:Image  class="card-img-top" ImageUrl='<%#  Eval("ImageUrl") %>' runat="server" />
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            <asp:Label runat="server" Text=' <%#  Eval("Name") %>'> </asp:Label>
                                        </h5>
                                        <p class="card-text">
                                            <asp:Label runat="server" Text=' <%#  Eval("Description") %>'> </asp:Label>
                                        </p>
                                        <p class="fw-bold text-danger">
                                            <asp:Label runat="server" Text=' <%#  Eval("Price") %>'>Giá :  </asp:Label>
                                        </p>
                                        <a href="#" class="btn btn-outline-primary w-100">Mua ngay</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>        

    </form>


    <!-- FOOTER -->
    <footer class="py-4 bg-dark text-light ">
        <div class="navbar-nav mx-auto col-md-10">
            <p class="mb-0">© Nguyễn Tiến Dũng</p>
            <p class="mb-0">Chuyên đề ASP.NET</p>
            <p class="mb-0">© Đại học Trà Vinh</p>
        </div>
    </footer>

    <div class="modal fade" id="productModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-5">
                            <img src="ssadsd" id="modalImg" class="img-fluid rounded" />
                        </div>
                        <div class="col-md-7">
                            <p id="modalDesc"></p>
                            <p class="fw-bold text-danger" id="modalPrice"></p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary w-100">Mua ngay</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        document.getElementById("myInput").addEventListener("keyup", function () {
            var keyword = this.value.toLowerCase();
            var rows = document.querySelectorAll("#myTable tr");

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                row.style.display = text.includes(keyword) ? "" : "none";
            });
    </script>

    <script>
            // Gắn sự kiện click cho sản phẩm
            document.querySelectorAll('.card').forEach(card => {
                card.addEventListener('click', function () {
                    const title = this.querySelector('.card-title').innerText;
                    const desc = this.querySelector('.card-text').innerText;
                    const price = this.querySelector('.fw-bold.text-danger').innerText;
                    const img = this.querySelector('img').src;

                    document.getElementById('modalTitle').innerText = title;
                    document.getElementById('modalDesc').innerText = desc;
                    document.getElementById('modalPrice').innerText = price;
                    document.getElementById('modalImg').src = img;

                    const modal = new bootstrap.Modal(document.getElementById('productModal'));
                    modal.show();
                });
            });

    </script>

</body>
</html>
