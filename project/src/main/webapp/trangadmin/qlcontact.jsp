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
        .search-review-box {
            display: flex;
            align-items: center;
            background: #fff;
            border-radius: 8px;
            padding: 8px 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,.08);
            gap: 8px;
        }
        .search-review-box input {
            border: none;
            outline: none;
            width: 260px;
        }
        .badge {
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 600;
        }
        .badge-user {
            background: #e0f2fe;
            color: #0369a1;
        }
        .badge-guest {
            background: #fef3c7;
            color: #92400e;
        }
        .msg-preview {
            max-width: 260px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: #555;
        }
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
            <li><a href="${pageContext.request.contextPath}/trangadmin/khachhang.jsp"><i class="bx bx-group"></i>Khách hàng</a></li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/reviews">
                    <i class="bx bx-star"></i> Đánh giá
                </a>
            </li>
            <li class="active">
                <a href="${pageContext.request.contextPath}/admin/contacts">
                    <i class="bx bx-envelope"></i> Liên hệ
                </a>
            </li>
            <li><a href="${pageContext.request.contextPath}/trangadmin/caidat.jsp"><i class="bx bx-cog"></i>Cài đặt</a></li>
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

    <!-- HEADER -->
    <header class="header">
        <h2>Liên hệ khách hàng</h2>

        <form class="search-review-box"
              method="get"
              action="${pageContext.request.contextPath}/admin/contacts">
            <i class="bx bx-search"></i>
            <input type="text"
                   name="keyword"
                   value="${param.keyword}"
                   placeholder="Tìm theo tên, email, tiêu đề...">
        </form>
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
