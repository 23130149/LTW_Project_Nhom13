<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Tongquan/tongquan.css">
    <meta charset="UTF-8">
    <title>Admin</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<aside class="sliderbar">
    <div class="slidebar-header">
        <h2 class="logo">Handmade House</h2>
    </div>
    <nav class="slidebar-nav">
        <ul>
            <li class="active"><a href="${pageContext.request.contextPath}/dashboard"><i class="bx bx-chart"></i>Tổng quan</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/qlsanpham.jsp"><i class="bx bx-package"></i>Sản phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/donhang.jsp"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/khachhang.jsp"><i class="bx bx-group"></i>Khách hàng</a></li>
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
        <h2>Tổng quan</h2>
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
    <div class="stats-grid">
        <div class="stat-card stat-revenue">
            <div class="stat-icon"><i class="bx bx-money"></i></div>
            <div class="stat-details">
                <p class="title">Doanh thu tháng này</p>
                <p class="value">
                    <fmt:formatNumber value="${totalRevenue}" type="number" groupingUsed="true"/>đ
                </p>
                <span class="stat-change positive">Tổng doanh thu hệ thống</span>
            </div>
        </div>
        <div class="stat-card stat-new-orders">
            <div class="stat-icon"><i class="bx bx-receipt"></i></div>
            <div class="stat-details">
                <p class="title">Đơn hàng mới</p>
                <p class="value">${totalOrders}</p>
                <span class="stat-change positive">Tổng số đơn đã tạo</span>
            </div>
        </div>
        <div class="stat-card stat-customers">
            <div class="stat-icon"><i class="bx bx-user-pin"></i></div>
            <div class="stat-details">
                <p class="title">Khách hàng</p>
                <p class="value">${totalUsers}</p>
                <span class="stat-change positive">Tổng người dùng hệ thống</span>
            </div>
        </div>
    </div>
    <div class="charts-section">
        <div class="chart-card">
            <div class="card-header">
                <h3 class="card-title">Doanh thu ${range} ngày qua</h3>
                <form method="get" action="${pageContext.request.contextPath}/dashboard">
                    <select name="range" onchange="this.form.submit()">
                        <option value="7" ${range == '7' ? 'selected' : ''}>7 ngày</option>
                        <option value="30" ${range == '30' ? 'selected' : ''}>30 ngày</option>
                    </select>
                </form>
            </div>
            <div class="chart-area">
                <div class="bar-chart-container">
                    <c:forEach items="${revenueChart}" var="item">
                        <div class="bar-chart" style="height: ${item.value}%">
                            <span>${item.key}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="chart-card">
            <div class="card-header">
                <h3 class="card-title">Top sản phẩm bán chạy</h3>
            </div>
            <div class="top-products">
                <c:forEach items="${topProducts}" var="p" varStatus="st">
                <div class="product-item">
                    <span class="product-rank">${st.index + 1}</span>
                    <div class="product-info">
                        <p class="product-name">${p.productName}</p>
                        <p class="product-sales">${p.sold}</p>
                    </div>
                    <span class="product-price">
                        <fmt:formatNumber value="${p.revenue}" type="number" groupingUsed="true"/>đ
                    </span>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="order-table-container">
        <div class="card-header">
            <h3 class="card-title">Đơn hàng mới nhất</h3>
        </div>
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Sản phẩm</th>
                <th>Số lượng</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
                <th>Ngày đặt</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${latestOrders}" var="o">
            <tr>
                <td>${o.orderCode}</td>
                <td class="customer-info">
                    <span class="customer-avatar">
                       ${fn:substring(o.userName,0,1)}
                    </span>
                    ${o.userName}
                </td>
                <td>${o.productName}</td>
                <td>${o.quantity}</td>
                <td>
                <fmt:formatNumber value="${o.totalPrice}" type="number" groupingUsed="true"/>đ
                </td>
                <td>
                <span class="status
                ${o.status == 'Hoàn thành' ? 'status-completed' :
                  o.status == 'Đang giao' ? 'status-shipping' : 'status-pending'}">
                ${o.status}
                </span>
                </td>
                <td>
                <fmt:formatDate value="${o.createAt}" pattern="dd/MM/yyyy"/>
                </td>
                <td>
                    <i class="bx bx-show-alt action-icon"></i>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<div id="orderModal" class="modal">
    <div class="modal-content">
        <span class="close-btn">&times;</span>
        <h3>Chi Tiết Đơn Hàng</h3>
        <hr>
        <div id="modalBody">
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/trangadmin/Tongquan/tongquan.js"></script>

</body>
</html>