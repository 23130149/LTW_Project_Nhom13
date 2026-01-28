<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin - Quản lý liên hệ</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Sanpham/qlsanpham.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            font-family: "Poppins", sans-serif;
            background: #f4f6fa;
            color: #333;
            line-height: 1.6;
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .sliderbar {
            width: 250px;
            background: linear-gradient(to bottom, #11998e, #38ef7d);
            color: white;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            height: 100vh;
            position: fixed;
            top: 0;
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
        }

        .slidebar-header {
            padding: 0 20px 30px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: pink;
        }

        .slidebar-nav {
            flex-grow: 1;
            padding: 16px 0;
            overflow-y: auto;
        }

        .slidebar-nav ul {
            list-style: none;
        }

        .slidebar-nav li a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            transition: background-color 0.3s;
            position: relative;
        }

        .slidebar-nav i {
            margin-right: 15px;
            font-size: 21px;
        }

        .slidebar-nav li.active {
            background-color: #ffffff;
            border-radius: 0 50px 50px 0;
            margin-right: 20px;
        }

        .slidebar-nav li.active a {
            color: #11998e;
            font-weight: bold;
        }

        .slidebar-nav li.active a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 4px;
            background-color: #38ef7d;
        }

        .logout {
            padding: 20px;
            margin-top: auto;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logout a {
            display: flex;
            align-items: center;
        }

        .main-content {
            flex-grow: 1;
            margin-left: 250px;
            padding: 0 30px 30px;
        }

        .header {
            background: white;
            padding: 16px 32px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            position: fixed;
            top: 0;
            left: 250px;
            right: 0;
            z-index: 100;
        }

        .header h2 {
            font-size: 29px;
            font-weight: 600;
        }

        .search-box {
            display: flex;
            align-items: center;
            background: #f4f6fa;
            border-radius: 50px;
            padding: 5px 15px;
            box-shadow: none;
            border: 1px solid #ddd;
            flex-grow: 0.5;
            max-width: 450px;
        }

        .search-box input {
            border: none;
            outline: none;
            padding: 5px 10px;
            flex-grow: 1;
            background: transparent;
        }

        .search-box button {
            background: none;
            border: none;
            color: #666666;
            cursor: pointer;
            font-size: 16px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .notification-badge {
            position: relative;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;  /* Cố định khung để không đẩy các phần tử khác */
            height: 40px;
            border-radius: 50%;
            transition: background 0.3s;
        }

        .notification-badge:hover {
            background: #f0f2f5; /* Hiệu ứng hover nhẹ khi rê chuột vào */
        }

        .notification-badge i {
            font-size: 24px;
            color: #636e72;
        }

        /* Chấm đỏ số thông báo */
        .notification-badge .badge {
            position: absolute;
            top: 4px;       /* Căn chỉnh lại vị trí chuẩn trên đầu chuông */
            right: 4px;
            background: #ff4d4d;
            color: white;
            font-size: 10px;
            font-weight: 700;
            min-width: 16px;
            height: 16px;
            padding: 0 2px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #fff; /* Tạo viền trắng tách biệt chuông */
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            z-index: 10;
        }
        .profile-admin {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #ffffff;
            padding: 5px 15px 5px 5px;
            border-radius: 50px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #38ef7d;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
        }

        .profile-admin > div {
            display: flex;
            flex-direction: column;
            line-height: 1.2;
        }

        .user-name {
            font-weight: bold;
            font-size: 15px;
        }

        .user-role {
            font-size: 13px;
            color: #666666;
            display: block;
            margin: 0;
        }

        /* --- MAIN CONTENT --- */
        .main-content {
            flex-grow: 1;
            margin-left: 250px; /* Tránh Sidebar */
            padding: 110px 30px 30px; /* Tránh Header (80px + 30px gap) */
        }

        /* STATS CARD */
        .stats-grid { margin-bottom: 30px; }
        .stat-card {
            background: white; width: 250px; padding: 20px;
            border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            display: flex; align-items: center; gap: 15px;
        }
        .stat-icon {
            width: 45px; height: 45px; background: #e0f2fe;
            color: #11998e; border-radius: 10px;
            display: flex; align-items: center; justify-content: center; font-size: 20px;
        }
        .stat-details .value { font-size: 22px; font-weight: 700; display: block; }
        .stat-details .title { font-size: 13px; color: #888; }

        /* TABLE CONTAINER */
        .order-table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .data-table { width: 100%; border-collapse: collapse; }
        .data-table th {
            background: #f8fafc; padding: 15px; text-align: left;
            font-size: 13px; color: #64748b; text-transform: uppercase;
            border-bottom: 2px solid #edf2f7;
        }
        .data-table td { padding: 16px 15px; border-bottom: 1px solid #f1f5f9; font-size: 14px; }

        /* BADGES & MSG */
        .badge { padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; }
        .badge-user { background: #e0f2fe; color: #0369a1; }
        .badge-guest { background: #fef3c7; color: #92400e; }

        .msg-preview {
            max-width: 250px; display: block;
            white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
        }

        .action-icon {
            background: none; border: none; color: #ff7675;
            font-size: 18px; cursor: pointer; transition: 0.2s;
        }
        .action-icon:hover { color: #d63031; transform: scale(1.1); }
    </style>
</head>

<body>

<!-- SIDEBAR -->
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
            <li><a href="${pageContext.request.contextPath}/admin/reviews"><i class="bx bx-star"></i> Đánh giá</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/contacts"><i class="bx bx-envelope"></i> Liên hệ</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/setting"><i class="bx bx-cog"></i>Cài đặt</a></li>
        </ul>
    </nav>

    <div class="logout">
        <a href="${pageContext.request.contextPath}/home">
            <i class="bx bx-log-out"></i>Đăng xuất
        </a>
    </div>
</aside>

<!-- MAIN -->
<main class="main-content">

    <header class="header">
        <h2>Liên hệ</h2>
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

    <!-- STATS -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon"><i class="bx bx-envelope"></i></div>
            <div class="stat-details">
                <p class="title">Tổng liên hệ</p>
                <p class="value">${totalContacts}</p>
            </div>
        </div>
    </div>

    <!-- TABLE -->
    <div class="order-table-container">
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Tiêu đề</th>
                <th>Nội dung</th>
                <th>Loại</th>
                <th>Thao tác</th>
            </tr>
            </thead>

            <tbody>
            <c:if test="${empty contacts}">
                <tr>
                    <td colspan="7" style="text-align:center;color:#999">
                        Không có liên hệ phù hợp
                    </td>
                </tr>
            </c:if>

            <c:forEach var="c" items="${contacts}">
                <tr>
                    <td>#LH${c.contactId}</td>
                    <td>${c.contactName}</td>
                    <td>${c.contactEmail}</td>
                    <td>${c.subject}</td>

                    <td>
                        <span class="msg-preview" title="${c.message}">
                            <c:choose>
                                <c:when test="${fn:length(c.message) > 60}">
                                    ${fn:substring(c.message,0,60)}...
                                </c:when>
                                <c:otherwise>
                                    ${c.message}
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${c.userId != null}">
                                <span class="badge badge-user">User</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-guest">Guest</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <form action="${pageContext.request.contextPath}/admin/contacts"
                              method="post" style="display:inline">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="contactId" value="${c.contactId}">
                            <button class="action-icon"
                                    onclick="return confirm('Xoá liên hệ này?')">
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

</body>
</html>
