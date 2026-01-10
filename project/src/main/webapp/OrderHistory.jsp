<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch sử đơn hàng - Handmade House</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/account.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>

<header class="header">
    <div class="header-top-container">
        <div class="header-content">

            <div class="logo">
                <a href="${pageContext.request.contextPath}/Home">Handmade House</a>
            </div>

            <form class="search-form"
                  action="${pageContext.request.contextPath}/Search"
                  method="GET">
                <input type="text"
                       class="search-input"
                       name="keyword"
                       placeholder="Tìm kiếm bất cứ thứ gì...">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>

            <div class="icons">
                <a href="${pageContext.request.contextPath}/Favourite" class="icon-btn">
                    <i class='bx bx-heart'></i>
                </a>
                <a href="${pageContext.request.contextPath}/Cart" class="icon-btn">
                    <i class='bx bx-cart'></i>
                </a>
                <a href="${pageContext.request.contextPath}/Account" class="icon-btn">
                    <i class='bx bx-user'></i>
                </a>
            </div>

        </div>
    </div>

    <div class="search-bar-section header-bottom-nav">
        <div class="container nav-only-container">
            <nav class="nav__links">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/Home">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/Products">Sản phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/Blog">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<main class="about-us-container">

    <h1>Lịch sử đơn hàng</h1>

    <div class="recent-orders-box">

        <c:choose>
            <c:when test="${empty orderList}">
                <p>Bạn chưa có đơn hàng nào.</p>
            </c:when>

            <c:otherwise>
                <table class="orders-table">
                    <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Chi tiết</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>#${order.orderCode}</td>
                            <td>${order.createAt}</td>
                            <td>${order.totalPrice}đ</td>
                            <td>
            <span class="status-${order.status}">
                <c:choose>
                    <c:when test="${order.status == 'delivered'}">
                        Đã giao
                    </c:when>
                    <c:when test="${order.status == 'processing'}">
                        Đang xử lý
                    </c:when>
                    <c:otherwise>
                        Chờ xác nhận
                    </c:otherwise>
                </c:choose>
            </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/OrderDetail?orderId=${order.orderId}"
                                   class="view-all-orders">
                                    Xem
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

    </div>

    <a href="${pageContext.request.contextPath}/Account"
       class="btn-logout"
       style="background:#11998e">
        Quay lại tài khoản
    </a>

</main>
<footer class="footer">
    <div class="container">

        <div class="footer-content">

            <div class="footer-column">
                <h3 class="footer-logo">Handmade House</h3>
                <p class="footer-desc">
                    Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn
                    yêu nghệ thuật và thủ công.
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
                    <li><a href="#">Phương thức thanh toán</a></li>
                    <li><a href="#">FAQ</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Liên hệ</h3>
                <ul class="footer-links">
                    <li>📍 Linh Trung, Thủ Đức, TP.HCM</li>
                    <li>📞 0944 912 685</li>
                    <li>📧 handmadehouse23@handmade.vn</li>
                    <li>🕐 8:00 - 17:00 (T2 - CN)</li>
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
