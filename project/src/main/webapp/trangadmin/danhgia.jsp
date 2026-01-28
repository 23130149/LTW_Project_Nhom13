<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin - Đánh giá</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Danhgia/danhgia.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body>

<aside class="sliderbar">
    <div class="slidebar-header">
        <h2 class="logo">Handmade House</h2>
    </div>
    <nav class="slidebar-nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="bx bx-chart"></i>Tổng quan</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/products"><i class="bx bx-package"></i>Sản phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/customers"><i class="bx bx-group"></i>Khách hàng</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/reviews"><i class="bx bx-star"></i>Đánh giá</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/contacts"><i class="bx bx-envelope"></i> Liên hệ</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/setting"><i class="bx bx-cog"></i>Cài đặt</a></li>
        </ul>
    </nav>
    <div class="logout">
        <a href="${pageContext.request.contextPath}/home">
            <i class="bx bx-log-out"></i>Đăng xuất
        </a>
    </div>
</aside>

<main class="main-content">
    <header class="header">
        <h2>Đánh giá</h2>
        <div class="search-box">
            <input type="text" placeholder="Tìm kiếm...">
            <button><i class="bx bx-search"></i></button>
        </div>
        <div class="user-info">
            <span class="notification-badge">
                <i class="bx bx-bell"></i>
                <c:if test="${notificationCount > 0}">
                    <span class="badge">${notificationCount}</span>
                </c:if>
            </span>
            <div class="profile-admin">
                <span class="admin-avatar">${adminAvatar}</span>
                <div class="user-details">
                    <span class="user-name">${adminName}</span>
                    <span class="user-role">${adminRole}</span>
                </div>
            </div>
        </div>
    </header>

    <div class="table card">

        <div class="reviews-summary-grid">
            <div class="summary-card">
                <p>Tổng đánh giá</p>
                <span class="summary-value">${summary.total}</span>
                <span class="summary-detail">Toàn hệ thống</span>
            </div>

            <div class="summary-card">
                <p>Đánh giá trung bình</p>
                <span class="summary-value">
                    ${summary.avg} <i class="bx bxs-star"></i>
                </span>
            </div>

            <div class="summary-card">
                <p>Chờ duyệt</p>
                <span class="summary-value">${summary.pending}</span>
                <span class="summary-detail">Cần xem xét</span>
            </div>

            <div class="summary-card">
                <p>Tỷ lệ 5 sao</p>
                <span class="summary-value">${summary.fiveStarPercent}%</span>
                <span class="summary-detail">Xuất sắc</span>
            </div>
        </div>

        <div class="rating-breakdown-card">
            <h3>Phân bố đánh giá</h3>

            <c:set var="total" value="${summary.total}" />

            <c:forEach var="star" items="${stars}">
                <c:set var="count" value="${ratingMap[star]}" />

                <div class="rating-bar-item">
            <span class="rating-star-label">
                ${star}<i class="bx bxs-star"></i>
            </span>

                    <div class="progress-bar-container">
                        <div class="progress-bar"
                             style="width:${total == 0 ? 0 : (1.0 * count * 100 / total)}%">
                        </div>
                    </div>

                    <span class="rating-count">${count} đánh giá</span>
                </div>
            </c:forEach>
        </div>

        <div class="rating-filter-row">
            <div class="rating-filter-buttons">
                <button class="filter-button active" data-star="all">Tất cả</button>
                <button class="filter-button" data-star="5">5<i class="bx bxs-star"></i></button>
                <button class="filter-button" data-star="4">4<i class="bx bxs-star"></i></button>
                <button class="filter-button" data-star="3">3<i class="bx bxs-star"></i></button>
                <button class="filter-button" data-star="2">2<i class="bx bxs-star"></i></button>
                <button class="filter-button" data-star="1">1<i class="bx bxs-star"></i></button>
            </div>
        </div>

        <div class="search-filter-row">
            <div class="search-review-box">
                <input id="reviewSearch" type="text" placeholder="Tìm kiếm đánh giá...">
            </div>
        </div>

        <div class="review-list-container">

            <c:forEach var="r" items="${reviews}">
                <div class="review-item" data-star="${Math.round(r.rating)}">

                    <span class="customer-avatar-review">
                            ${fn:substring(r.user_name, 0, 1)}
                    </span>

                    <div class="review-content">

                        <div class="review-header">
                            <div>
                                <span class="reviewer-name">${r.user_name}</span>

                                <div class="rating-stars">
                                    <c:set var="s" value="${Math.round(r.rating)}" />
                                    <c:forEach begin="1" end="${s}">
                                        <i class="bx bxs-star"></i>
                                    </c:forEach>
                                    <c:forEach begin="${s+1}" end="5">
                                        <i class="bx bx-star"></i>
                                    </c:forEach>
                                </div>
                            </div>

                            <span class="status-tag">
                                <c:choose>
                                    <c:when test="${r.status eq 'APPROVED'}">Đã duyệt</c:when>
                                    <c:otherwise>Chờ duyệt</c:otherwise>
                                </c:choose>
                            </span>
                        </div>

                        <p class="review-product">Sản phẩm #${r.product_id}</p>
                        <span class="review-item-date">${r.creatAt}</span>
                        <p class="review-text">${r.comment}</p>

                        <c:if test="${not empty r.shopReply}">
                            <div class="shop-response">
                                <p class="response-title">
                                    <i class="bx bx-reply"></i> Phản hồi từ shop:
                                </p>
                                <p class="response-text">${r.shopReply}</p>
                            </div>
                        </c:if>

                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</main>

<script>
    const searchInput = document.getElementById('reviewSearch');
    const reviews = document.querySelectorAll('.review-item');

    searchInput.addEventListener('input', () => {
        const key = searchInput.value.toLowerCase();
        reviews.forEach(r => {
            r.style.display =
                r.innerText.toLowerCase().includes(key) ? 'flex' : 'none';
        });
    });

    document.querySelectorAll('.filter-button').forEach(btn => {
        btn.addEventListener('click', () => {
            document.querySelectorAll('.filter-button')
                .forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            const star = btn.dataset.star;
            reviews.forEach(r => {
                r.style.display =
                    star === 'all' || r.dataset.star === star ? 'flex' : 'none';
            });
        });
    });
</script>

</body>
</html>
