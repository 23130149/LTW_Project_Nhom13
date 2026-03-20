<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${product.productName}</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chitietsp.css">

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
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
                    (${sessionScope.cart.totalQuantity})
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
                    <li><a href="${pageContext.request.contextPath}/Blog.jsp">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>

<main class="product-detail-page">
    <div class="container">

        <div class="product-detail-content">

            <div class="product-image">

                <img id="mainImage"
                     src="${not empty productImages ? productImages[0].imageUrl : product.imageUrl}"
                     alt="${product.productName}"
                     class="main-product-image">

                <div class="thumbnail-list">
                    <c:forEach var="img" items="${productImages}" varStatus="status" begin="1" end="3">
                        <img src="${img.imageUrl}"
                             data-src="${img.imageUrl}"
                             class="thumbnail-item ${status.first ? 'active' : ''}">
                    </c:forEach>
                </div>

            </div>

            <div class="product-info-detail">
                <h1 class="product-title">${product.productName}</h1>

                <div class="product-rating">
                    <div class="stars">
                        <c:forEach begin="1" end="5" var="i">
                            <i class="bx ${avgRating >= i ? 'bxs-star' : 'bx-star'}"></i>
                        </c:forEach>
                    </div>
                    <span>${avgRating}/5 (${reviewCount} đánh giá)</span>
                </div>

                <p class="price">
                    <fmt:formatNumber value="${product.productPrice}" groupingUsed="true"/> đ
                </p>

                <div class="product-des">
                    <h3>Mô tả sản phẩm</h3>
                    <p>${product.productDescription}</p>
                </div>
                <div class="quantity-input-box">
                    <input type="number" class="quantity-input" value="1" min="1" max="${product.stockQuantity}">
                    <div class="quantity-arrows">
                        <button type="button" class="arrow-up"><i class="bx bx-chevron-up"></i></button>
                        <button type="button" class="arrow-down"><i class="bx bx-chevron-down"></i></button>
                    </div>
                </div>
                <div class="action-buttons">
                    <a class="btn btn-add-to-cart"
                       href="${pageContext.request.contextPath}/add-cart?id=${product.productId}&q=1">
                        <i class="bx bx-cart"></i> Thêm vào giỏ
                    </a>
                    <c:if test="${not empty sessionScope.cartMessage}">
                        <div class="cart-toast">
                                ${sessionScope.cartMessage}
                        </div>
                        <c:remove var="cartMessage" scope="session"/>
                    </c:if>
                    <a class="btn btn-buy-now"
                       href="${pageContext.request.contextPath}/add-cart?id=${product.productId}&q=1&buyNow=1">
                        Mua ngay
                    </a>
                </div>
            </div>
        </div>

        <div class="review-list">
            <h3>Bình luận từ khách hàng (${reviewCount})</h3>

            <!-- REVIEW FORM -->
            <c:if test="${canReview}">
                <form action="${pageContext.request.contextPath}/review" method="post" class="review-form">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <input type="hidden" name="rating" id="ratingValue">

                    <div class="star-rating">
                        <i class="bx bx-star" data-value="1"></i>
                        <i class="bx bx-star" data-value="2"></i>
                        <i class="bx bx-star" data-value="3"></i>
                        <i class="bx bx-star" data-value="4"></i>
                        <i class="bx bx-star" data-value="5"></i>
                    </div>

                    <textarea name="comment" required placeholder="Chia sẻ cảm nhận của bạn..."></textarea>
                    <button type="submit">Gửi đánh giá</button>
                </form>
            </c:if>

            <c:if test="${param.reviewExist == '1' && not empty sessionScope.user}">
                <p style="color:red;font-weight:600">
                    ⚠️ Bạn đã đánh giá sản phẩm này.
                </p>
            </c:if>


            <!-- REVIEW LIST -->
            <c:forEach var="r" items="${reviews}">
                <div class="review-item">
                    <div class="review-header">

                        <div class="user-avatar">
                            <c:out value="${fn:substring(r.user_name,0,1)}"/>
                        </div>

                        <div class="user-info">
                            <p class="user-name">
                                <c:out value="${r.user_name}"/>
                            </p>

                            <div class="review-rating">
                                <c:forEach begin="1" end="5" var="i">
                                    <i class="bx ${r.rating >= i ? 'bxs-star' : 'bx-star'}"></i>
                                </c:forEach>
                                <span class="review-date">${r.formattedDate}</span>
                            </div>
                        </div>

                    </div>

                    <p class="review-text">
                        <c:out value="${r.comment}"/>
                    </p>
                </div>
            </c:forEach>
        </div>
        <section class="related-products">
            <h2 id="related-title">Sản phẩm liên quan</h2>
            <div class="product-grid">
                <c:forEach var="rp" items="${relatedProducts}">
                    <div class="product-item">
                        <div class="product-top">
                            <a href="${pageContext.request.contextPath}/product-detail?id=${rp.productId}" class="product-thumb">
                                <img src="${rp.imageUrl}"
                                     alt="${rp.productName}">
                            </a>
                        </div>
                        <div class="product-info">
                            <a href="${pageContext.request.contextPath}/product?categoryId=${rp.categoryId}" class="product-cat">${rp.categoryName}</a>
                            <a href="${pageContext.request.contextPath}/product-detail?id=${rp.productId}" class="product-name">${rp.productName}</a>
                            <div class="product-price"><fmt:formatNumber value="${rp.productPrice}" type="number" groupingUsed="true"/> đ</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
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
                    <li><a href="#cau-chuyen">Câu chuyện thương hiệu</a></li>
                    <li><a href="#gia-tri">Giá trị & Triết lý</a></li>
                    <li><a href="#quy-trinh">Quy trình sản xuất</a></li>
                    <li><a href="#tuyen-dung">Định hướng bền vững</a></li>
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
                    <li>📍 TP. Thủ Đức, TP.HCM</li>
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
<script src="${pageContext.request.contextPath}/js/chitietsp.js"></script>

</body>

</html>