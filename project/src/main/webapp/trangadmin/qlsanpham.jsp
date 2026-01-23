<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Sanpham/qlsanpham.css">
    <meta charset="UTF-8">
    <title>Admin - Quản lý sản phẩm</title>
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
            <li class="active"><a href="${pageContext.request.contextPath}/admin/products"><i class="bx bx-package"></i>Sản phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/donhang.jsp"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
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
        <h2>Sản phẩm</h2>
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
            <div class="stat-icon"><i class="bx bx-cube"></i></div>
            <div class="stat-details">
                <p class="title">Tổng sản phẩm</p>
                <p class="value">${totalProducts}</p>
                <span class="stat-change positive"></span>
            </div>
        </div>
        <div class="stat-card stat-new-orders">
            <div class="stat-icon"><i class="bx bx-dollar-circle"></i></div>
            <div class="stat-details">
                <p class="title">Tổng giá trị hàng</p>
                <p class="value">
                    <fmt:formatNumber value="${totalValue}" type="number"/>đ
                </p>
                <span class="stat-change positive"></span>
            </div>
        </div>
        <div class="stat-card stat-customers">
            <div class="stat-icon"><i class="bx bx-error-alt"></i></div>
            <div class="stat-details">
                <p class="title">Sản phẩm hết hàng</p>
                <p class="value">${outOfStock}</p>
                <span class="stat-change positive"></span>
            </div>
        </div>
        <div class="stat-card stat-customers">
            <div class="stat-icon"><i class="bx bx-package"></i></div>
            <div class="stat-details">
                <p class="title">Tổng tồn kho</p>
                <p class="value">${totalStock}</p>
                <span class="stat-change positive"></span>
            </div>
        </div>
    </div>
    <div class="search-filter-row">
        <div class="search-review-box">
            <i class="bx bx-search"></i>
            <input type="text" placeholder="Tìm kiếm sản phẩm...">
        </div>
        <button class="filter-button-icon"><i class="bx bx-filter"></i>Lọc</button>
        <button class="view-all-btn"><i class="bx bx-plus"></i>Thêm sản phẩm</button>
    </div>
    <div class="order-table-container">
        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Tên sản phẩm</th>
                <th>Giá bán</th>
                <th>Tồn kho</th>
                <th>Đã bán</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
            <tr>
                <td>#SP${p.productId}</td>
                <td>${p.productName}</td>
                <td>
                    <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                </td>
                <td>${p.stockQuantity}</td>
                <td>${p.sold != null ? p.sold : 0}</td>
                <td>
                 <c:choose>
                    <c:when test="${p.stockQuantity == 0}">
                        <span class="status status-pending">Hết hàng</span>
                    </c:when>
                    <c:when test="${p.stockQuantity < 5}">
                        <span class="status status-warning">Sắp hết</span>
                    </c:when>
                    <c:otherwise>
                        <span class="status status-completed">Còn hàng</span>
                    </c:otherwise>
                </c:choose>
                </td>
                <td>
                    <button class="action-icon"
                            onclick="openEditModal(
                            '${p.productId}',
                            '${p.productName}',
                            '${p.productPrice}',
                            '${p.stockQuantity}'
                            )">
                        <i class="bx bx-pencil"></i>
                    </button>
                    <form action="${pageContext.request.contextPath}/admin/products"
                          method="post" style="display:inline">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="productId" value="${p.productId}">
                        <button class="action-icon" onclick="return confirm('Xoá sản phẩm này?')">
                            <i class="bx bx-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<div id="toast-container"></div>
<div id="productModal" class="modal">
    <div class="modal-content">
        <span class="close-btn">&times;</span>
        <h3 id="modalTitle">Thông tin sản phẩm</h3>
        <form action="${pageContext.request.contextPath}/admin/products"
              method="post" id="productForm">
            <div class="form-group">
                <label>Tên sản phẩm</label>
                <input type="text" id="prodName" required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Giá bán</label>
                    <input type="text" id="prodPrice" required>
                </div>
                <div class="form-group">
                    <label>Tồn kho</label>
                    <input type="number" id="prodStock" required>
                </div>
            </div>
            <button type="submit" class="btn-save">Lưu dữ liệu</button>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/trangadmin/Sanpham/qlsanpham.js"></script>
</body>
</html>
