<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="util.FormatUtil" %>
<%@ taglib prefix="util" uri="http://handmade/util" %>
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
                <a href="${pageContext.request.contextPath}/cart" class="icon-btn" id="cartBtn">
                    <i class='bx  bx-cart'></i>
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
<section class="cart-page">

    <h1 class="cart-header">
        <i class='bx bx-cart'></i> Giỏ Hàng Của Bạn
    </h1>

    <!-- SUMMARY BAR -->
    <div class="cart-summary-bar">
        <div>
            <div class="summary-title">Tổng tiền ước tính</div>
            <div class="summary-price">${sessionScope.cart.totalPrice}</div>
            <div class="summary-note">2 sản phẩm đã chọn</div>
        </div>
        <button class="summary-checkout">
            <a href="${pageContext.request.contextPath}/payment">Thanh toán</a>
            </button>
    </div>
    <form action="DelSelectProduct" method="post">

    <!-- SELECT ACTION -->
    <div class="cart-action">
        <label class="check-all" >
            <input type="checkbox" id="checkAll">
            <span>Chọn tất cả(${sessionScope.cart.totalQuantity} sản phẩm)</span>
        </label>

        <button class="btn-delete-selected">
            <i class='bx bx-trash'></i> Xóa đã chọn
        </button>
    </div>
        <div class="cart-list">

            <c:forEach items="${sessionScope.cart.list}" var="p">

                <div class="cart-item">
                    <!-- checkbox -->
                    <input type="checkbox"
                           class="item-checkbox"
                           name="productIds"
                           value="${p.product.productId}">

                    <img src="${p.product.imageUrl}" alt="">

                    <div class="product-info">
                        <div class="product-name">${p.product.productName}</div>
                        <div class="unit-price">${p.price}</div>
                    </div>

                    <div class="qty-box">
                        <a class="qty-btn"
                           href="CartUpdate?productId=${p.product.productId}&action=dec">−</a>

                        <span class="qty">${p.quantity}</span>

                        <a class="qty-btn"
                           href="CartUpdate?productId=${p.product.productId}&action=inc">+</a>
                    </div>

                    <div class="item-total-price">
                            ${p.total}
                    </div>

                    <i class='bx bx-trash item-remove'
                       onclick="location.href='DelProduct?id=${p.product.productId}'"></i>
                </div>

            </c:forEach>

        </div>
    </form>

        <!-- TOTAL BOX -->
        <div class="cart-total">
            <h3>Đơn Hàng Của Bạn</h3>

            <div class="line">
                <span>Tạm tính</span>
                <span>${sessionScope.cart.totalPrice}</span>
            </div>

            <div class="line">
                <span>Phí vận chuyển</span>
                <span class="free">Miễn phí</span>
            </div>

            <hr>

            <div class="line total">
                <span>Tổng cộng</span>
                <span>${sessionScope.cart.totalPrice}</span>
            </div>

            <a href="${pageContext.request.contextPath}/payment"
               class="summary-checkout">
                Thanh toán
            </a>
        </div>


</section>
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-column">
                <h3 class="footer-logo">Handmade House</h3>
                <p class="footer-desc">Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn yêu nghệ thuật
                    và thủ công.</p>
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
                    <li><a href="#"> Giá trị & Triết lý thương hiệu</a></li>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {

        const checkAll = document.getElementById("checkAll");
        const items = document.querySelectorAll(".item-checkbox");

        checkAll.addEventListener("change", function () {
            items.forEach(cb => cb.checked = checkAll.checked);
        });

        items.forEach(cb => {
            cb.addEventListener("change", function () {
                checkAll.checked = [...items].every(i => i.checked);
            });
        });

    });
</script>
</body>
</html>
