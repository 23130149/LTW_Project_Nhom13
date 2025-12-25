
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/cart.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <meta charset="UTF-8">
    <title>Giỏ Hàng</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://unsplash.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Header and Footer/Styles.css">
    <link rel="stylesheet" href="../css/cart.css">

</head>
<body>
<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="../html/trangchu.html">Handmade House</a>
            </div>
            <form class="search-form" action="#" method="GET">
                <input type="text" class="search-input" placeholder="Tìm kiếm bất cứ thứ gì..." aria-label="Tìm kiếm sản phẩm">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>
            <div class="icons" >
                <a href="../html/favourite.html" class="icon-btn" id="heartBtn">
                    <i class='bx  bx-heart'></i>
                </a>
                <a  href="../html/cart.html" class="icon-btn" id="cartBtn">
                    <i class='bx  bx-cart'></i>
                </a>
                <a href="../html/account.html" class="icon-btn" id="userBtn">
                    <i class='bx  bx-user'></i>
                </a>
            </div>
        </div>
    </div>
    <div class="search-bar-section header-bottom-nav">
        <div class="container nav-only-container">
            <nav class="nav__links" >
                <ul>
                    <li><a href="../html/trangchu.html">Trang chủ</a></li>
                    <li><a href="../html/sanpham.html">Sản phẩm</a></li>
                    <li><a href="../html/blog.html">Blog</a></li>
                    <li><a href="../html/contact.html">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<section class="cart-page">
    <div class="cart-header">
        <h1><i class='bx bx-cart'></i> Giỏ Hàng Của Bạn</h1>
    </div>

    <div class="cart-container">
        <div class="cart-items">
            <div class="cart-item">
                <img src="https://i.pinimg.com/736x/9c/0f/da/9c0fda2d42833544fba28360869fd5e8.jpg" alt="Móc Khóa Lá Cờ Việt Nam">

                <div class="product-info">
                    <div class="product-name">Móc Khóa Lá Cờ Việt Nam</div>
                    <div class="product-descr">Chiếc móc len tự hào và yêu nước</div>
                </div>

                <div class="qty-price">
                    <div class="qty-control">
                        <button>-</button>
                        <span>1</span>
                        <button>+</button>
                    </div>
                    <div class="product-price">15.000đ</div>
                </div>

                <i class='bx bx-trash'></i>
            </div>

            <div class="cart-item">
                <img src="https://i.pinimg.com/1200x/b3/3a/48/b33a48da7c9b720dee8f5f439ad8f12e.jpg" alt="Nến Thơm Xương Rồng">

                <div class="product-info">
                    <div class="product-name">Nến Thơm Xương Rồng</div>
                    <div class="product-descr">Một chậu nến thơm đáng iu</div>
                </div>

                <div class="qty-price">
                    <div class="qty-control">
                        <button>-</button>
                        <span>1</span>
                        <button>+</button>
                    </div>
                    <div class="product-price">150.000đ</div>
                </div>

                <i class='bx bx-trash'></i>
            </div>
        </div>

        <div class="cart-total">
            <h3>Đơn Hàng Của Bạn</h3>
            <div class="line"><span>Tổng tiền</span><span>165.000đ</span></div>
            <div class="line"><span>Phí vận chuyển</span><span>Miễn phí</span></div>
            <div class="line"><span>Giảm giá:</span><span>0đ</span></div>
            <div class="voucher">
                <input type="text" placeholder="Nhập mã giảm giá">
                <button>Áp dụng</button>
            </div>
            <a href="../html/payment.html" class="checkout-button">
                Tiến hành thanh toán
            </a>
        </div>
    </div>
</section>
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-column">
                <h3 class="footer-logo">Handmade House</h3>
                <p class="footer-desc">Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn yêu nghệ thuật và thủ công.</p>
                <div class="social-links">
                    <a href="#"><i class="bx bxl-facebook"></i></a>
                    <a href="#"><i class="bx bxl-instagram"></i></a>
                    <a href="#"><i class="bx bxl-tiktok"></i></a>
                </div>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Blog</h3>
                <ul class="footer-links">
                    <li> <a href="#">Câu chuyện thương hiệu</a></li>
                    <li> <a href="#"> Giá trị & Triết lý thương hiệu</a></li>
                    <li> <a href="#">Quy trình sản xuất</a></li>
                    <li> <a href="#">Cam kết & Định hướng bền vững</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Hỗ trợ</h3>
                <ul class="footer-links">
                    <li> <a href="#">Chính sách đổi trả</a></li>
                    <li> <a href="#">Hướng dẫn đặt hàng</a></li>
                    <li> <a href="#">Phương thức thanh toán</a></li>
                    <li> <a href="#">Câu hỏi thường gặp</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Liên hệ</h3>
                <ul class="footer-links">
                    <li>📍 Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh</li>
                    <li>📞 0944912685</li>
                    <li>📧 handmadehouse23@handmade.vn</li>
                    <li>🕐 T2 - CN: 8:00 - 17:00</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>@2025 Handmade. Tất cả quyền được bảo lưu.</p>
        </div>
    </div>
</footer>

</body>
</html>
