<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/trangadmin/Donhang/donhang.css">
    <meta charset="UTF-8">
    <title>Admin - Quản lý đơn hàng</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
            <li class="active"><a href="${pageContext.request.contextPath}/admin/orders"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/customers"><i class="bx bx-group"></i>Khách hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/reviews"><i class="bx bx-star"></i> Đánh giá</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/contacts"><i class="bx bx-envelope"></i> Liên hệ</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/setting"><i class="bx bx-cog"></i>Cài đặt</a></li>

        </ul>
    </nav>
    <div class="logout">
        <a href="${pageContext.request.contextPath}/home"><i class="bx bx-log-out"></i>Đăng xuất</a>
    </div>
</aside>
<main class="main-content">
    <header class="header">
        <h2>Đơn hàng</h2>
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
    <div class="order-status-tabs">
        <a class="tab-btn ${empty param.status ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/orders">
            Tất cả
        </a>

        <a class="tab-btn ${param.status == 'COMPLETED' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/orders?status=COMPLETED">
            Hoàn thành
        </a>

        <a class="tab-btn ${param.status == 'SHIPPED' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/orders?status=SHIPPED">
            Đang xử lý
        </a>

        <a class="tab-btn ${param.status == 'PENDING' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/orders?status=PENDING">
            Chờ xác nhận
        </a>

        <a class="tab-btn ${param.status == 'CANCELED' ? 'active' : ''}"
           href="${pageContext.request.contextPath}/admin/orders?status=CANCELLED">
            Đã hủy
        </a>
    </div>

    <div class="search-filter-row">
        <div class="search-review-box">
            <i class="bx bx-search"></i>
            <input type="text" placeholder="Tìm kiếm đơn hàng...">
        </div>

    </div>
    <div class="order-table-container">
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Sản phẩm</th>
                <th>Tổng tiền</th>
                <th>Ngày đặt</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
                <tr>
                    <td>#${order.orderCode}</td>
                    <td>${order.userName}</td>
                    <td>${order.totalQuantity} sản phẩm</td>
                    <td>${order.totalPriceFormatted}</td>
                    <td>${order.createAtFormatted}</td>

                    <td>
    <span class="status ${order.status}">
        <c:choose>
            <c:when test="${order.status == 'PENDING'}">Chờ xác nhận</c:when>
            <c:when test="${order.status == 'SHIPPED'}">Đã giao</c:when>
            <c:when test="${order.status == 'COMPLETED'}">Hoàn thành</c:when>
            <c:otherwise>Đã huỷ</c:otherwise>
        </c:choose>
    </span>
                    </td>

                    <td>
                        <c:if test="${order.status == 'PENDING'}">
                            <form action="${pageContext.request.contextPath}/admin/orders"
                                  method="post">
                                <input type="hidden" name="orderId" value="${order.orderId}">
                                <input type="hidden" name="action" value="ship">
                                <button class="btn-confirm">Xác nhận</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>


        </table>
    </div>
</main>
<div id="toast-container"></div>

<div id="orderDetailModal" class="modal">
    <div class="modal-content">
        <span class="close-btn">&times;</span>
        <h3>Chi Tiết Hóa Đơn</h3>
        <hr>
        <div id="orderDetailBody"></div>
        <div class="modal-footer">
            <button onclick="window.print()" class="btn-print">In hóa đơn</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/trangadmin/Donhang/donhang.js"></script>
</body>
</html>