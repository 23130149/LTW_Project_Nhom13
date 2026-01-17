<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân - Handmade House</title>
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
                <a href="${pageContext.request.contextPath}/Home">Handmade House</a>
            </div>

            <form class="search-form"
                  action="${pageContext.request.contextPath}/Search"
                  method="GET">
                <input type="text" class="search-input"
                       name="keyword"
                       placeholder="Tìm kiếm bất cứ thứ gì...">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>

            <div class="icons">
                <a href="${pageContext.request.contextPath}/Favourite" class="icon-btn">
                    <i class='bx bx-heart'></i>
                </a>
                <a href="${pageContext.request.contextPath}/Cart" class="icon-btn">
                    <i class='bx bx-cart'></i>
                </a>
                <a href="${pageContext.request.contextPath}/Account" class="icon-btn">
                    <i class='bx bx-user'></i>
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

<main class="about-us-container">

    <h1>Thông tin cá nhân</h1>

    <div class="account-info">
        <i class='bx bxs-user-circle'></i>
        <h3>${sessionScope.user.userName}</h3>
        <p>${sessionScope.user.email}</p>
    </div>
    <ul class="account-menu">
        <li>
            <a href="${pageContext.request.contextPath}/Account">
                <i class='bx bx-home'></i>
                <span>Tổng quan</span>
            </a>
        </li>
        <li class="active">
            <a href="${pageContext.request.contextPath}/Profile">
                <i class='bx bx-edit-alt'></i>
                <span>Thông tin cá nhân</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/ChangePassword">
                <i class='bx bx-lock-alt'></i>
                <span>Đổi mật khẩu</span>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/Address">
                <i class='bx bx-map'></i>
                <span>Sổ địa chỉ</span>
            </a>
        </li>
    </ul>

    <div class="recent-orders-box">
        <h2>Chi tiết hồ sơ</h2>

        <table class="orders-table">
            <tr>
                <th>Họ và tên</th>
                <td>${sessionScope.user.userName}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>${sessionScope.user.email}</td>
            </tr>
            <tr>
                <th>Số điện thoại</th>
                <td>${sessionScope.user.phone}</td>
            </tr>
            <tr>
                <th>Địa chỉ</th>
                <td>${sessionScope.user.address}</td>
            </tr>
        </table>

        <a href="${pageContext.request.contextPath}/Profile/Edit"
           class="btn-logout">
            Chỉnh sửa hồ sơ
        </a>
    </div>

</main>

<footer class="footer">
    <div class="container">
        <div class="footer-content">

            <div class="footer-bottom">
                <p>© 2025 Handmade House. Tất cả quyền được bảo lưu.</p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
