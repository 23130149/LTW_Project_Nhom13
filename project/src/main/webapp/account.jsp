
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/account.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <meta charset="UTF-8">
    <title>Tài khoản của tôi - Handmade House</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://unsplash.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style> main.about-us-container {
        width: 90%;
        max-width: 900px;
        margin: 0 auto;
        padding-top: 150px;
        padding-bottom: 80px;
    }

    .about-us-container h1 {
        font-size: 2.5rem;
        color: #11998e;
        margin-bottom: 30px;
        text-align: center;
        font-weight: 700;
    }


    .account-info {
        text-align: center;
        background: #fcfcfc;
        border: 1px solid #eee;
        padding: 30px;
        border-radius: 8px;
        margin-bottom: 40px;
    }

    .account-info i {
        font-size: 60px;
        color: #11998e;
        margin-bottom: 15px;
        display: block;
    }

    .account-info h3 {
        font-size: 1.5rem;
        color: #333;
        font-weight: 600;
        margin-bottom: 5px;
    }

    .account-info p {
        font-size: 1rem;
        color: #666;
        margin: 0;
    }


    .account-menu {
        list-style: none;
        padding: 0;
        margin: 0 0 40px 0;
        border: 1px solid #eee;
        border-radius: 8px;
        overflow: hidden;
    }

    .account-menu li {
        border-bottom: 1px solid #eee;
    }

    .account-menu li:last-child {
        border-bottom: none;
    }

    .account-menu a {
        display: flex;
        align-items: center;
        padding: 20px;
        text-decoration: none;
        color: #333;
        font-size: 1.1rem;
        font-weight: 500;
        transition: background-color 0.3s, color 0.3s;
    }

    .account-menu a:hover {
        background-color: #f9f9ff;
        color: #11998e;
    }

    .account-menu a i {
        font-size: 24px;
        margin-right: 20px;
        width: 30px;
        text-align: center;
        color: #38ef7d; /* Màu phụ */
    }


    .recent-orders-box {
        background: #fcfcfc;
        border: 1px solid #eee;
        padding: 30px;
        border-radius: 8px;
        margin-bottom: 40px;
    }

    .recent-orders-box h2 {
        font-size: 1.8rem;
        font-weight: 600;
        color: #333;
        margin-bottom: 20px;
        border-bottom: 2px solid #38ef7d;
        padding-bottom: 10px;
    }

    .orders-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .orders-table th,
    .orders-table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #eee;
    }

    .orders-table th {
        background-color: #f9f9f9;
        font-weight: 600;
        font-size: 0.9rem;
        color: #555;
        text-transform: uppercase;
    }

    .orders-table td {
        font-size: 0.95rem;
        color: #444;
    }

    .orders-table td .status-delivered {
        color: #28a745;
        font-weight: 600;
    }

    .orders-table td .status-processing {
        color: #ffc107;
        font-weight: 600;
    }

    .view-all-orders {
        display: inline-block;
        text-decoration: none;
        color: #11998e;
        font-weight: 600;
        transition: color 0.3s;
    }

    .view-all-orders:hover {
        color: #38ef7d;
    }


    .btn-logout {
        display: block;
        width: 100%;
        text-align: center;
        background: #FF5E62;
        color: white;
        padding: 14px 40px;
        border-radius: 30px;
        font-weight: 600;
        transition: all 0.3s ease;
        text-decoration: none;
        border: none;
        font-size: 1rem;
    }

    .btn-logout:hover {
        opacity: 0.9;
        box-shadow: 0 4px 10px rgba(255, 94, 98, 0.2);
        transform: translateY(-2px);
    }</style>
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
<main class="about-us-container"> <h1>Tài khoản của tôi</h1>

    <div class="account-info">
        <i class='bx bxs-user-circle'></i>
        <h3>23130258@st.hcmuaf.edu.vn</h3>
        <p>Xin chào, Quan!</p>
    </div>

    <ul class="account-menu">
        <li>
            <a href="#">
                <i class='bx bx-receipt'></i>
                <span>Lịch sử đơn hàng</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-edit-alt'></i>
                <span>Thông tin cá nhân</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-lock-alt'></i>
                <span>Đổi mật khẩu</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-map'></i>
                <span>Sổ địa chỉ</span>
            </a>
        </li>
    </ul>

    <div class="recent-orders-box">
        <h2>Đơn hàng gần đây</h2>
        <table class="orders-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Ngày đặt</th>
                <th>Sản phẩm</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>#1205</td>
                <td>05/11/2025</td>
                <td>Nến thơm xương rồng (x1)</td>
                <td>150.000đ</td>
                <td><span class="status-delivered">Đã giao</span></td>
            </tr>
            <tr>
                <td>#1201</td>
                <td>01/11/2025</td>
                <td>Túi hoa Tulip (x2)</td>
                <td>240.000đ</td>
                <td><span class="status-delivered">Đã giao</span></td>
            </tr>
            <tr>
                <td>#1208</td>
                <td>08/11/2025</td>
                <td>Móc khóa lá cờ (x3)</td>
                <td>45.000đ</td>
                <td><span class="status-processing">Đang xử lý</span></td>
            </tr>
            </tbody>
        </table>
        <a href="#" class="view-all-orders">Xem tất cả đơn hàng &rarr;</a>
    </div>
    <a href="../html/dangnhap.html" class="btn-logout">Đăng xuất</a>
</main>
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
                <h3 class="footer-title">Về chúng tôi</h3>
                <ul class="footer-links">
                    <li> <a href="#">Câu chuyện thương hiệu</a></li>
                    <li> <a href="#">Nghệ nhân</a></li>
                    <li> <a href="#">Quy trình sản xuất</a></li>
                    <li> <a href="#">Tuyển dụng</a></li>
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