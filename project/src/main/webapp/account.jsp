<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tài khoản của tôi - Handmade House</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/account.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>

<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="../html/trangchu.html">Handmade House</a>
            </div>
            <form class="search-form">
                <input type="text" class="search-input" placeholder="Tìm kiếm...">
                <button class="search-btn"><i class="bx bx-search"></i></button>
            </form>
            <div class="icons">
                <a href="#" class="icon-btn"><i class="bx bx-heart"></i></a>
                <a href="#" class="icon-btn"><i class="bx bx-cart"></i></a>
                <a href="#" class="icon-btn"><i class="bx bx-user"></i></a>
            </div>
        </div>
    </div>
</header>

<main class="about-us-container">

    <h1>Tài khoản của tôi</h1>

    <div class="account-info">
        <i class='bx bxs-user-circle'></i>
        <h3>${sessionScope.user.email}</h3>
        <p>Xin chào, ${sessionScope.user.user_name}!</p>
    </div>

    <ul class="account-menu">
        <li><a href="#"><i class='bx bx-receipt'></i><span>Lịch sử đơn hàng</span></a></li>
        <li><a href="#"><i class='bx bx-edit-alt'></i><span>Thông tin cá nhân</span></a></li>
        <li><a href="#"><i class='bx bx-lock-alt'></i><span>Đổi mật khẩu</span></a></li>
        <li><a href="#"><i class='bx bx-map'></i><span>Sổ địa chỉ</span></a></li>
    </ul>

    <div class="recent-orders-box">
        <h2>Đơn hàng gần đây</h2>

        <c:choose>
            <c:when test="${empty orderList}">
                <p>Bạn chưa có đơn hàng nào.</p>
            </c:when>
            <c:otherwise>
                <table class="orders-table">
                    <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>#${order.id}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.totalPrice}đ</td>
                            <td>
                                <span class="status-${order.status}">
                                    <c:choose>
                                        <c:when test="${order.status == 'delivered'}">Đã giao</c:when>
                                        <c:when test="${order.status == 'processing'}">Đang xử lý</c:when>
                                    </c:choose>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

    <a href="${pageContext.request.contextPath}/Logout" class="btn-logout">
        Đăng xuất
    </a>

</main>

<footer class="footer">
    <div class="container">
        <p>© 2025 Handmade House</p>
    </div>
</footer>

</body>
</html>
