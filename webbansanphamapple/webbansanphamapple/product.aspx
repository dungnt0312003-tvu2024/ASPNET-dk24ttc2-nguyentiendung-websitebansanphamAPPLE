<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" MasterPageFile="~/Default.Master" Inherits="webbansanphamapple.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #form1 {
            width: 458px;
        }

            .uimg{
                width: 50px;
                height: 50px;
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form runat="server">
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
        <ul class="navbar-nav mx-auto col-md-8 ">
            <li class="nav-item">
                <a class="nav-link" href="default.aspx"><i class="bi bi-apple"></i>Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  active" href="product.aspx">Sản phẩm</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Liên hệ</a>
            </li>
        </ul>
        <!-- Đăng xuất -->
        <div class="dropdown navbar-nav ms-auto col-md-2" id="inf">
            <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">    
                <asp:Label ID="lblHello" class="text-light" Text="Xin chào :" runat="server" />
                <asp:Image runat="server" class="uimg rounded-circle" ID="uimg" />    
               <i class="bi bi-arrow-down-square text-bg-light"></i>
            </button>
            <ul class="dropdown-menu">
                <li >
                    <asp:Button runat="server" class="btn  mb-3" Text="Đăng xuất" OnClick="log_out" />
                </li>
                <li>
                    <asp:Button runat="server" class="btn  mb-3" Text="Thay đổi thông tin" OnClick="user_change_Click" />
                </li>
            </ul>
        </div>
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
    <section class="py-5 text-center bg-white border-bottom m-5">
        <div class="container">
            <h1 class="display-5 fw-bold">Cửa hàng Apple</h1>
            <p class="lead">Khám phá các sản phẩm Apple mới nhất với giá tốt nhất.</p>
        </div>
    </section>
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
                                    <div class="container">
                                        <asp:Image  class="card-img-top sp" ImageUrl='<%#  Eval("ImageUrl") %>' runat="server" />
                                    </div>
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

   

<!-- modal sản phẩm -->
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
                            <img src="ssadsd" id="modalImg" class="img-fluid rounded sp" />
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
   </form>
</asp:Content>


