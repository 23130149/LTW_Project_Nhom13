<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên Hệ</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/contact.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>

<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">Handmade House</a>
            </div>
            <form class="search-form" action="${pageContext.request.contextPath}/product" method="GET">
                <input type="text" class="search-input" name="keyword" value="${keyword}" placeholder="Tìm kiếm bất cứ thứ gì" aria-label="Tìm kiếm sản phẩm" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>
            <div class="icons">
                <a href="${pageContext.request.contextPath}/cart" class="icon-btn cart-icon">
                    <span class="cart-wrap">
                        <i class="bx bx-cart"></i>
                        <span class="cart-badge ${cart.totalQuantity == 0 ? 'hidden' : ''}">
                            ${cart.totalQuantity}
                        </span>
                    </span>
                </a>
                <a href="${pageContext.request.contextPath}/Account" class="icon-btn" id="userBtn">
                    <i class='bx  bx-user'></i>
                </a>
            </div>
        </div>
    </div>
    <div class="search-bar-section header-bottom-nav">
        <div class="container nav-only-container">
            <nav class="nav__links">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<section class="banner">
    <div class="banner-content">
        <h2>Liên Hệ Với Chúng Tôi</h2>
        <p>Chúng tôi rất mong được nghe từ bạn! Hãy chia sẻ ý tưởng, câu hỏi hoặc một lời chào thân thiện.</p>
    </div>
</section>

<section class="info-section">
    <div class="info-card">
        <i class='bx bx-map'></i>
        <h3>Địa chỉ</h3>
        <p>789 Linh Trung, Thủ Đức, TP.HCM</p>
    </div>

    <div class="info-card">
        <i class='bx bx-envelope'></i>
        <h3>Email</h3>
        <p>hello@handmadehouse.vn</p>
    </div>

    <div class="info-card">
        <i class='bx bx-phone'></i>
        <h3>Điện thoại</h3>
        <p>0123 456 789</p>
    </div>

    <div class="info-card">
        <i class='bx bx-time'></i>
        <h3>Giờ làm việc</h3>
        <p>8:00 – 20:00 (Thứ 2 - Chủ Nhật)</p>
    </div>
</section>

<section class="contact-container">

    <div class="contact-form">
        <h2>Gửi Tin Nhắn</h2>
        <p>Điền thông tin vào form dưới đây, chúng tôi sẽ phản hồi trong vòng 24 giờ.</p>

        <!-- MESSAGE -->
        <c:if test="${not empty error}">
            <p style="color:red; margin-bottom:12px;">${error}</p>
        </c:if>

        <c:if test="${not empty success}">
            <p style="color:green; margin-bottom:12px;">${success}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/Contact"
              method="post">

            <label>Họ và tên *</label>
            <input type="text"
                   name="name"
                   placeholder="Nhập họ tên của bạn"
                   required>

            <div class="row">
                <div class="col">
                    <label>Email *</label>
                    <input type="email"
                           name="email"
                           placeholder="example@email.com"
                           required>
                </div>

                <div class="col">
                    <label>Số điện thoại</label>
                    <input type="text"
                           name="phone"
                           placeholder="0123 456 789">
                </div>
            </div>

            <label>Tiêu đề *</label>
            <input type="text"
                   name="subject"
                   placeholder="Bạn muốn hỏi về điều gì?"
                   required>

            <label>Nội dung tin nhắn *</label>
            <textarea name="message"
                      placeholder="Chia sẻ suy nghĩ của bạn với chúng tôi..."
                      required></textarea>

            <button type="submit">Gửi tin nhắn</button>
        </form>
    </div>

    <div class="sidebar">

        <div class="side-box">
            <h3>🐤 Đặt Hàng Custom</h3>
            <p>Bạn có ý tưởng riêng cho sản phẩm handmade? Chúng tôi nhận đặt hàng custom theo yêu cầu của bạn!</p>
            <p>Liên hệ với chúng tôi để được tư vấn chi tiết về thiết kế, chất liệu và thời gian thực hiện.</p>
        </div>

        <div class="side-box">
            <h3>❤️ Ưu Đãi Đặc Biệt</h3>
            <p>Nhận ngay mã giảm giá 10% cho lần mua hàng đầu tiên khi đăng ký nhận bản tin.</p>
            <p>Nhập email trong form liên hệ và ghi chú "Đăng ký nhận tin".</p>
        </div>

    </div>
</section>

<footer class="footer">
    <div class="container">
        <div class="footer-content">

            <div class="footer-column">
                <h3 class="footer-logo">Handmade House</h3>
                <p class="footer-desc">
                    Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn yêu nghệ thuật và thủ công.
                </p>
                <div class="social-links">
                    <a href="#"><i class="bx bxl-facebook"></i></a>
                    <a href="#"><i class="bx bxl-instagram"></i></a>
                    <a href="#"><i class="bx bxl-tiktok"></i></a>
                </div>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Blog</h3>
                <ul class="footer-links">
                    <li><a href="#">Câu chuyện thương hiệu</a></li>
                    <li><a href="#">Giá trị & Triết lý</a></li>
                    <li><a href="#">Quy trình sản xuất</a></li>
                    <li><a href="#">Định hướng bền vững</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Hỗ trợ</h3>
                <ul class="footer-links">
                    <li><a href="#">Chính sách đổi trả</a></li>
                    <li><a href="#">Hướng dẫn đặt hàng</a></li>
                    <li><a href="#">Thanh toán</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Liên hệ</h3>
                <ul class="footer-links">
                    <li>📍 Thủ Đức, TP.HCM</li>
                    <li>📞 0944912685</li>
                    <li>📧 handmadehouse23@handmade.vn</li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom">
            <p>© 2025 Handmade House. Tất cả quyền được bảo lưu.</p>
        </div>
    </div>
</footer>

</body>
</html>
