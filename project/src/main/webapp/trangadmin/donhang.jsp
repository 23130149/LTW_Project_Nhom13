<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Donhang/donhang.css">
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
            <li class="active"><a href="${pageContext.request.contextPath}/trangadmin/donhang.jsp"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/khachhang.jsp"><i class="bx bx-group"></i>Khách hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/danhgia.jsp"><i class="bx bx-star"></i>Đánh giá</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/caidat.jsp"><i class="bx bx-cog"></i>Cài đặt</a></li>

        </ul>
    </nav>
    <div class="logout">
        <a href="../../../../../../html/trangchu.html"><i class="bx bx-log-out"></i>Đăng xuất</a>
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
            <span class="notification-badge"><i class="bx bx-bell"></i></span>
            <div class="profile-admin">
                <span class="admin-avatar">L</span>
                <div class="user-details">
                    <span class="user-name">Phan Đình Long</span>
                    <span class="user-role">Quản trị viên</span>
                </div>
            </div>
        </div>
    </header>
    <div class="order-status-tabs">
        <button class="tab-btn active">Tất cả</button>
        <button class="tab-btn">Hoàn thành <span class="count">2</span></button>
        <button class="tab-btn">Đang xử lý <span class="count">1</span></button>
        <button class="tab-btn">Chờ xác nhận <span class="count">1</span></button>
        <button class="tab-btn">Đã hủy <span class="count">1</span></button>
    </div>
    <div class="search-filter-row">
        <div class="search-review-box">
            <i class="bx bx-search"></i>
            <input type="text" placeholder="Tìm kiếm đơn hàng...">
        </div>
        <div class="action-group">
            <button class="filter-button-icon"><i class="bx bx-filter"></i>Lọc</button>
            <button class="view-all-btn"><i class="bx bx-download"></i>In hóa đơn</button>
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
                <th>Thanh toán</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>#DH${order.orderId}</td>
                    <td>${order.userId}</td>
                    <td>${order.totalPrice}đ</td>
                    <td>${order.createAt}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 'PENDING'}">Chờ xử lý</c:when>
                            <c:when test="${order.status == 'SHIPPING'}">Đang giao</c:when>
                            <c:when test="${order.status == 'COMPLETED'}">Hoàn thành</c:when>
                            <c:otherwise>Đã huỷ</c:otherwise>
                        </c:choose>
                    </td>

                    <td>
            <span class="status
                <c:if test='${order.status == "CONFIRMED"}'>status-completed</c:if>
                <c:if test='${order.status == "PENDING"}'>status-pending</c:if>
            '>
                ${order.status}
            </span>
        </td>
        <td>
            <c:if test="${order.status == 'PENDING'}">
                <form action="${pageContext.request.contextPath}/ConfirmController" method="post">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        <button type="submit" class="btn-confirm">Xác nhận</button>
                        </form>
                        </c:if>

                        <c:if test="${order.status == 'CONFIRMED'}">
                            <i class="bx bx-check-circle" style="color:green"></i>
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