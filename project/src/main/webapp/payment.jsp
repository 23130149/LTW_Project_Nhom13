<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh Toán</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment.css">

    <!-- Icons & Fonts -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>

<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">Handmade House</a>
            </div>

            <form class="search-form" action="${pageContext.request.contextPath}/product" method="get">
                <input type="text" class="search-input" placeholder="Tìm kiếm bất cứ thứ gì...">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>

            <div class="icons">
                <a href="${pageContext.request.contextPath}/cart" class="icon-btn">
                    <i class="bx bx-cart"></i>
                </a>
                <a href="${pageContext.request.contextPath}/account" class="icon-btn">
                    <i class="bx bx-user"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- NAV -->
    <div class="search-bar-section header-bottom-nav">
        <div class="container nav-only-container">
            <nav class="nav__links">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/Blog">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<main class="checkout-container">

    <section class="shipping-info">
        <h2>📍 Địa Chỉ Nhận Hàng</h2>

        <c:choose>
            <c:when test="${address != null}">
                <p>
                        ${address.street},
                        ${address.district},
                        ${address.province},
                        ${address.country}
                </p>
                <a href="${pageContext.request.contextPath}/Address" class="change-btn">
                    Thay đổi
                </a>
            </c:when>

            <c:otherwise>
                <p>⚠️ Bạn chưa có địa chỉ nhận hàng</p>
                <a href="${pageContext.request.contextPath}/Address" class="change-btn">
                    Thêm địa chỉ
                </a>
            </c:otherwise>
        </c:choose>
    </section>

    <section class="product-list">
        <h2>Sản phẩm</h2>

        <c:forEach items="${cartItems}" var="item">
            <div class="product-item">
                <img src="${item.product.imageUrl}" alt="">

                <div class="product-detail">
                    <p class="product-name">${item.product.productName}</p>
                </div>

                <p class="product-price">
                    <fmt:formatNumber value="${item.price}" type="number"/>₫
                </p>

                <p class="product-qty">
                    x${item.quantity}
                </p>

                <p class="product-total">
                    <fmt:formatNumber value="${item.quantity * item.price}" type="number"/>₫
                </p>
            </div>
        </c:forEach>
    </section>

    <section class="summary">
        <div class="summary-row">
            <span>Tổng tiền hàng</span>
            <span>
                <fmt:formatNumber value="${totalPrice}" type="number"/>₫
            </span>
        </div>

        <div class="summary-row">
            <span>Phí vận chuyển</span>
            <span>
                <fmt:formatNumber value="${shippingFee}" type="number"/>₫
            </span>
        </div>

        <div class="summary-row total">
            <span>Tổng thanh toán</span>
            <span class="highlight">
                <fmt:formatNumber value="${grandTotal}" type="number"/>₫
            </span>
        </div>

        <form action="${pageContext.request.contextPath}/payment" method="post">
            <c:if test="${address != null}">
                <input type="hidden" name="addressId" value="${address.userAddressId}">
            </c:if>
            <button class="checkout-btn">Đặt hàng</button>
        </form>
    </section>
</main>

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
                    <li><a href="#">Giá trị & Triết lý thương hiệu</a></li>
                    <li><a href="#">Quy trình sản xuất</a></li>
                    <li><a href="#">Cam kết & Định hướng bền vững</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Hỗ trợ</h3>
                <ul class="footer-links">
                    <li><a href="#">Chính sách đổi trả</a></li>
                    <li><a href="#">Hướng dẫn đặt hàng</a></li>
                    <li><a href="#">Phương thức thanh toán</a></li>
                    <li><a href="#">Câu hỏi thường gặp</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Liên hệ</h3>
                <ul class="footer-links">
                    <li>📍 TP. Thủ Đức, TP. Hồ Chí Minh</li>
                    <li>📞 0944912685</li>
                    <li>📧 handmadehouse23@handmade.vn</li>
                    <li>🕐 T2 - CN: 8:00 - 17:00</li>
                </ul>
            </div>

        </div>

        <div class="footer-bottom">
            <p>© 2025 Handmade House. All rights reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>
