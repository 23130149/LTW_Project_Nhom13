<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán - Handmade House</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/payment.css">

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        .address-checklist {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .address-card {
            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 14px 16px;
            border-radius: 12px;
            border: 1px solid #ddd;
            cursor: pointer;
            transition: all .2s ease;
        }

        .address-card:hover {
            background: #f7f7f7;
        }

        .address-card input {
            display: none;
        }

        .address-content {
            flex: 1;
        }

        .address-sub {
            font-size: 13px;
            color: #666;
            margin-top: 2px;
        }

        .address-card i {
            font-size: 20px;
            color: #111;
            opacity: 0;
        }

        .address-card input:checked ~ i {
            opacity: 1;
        }

        .address-card input:checked ~ .address-content {
            font-weight: 600;
        }

        .address-card input:checked {
            background: #111;
        }

        .address-item {
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .address-item:hover {
            background: #f7f7f7;
        }

        .address-item input {
            margin-right: 8px;
        }

        .change-btn {
            display: inline-block;
            margin-top: 10px;
            font-size: 14px;
            color: #111;
            text-decoration: underline;
        }
    </style>
</head>

<body>

<header class="header">
    <div class="header-top-container">
        <div class="header-content">

            <div class="logo">
                <a href="${pageContext.request.contextPath}/Home">Handmade House</a>
            </div>

            <form class="search-form"
                  action="${pageContext.request.contextPath}/Products"
                  method="get">
                <input type="text" class="search-input"
                       placeholder="Tìm kiếm bất cứ thứ gì...">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>

            <div class="icons">
                <a href="${pageContext.request.contextPath}/Cart" class="icon-btn">
                    <i class="bx bx-cart"></i>
                </a>
                <a href="${pageContext.request.contextPath}/Account" class="icon-btn">
                    <i class="bx bx-user"></i>
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

<main class="checkout-container">

    <section class="shipping-info">
        <h2>📍 Địa chỉ nhận hàng</h2>

        <c:if test="${empty addresses}">
            <p>⚠️ Bạn chưa có địa chỉ nhận hàng</p>
            <a href="${pageContext.request.contextPath}/Address" class="change-btn">
                Thêm địa chỉ
            </a>
        </c:if>

        <div class="address-checklist">
            <c:forEach items="${addresses}" var="addr">
                <label class="address-card">
                    <input type="radio"
                           name="selectedAddress"
                           value="${addr.userAddressId}"
                        ${addr.userAddressId == address.userAddressId ? "checked" : ""}>

                    <div class="address-content">
                        <strong>
                                ${addr.street}
                        </strong>
                        <div class="address-sub">
                                ${addr.district}, ${addr.province}, ${addr.country}
                        </div>
                    </div>

                    <i class="bx bx-check"></i>
                </label>
            </c:forEach>
        </div>

        <a href="${pageContext.request.contextPath}/Address"
           class="change-btn">
            Quản lý địa chỉ
        </a>
    </section>

    <section class="product-list">
        <h2>Sản phẩm</h2>

        <c:forEach items="${cartItems}" var="item">
            <div class="product-item">
                <img src="${item.product.imageUrl}" alt="">

                <div class="product-detail">
                    <p class="product-name">
                            ${item.product.productName}
                    </p>
                </div>

                <p class="product-price">
                    <fmt:formatNumber value="${item.price}" type="number"/>₫
                </p>

                <p class="product-qty">
                    x${item.quantity}
                </p>

                <p class="product-total">
                    <fmt:formatNumber
                            value="${item.quantity * item.price}"
                            type="number"/>₫
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

        <form action="${pageContext.request.contextPath}/payment"
              method="post"
              id="checkoutForm">

            <input type="hidden" name="addressId" id="addressId">

            <button class="checkout-btn">
                Đặt hàng
            </button>
        </form>
    </section>

</main>

<footer class="footer">
    <div class="container">
        <div class="footer-bottom">
            <p>© 2025 Handmade House. All rights reserved.</p>
        </div>
    </div>
</footer>

<script>
    document.getElementById("checkoutForm")
        .addEventListener("submit", function (e) {

            const checked =
                document.querySelector("input[name='selectedAddress']:checked");

            if (!checked) {
                alert("Vui lòng chọn địa chỉ nhận hàng");
                e.preventDefault();
                return;
            }

            document.getElementById("addressId").value = checked.value;
        });
</script>

</body>
</html>
