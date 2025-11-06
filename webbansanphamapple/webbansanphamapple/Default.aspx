<%@ Page Title="" Language="C#" MasterPageFile="~/gDien.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webbansanphamapple.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!doctype html>
        <html lang="vi">
        <head>
          <meta charset="utf-8" />
          <meta name="viewport" content="width=device-width,initial-scale=1" />
          <title>Apple Store - Cửa hàng điện thoại</title>
          <meta name="description" content="Cửa hàng bán điện thoại Apple - iPhone chính hãng. Trang demo responsive với giỏ hàng đơn giản." />
          <script src="https://cdn.tailwindcss.com"></script>
          <style>
            /* Small custom touches beyond Tailwind */
            .product-img { height: 220px; object-fit: cover; }
            @media (min-width: 1024px) { .product-img { height: 200px } }
            .backdrop-blur { backdrop-filter: blur(6px); }
          </style>
        </head>
        <body class="bg-gray-50 text-gray-800 antialiased">
          <!-- Header -->
          <header class="bg-white shadow sticky top-0 z-40">
            <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
              <div class="flex items-center justify-between h-16">
                <div class="flex items-center gap-4">
                  <a href="#" class="text-2xl font-extrabold text-rose-600">AppleShop</a>
                  <nav class="hidden md:flex gap-4 text-sm">
                    <a href="#products" class="hover:text-rose-600">Sản phẩm</a>
                    <a href="#about" class="hover:text-rose-600">Giới thiệu</a>
                    <a href="#contact" class="hover:text-rose-600">Liên hệ</a>
                  </nav>
                </div>
                <div class="flex items-center gap-3">
                  <button id="cartBtn" class="relative inline-flex items-center px-3 py-2 border rounded-md bg-white hover:shadow">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4"/></svg>
                    <span id="cartCount" class="ml-2 text-sm">0</span>
                  </button>
                </div>
              </div>
            </div>
          </header>

          <!-- Hero -->
          <main class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 mt-8">
            <section class="bg-gradient-to-r from-rose-50 to-white rounded-2xl p-6 shadow-sm flex flex-col lg:flex-row gap-6 items-center">
              <div class="flex-1">
                <h1 class="text-3xl sm:text-4xl font-extrabold">iPhone chính hãng — Giá tốt, Giao nhanh</h1>
                <p class="mt-3 text-gray-600">Chọn mẫu iPhone mới nhất hoặc classic. Bảo hành chính hãng, hỗ trợ trả góp, giao hàng toàn quốc.</p>
                <div class="mt-5 flex gap-3">
                  <a href="#products" class="inline-block px-5 py-3 bg-rose-600 text-white rounded-md shadow hover:bg-rose-700">Xem sản phẩm</a>
                  <a href="#contact" class="inline-block px-5 py-3 border rounded-md">Liên hệ tư vấn</a>
                </div>
              </div>
              <div class="w-full lg:w-1/2">
                <img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1400&auto=format&fit=crop&ixlib=rb-4.0.3&s=0a2e0b3c27f9b5d2dbe5b2b0c9c0a7ca" alt="iPhone" class="rounded-xl shadow-lg w-full"/>
              </div>
            </section>

            <!-- Products -->
            <section id="products" class="mt-10">
              <div class="flex items-center justify-between">
                <h2 class="text-2xl font-bold">Điện thoại Apple</h2>
                <div class="text-sm text-gray-600">Hiển thị <span id="productCount">0</span> sản phẩm</div>
              </div>

              <div id="productGrid" class="mt-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6"></div>
            </section>

            <!-- About & Contact -->
            <section id="about" class="mt-12 bg-white rounded-lg p-6 shadow">
              <h3 class="text-xl font-semibold">Về cửa hàng</h3>
              <p class="mt-2 text-gray-600">Trang demo bán hàng iPhone — giao diện mẫu có giỏ hàng đơn giản, responsive và tối ưu cho mobile.</p>
            </section>

            <section id="contact" class="mt-6 grid grid-cols-1 md:grid-cols-2 gap-6">
              <div class="bg-white rounded-lg p-6 shadow">
                <h4 class="font-semibold">Liên hệ</h4>
                <p class="text-sm text-gray-600 mt-2">Email: support@appleshop.example • Điện thoại: 0123-456-789</p>
                <form id="contactForm" class="mt-4 grid gap-3">
                  <input required class="border rounded px-3 py-2" placeholder="Họ tên" />
                  <input required type="email" class="border rounded px-3 py-2" placeholder="Email" />
                  <textarea class="border rounded px-3 py-2" rows="3" placeholder="Nội dung"></textarea>
                  <button class="px-4 py-2 bg-rose-600 text-white rounded">Gửi</button>
                </form>
              </div>
              <div class="bg-white rounded-lg p-6 shadow">
                <h4 class="font-semibold">Thông tin giao hàng</h4>
                <p class="text-sm text-gray-600 mt-2">Hỗ trợ giao hàng toàn quốc, nhận đổi trả theo chính sách bảo hành nhà sản xuất.</p>
              </div>
            </section>

          </main>

          <!-- Cart Sidebar (hidden by default) -->
          <aside id="cartPanel" class="fixed right-4 top-20 w-80 bg-white rounded-xl shadow-xl p-4 transform translate-x-full transition-transform duration-300 z-50">
            <h4 class="font-semibold">Giỏ hàng</h4>
            <div id="cartItems" class="mt-3 space-y-3 max-h-64 overflow-auto"></div>
            <div class="mt-4 flex items-center justify-between font-semibold">
              <div>Tổng</div>
              <div id="cartTotal">0₫</div>
            </div>
            <div class="mt-4 flex gap-2">
              <button id="checkoutBtn" class="flex-1 px-3 py-2 bg-rose-600 text-white rounded">Thanh toán</button>
              <button id="closeCart" class="px-3 py-2 border rounded">Đóng</button>
            </div>
          </aside>

          <!-- Template for product card (used by JS) -->
          <template id="productTemplate">
            <article class="bg-white rounded-lg overflow-hidden shadow hover:shadow-lg transition">
              <img class="w-full product-img" alt="">
              <div class="p-4">
                <h5 class="font-semibold text-lg"></h5>
                <p class="mt-1 text-sm text-gray-600"></p>
                <div class="mt-3 flex items-center justify-between">
                  <div class="font-bold text-rose-600"></div>
                  <button class="addBtn px-3 py-1 bg-rose-600 text-white rounded">Thêm</button>
                </div>
              </div>
            </article>
          </template>

          <script>
              // Sample product data (in real site these come from server)
              const products = [
                  { id: 'ip15', name: 'iPhone 15 Pro', price: 32990000, desc: '6.1" • A17 • 256GB', img: 'https://images.unsplash.com/photo-1692115547027-0c1bf7b6d35a?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&s=2c2b1d1d4e' },
                  { id: 'ip15p', name: 'iPhone 15 Pro Max', price: 38990000, desc: '6.7" • A17 • 512GB', img: 'https://images.unsplash.com/photo-1603898037225-6acb1b2291d2?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&s=1a1a1a1a1a' },
                  { id: 'ip14', name: 'iPhone 14', price: 19990000, desc: '6.1" • A15 • 128GB', img: 'https://images.unsplash.com/photo-1549921296-3c3f3b4498b0?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&s=3b3b3b3b3b' },
                  { id: 'se3', name: 'iPhone SE (2022)', price: 9990000, desc: '4.7" • A15 • 64GB', img: 'https://images.unsplash.com/photo-1585386959984-a4155226f8ec?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&s=4c4c4c4c4c' },
                  { id: 'ip13', name: 'iPhone 13', price: 12990000, desc: '6.1" • A15 • 128GB', img: 'https://images.unsplash.com/photo-1621930761397-66c2d3f13b7a?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&s=5d5d5d5d5d' },
                  { id: 'mini', name: 'iPhone 12 mini', price: 8490000, desc: '5.4" • A14 • 64GB', img: 'https://images.unsplash.com/photo-1603898037226-7b2b1b2291d2?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&s=6e6e6e6e6e' }
              ];

              // Utilities
              const formatVND = v => v.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.') + '₫';

              // Render products
              const grid = document.getElementById('productGrid');
              const tpl = document.getElementById('productTemplate');
              products.forEach(p => {
                  const node = tpl.content.cloneNode(true);
                  node.querySelector('img').src = p.img;
                  node.querySelector('img').alt = p.name;
                  node.querySelector('h5').textContent = p.name;
                  node.querySelector('p').textContent = p.desc;
                  node.querySelector('.font-bold').textContent = formatVND(p.price);
                  node.querySelector('.addBtn').addEventListener('click', () => addToCart(p));
                  grid.appendChild(node);
              });
              document.getElementById('productCount').textContent = products.length;

              // Cart logic
              let cart = {}; // id -> {product, qty}
              const cartCountEl = document.getElementById('cartCount');
              const cartPanel = document.getElementById('cartPanel');
              const cartItemsEl = document.getElementById('cartItems');
              const cartTotalEl = document.getElementById('cartTotal');

              function addToCart(product) {
                  if (!cart[product.id]) cart[product.id] = { product, qty: 0 };
                  cart[product.id].qty += 1;
                  updateCartUI();
                  openCart();
              }

              function updateCartUI() {
                  // count
                  const totalQty = Object.values(cart).reduce((s, e) => s + e.qty, 0);
                  cartCountEl.textContent = totalQty;

                  // items
                  cartItemsEl.innerHTML = '';
                  let total = 0;
                  Object.values(cart).forEach(entry => {
                      const row = document.createElement('div');
                      row.className = 'flex items-center gap-3';
                      row.innerHTML = `
                  <img src="${entry.product.img}" alt="" class="w-12 h-12 object-cover rounded">
                  <div class="flex-1 text-sm">
                    <div class="font-medium">${entry.product.name}</div>
                    <div class="text-gray-500">${formatVND(entry.product.price)}</div>
                  </div>
                  <div class="flex items-center gap-2">
                    <button class="px-2 py-1 border rounded" data-id="${entry.product.id}" data-op="dec">-</button>
                    <div>${entry.qty}</div>
                    <button class="px-2 py-1 border rounded" data-id="${entry.product.id}" data-op="inc">+</button>
                  </div>
                `;
                      cartItemsEl.appendChild(row);
                      total += entry.qty * entry.product.price;
                  });
                  cartTotalEl.textContent = formatVND(total);

                  // attach listeners
                  cartItemsEl.querySelectorAll('button').forEach(b => {
                      b.addEventListener('click', () => {
                          const id = b.getAttribute('data-id');
                          const op = b.getAttribute('data-op');
                          if (op === 'inc') cart[id].qty += 1;
                          else { cart[id].qty -= 1; if (cart[id].qty <= 0) delete cart[id]; }
                          updateCartUI();
                      });
                  });
              }

              // Cart open/close
              function openCart() { cartPanel.classList.remove('translate-x-full'); }
              function closeCart() { cartPanel.classList.add('translate-x-full'); }

              document.getElementById('cartBtn').addEventListener('click', () => {
                  if (cartPanel.classList.contains('translate-x-full')) openCart(); else closeCart();
              });
              document.getElementById('closeCart').addEventListener('click', closeCart);

              // Checkout (demo)
              document.getElementById('checkoutBtn').addEventListener('click', () => {
                  if (Object.keys(cart).length === 0) { alert('Giỏ hàng trống'); return; }
                  // Demo: show simple confirmation
                  alert('Cảm ơn bạn! (Demo) Đơn hàng đã được ghi nhận.');
                  cart = {}; updateCartUI(); closeCart();
              });

              // Contact form handling (demo)
              document.getElementById('contactForm').addEventListener('submit', (e) => {
                  e.preventDefault();
                  alert('Cảm ơn bạn đã gửi liên hệ!');
                  e.target.reset();
              });

              // Initialize
              updateCartUI();
          </script>

          <footer class="mt-12 py-6 text-center text-sm text-gray-500">© 2025 AppleShop — Trang demo. Không phải trang chính thức của Apple.</footer>
        </body>
    </html>

</asp:Content>
