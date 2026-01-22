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
            <li class="active"><a href="${pageContext.request.contextPath}/trangadmin/tongquan.jsp"><i class="bx bx-chart"></i>Tổng quan</a></li>
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
                <h3 class="card-title">Doanh thu 7 ngày qua</h3>
                <select class="chart-filter">
                    <option>7 ngày</option>
                    <option>30 ngày</option>
                </select>
            </div>
            <div class="chart-area">
                <div class="bar-chart-container">
                    <div class="bar-chart" style="height: 50%"><p>T2</p></div>
                    <div class="bar-chart" style="height: 60%"><p>T3</p></div>
                    <div class="bar-chart" style="height: 40%"><p>T4</p></div>
                    <div class="bar-chart" style="height: 45%"><p>T5</p></div>
                    <div class="bar-chart" style="height: 70%"><p>T6</p></div>
                    <div class="bar-chart" style="height: 85%"><p>T7</p></div>
                    <div class="bar-chart" style="height: 75%"><p>CN</p></div>
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
            <tr>
                <td>#DH001</td>
                <td class="customer-info">
                    <span class="customer-avatar">P</span>
                    Nguyễn Thanh Phú
                </td>
                <td>Ốp lưng điện thoại</td>
                <td>3</td>
                <td>267.000đ</td>
                <td><span class="status status-pending">Đang xử lý</span></td>
                <td>17/10/2025</td>
                <td>
                    <i class="bx bx-show-alt action-icon"></i>
                </td>
            </tr>
            <tr>
                <td>#DH002</td>
                <td class="customer-info">
                    <span class="customer-avatar">K</span>
                    Lê Viết Khanh
                </td>
                <td>Móc khóa lá cờ Việt Nam</td>
                <td>10</td>
                <td>150.000đ</td>
                <td><span class="status status-completed">Hoàn thành</span></td>
                <td>2/9/2025</td>
                <td>
                    <i class="bx bx-show-alt action-icon"></i>
                </td>
            </tr>
            <tr>
                <td>#DH003</td>
                <td class="customer-info">
                    <span class="customer-avatar">Q</span>
                    Trần Hoàng Quân
                </td>
                <td>Nến thơm xương rồng</td>
                <td>2</td>
                <td>300.000đ</td>
                <td><span class="status status-shipping">Đang giao</span></td>
                <td>17/9/2025</td>
                <td>
                    <i class="bx bx-show-alt action-icon"></i>
                </td>
            </tr>
            <tr>
                <td>#DH004</td>
                <td class="customer-info">
                    <span class="customer-avatar">Đ</span>
                    Nguyễn Lê Tiến Đạt
                </td>
                <td>Kẹp tóc hoa dâu tây nhí</td>
                <td>5</td>
                <td>150.000đ</td>
                <td><span class="status status-completed">Hoàn thành</span></td>
                <td>10/10/2025</td>
                <td>
                    <i class="bx bx-show-alt action-icon"></i>
                </td>
            </tr>
            <tr>
                <td>#DH005</td>
                <td class="customer-info">
                    <span class="customer-avatar">B</span>
                    Nguyễn Huy Bảo
                </td>
                <td>Túi hoa Tulip</td>
                <td>1</td>
                <td>120.000đ</td>
                <td><span class="status status-pending">Đang xử lý</span></td>
                <td>12/11/2025</td>
                <td>
                    <i class="bx bx-show-alt action-icon"></i>
                </td>
            </tr>
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