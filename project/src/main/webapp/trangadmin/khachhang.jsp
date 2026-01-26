<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Khachhang/khachhang.css">
    <meta charset="UTF-8">
    <title>Admin - Quản lý khách hàng</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<aside class="sliderbar">
    <div class="slidebar-header">
        <h2 class="logo">Handmade House</h2>
    </div>
    <nav class="slidebar-nav">
        <ul>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="bx bx-chart"></i>Tổng quan</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/products"><i class="bx bx-package"></i>Sản phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/customers"><i class="bx bx-group"></i>Khách hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/danhgia.jsp"><i class="bx bx-star"></i>Đánh giá</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/caidat.jsp"><i class="bx bx-cog"></i>Cài đặt</a></li>
        </ul>
    </nav>
    <div class="logout">
        <a href="${pageContext.request.contextPath}/home"><i class="bx bx-log-out"></i>Đăng xuất</a>
    </div>
</aside>
<main class="main-content">
    <header class="header">
        <h2>Khách hàng</h2>
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Tìm kiếm khách hàng...">
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
    <div class="customer-summary-grid">
        <div class="summary-card">
            <p>Tổng khách hàng</p>
            <span class="summary-value">535</span>
            <span class="summary-detail growth">+8% tháng này</span>
        </div>
        <div class="summary-card vip">
            <p>Khách VIP</p>
            <span class="summary-value">87</span>
            <span class="summary-detail growth">+12% tháng này</span>
        </div>
        <div class="summary-card new">
            <p>Khách mới</p>
            <span class="summary-value">156</span>
            <span class="summary-detail growth">+23% tháng này</span>
        </div>
        <div class="summary-card aov">
            <p>Giá trị TB/Khách</p>
            <span class="summary-value">₫3.6M</span>
            <span class="summary-detail decline">-7% tháng này</span>
        </div>
    </div>
    <div class="customer-search-filter-row">
        <div class="search-customer-box">
            <i class="bx bx-search"></i>
            <input type="text" placeholder="Tìm kiếm khách hàng...">
        </div>
        <button class="filter-button-icon"><i class="bx bx-filter"></i>Lọc</button>

    </div>
    <div class="order-table-container">
        <table class="data-table">
            <thead>
            <tr>
                <th>Khách hàng</th>
                <th>Liên hệ</th>
                <th>Số đơn</th>
                <th>Tổng chi tiêu</th>
                <th>Ngày tham gia</th>
                <th>Loại khách hàng</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody id="customerTable">
            <c:forEach items="${customers}" var="c">
                <tr>
                    <td>
                        <div class="customer-info">
                            <span class="avatar">${fn:substring(c.userName,0,1)}</span>
                            <span class="name">${c.userName}</span>
                        </div>
                    </td>
                    <td>${c.phone}</td>
                    <td>${c.orderCount}</td>
                    <td>${c.totalSpendFormatted}</td>
                    <td>${c.joinDateFormatted}</td>
                    <td>
                        <span class="badge ${c.customerType}">${c.customerTypeLabel}</span>
                    </td>
                    <td>
                        <button class="icon-btn view-btn" data-id="${c.userId}">
                            <i class='bx bx-show'></i>
                        </button>
                        <button class="icon-btn edit-btn"
                                data-id="${c.userId}"
                                data-name="${c.userName}"
                                data-phone="${c.phone}">
                            <i class='bx bx-edit'></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<div id="customerModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Chi Tiết Khách Hàng</h3>
            <span class="close-modal">&times;</span>
        </div>
        <div id="customerDetailBody" class="modal-body"></div>
    </div>
</div>
<div id="editCustomerModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3>Chỉnh sửa khách hàng</h3>
            <span class="close-edit">&times;</span>
        </div>

        <form action="${pageContext.request.contextPath}/admin/customers" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="userId" id="editUserId">

            <div class="form-group">
                <label>Họ và tên</label>
                <input type="text" name="userName" id="editName" required>
            </div>

            <div class="form-group">
                <label>Số điện thoại</label>
                <input type="text" name="phone" id="editPhone" required>
            </div>

            <button type="submit" class="btn-save">Lưu thay đổi</button>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/trangadmin/khachhang/khachhang.js"></script>
</body>
</html>
