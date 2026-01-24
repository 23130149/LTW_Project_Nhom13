<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Sổ địa chỉ - Handmade House</title>

  <!-- CSS -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/account.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

  <!-- ICON + FONT -->
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    .address-box {
      max-width: 650px;
      background: #fff;
      padding: 30px;
      border-radius: 14px;
    }

    .address-item {
      border: 1px solid #ddd;
      padding: 14px;
      border-radius: 10px;
      margin-bottom: 12px;
    }

    .address-item p {
      margin: 0 0 6px 0;
    }

    .address-item a {
      margin-right: 10px;
      font-size: 14px;
    }

    .form-row {
      margin-bottom: 16px;
    }

    .form-row label {
      font-weight: 600;
      display: block;
      margin-bottom: 6px;
    }

    .form-row input {
      width: 100%;
      padding: 11px 12px;
      border-radius: 8px;
      border: 1px solid #ddd;
      font-size: 14px;
    }

    .address-actions {
      margin-top: 24px;
      display: flex;
      justify-content: flex-end;
    }

    .btn-save {
      background: #111;
      color: #fff;
      padding: 10px 22px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
    }
  </style>
</head>

<body>

<!-- ===== HEADER ===== -->
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

<!-- ===== MAIN ===== -->
<main class="about-us-container">

  <h1>Sổ địa chỉ</h1>

  <!-- USER INFO -->
  <div class="account-info">
    <i class='bx bxs-user-circle'></i>
    <h3>${sessionScope.user.userName}</h3>
    <p>${sessionScope.user.email}</p>
  </div>

  <!-- MENU -->
  <ul class="account-menu">
    <li>
      <a href="${pageContext.request.contextPath}/Account">
        <i class='bx bx-home'></i>
        <span>Tổng quan</span>
      </a>
    </li>
    <li>
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
    <li class="active">
      <a href="${pageContext.request.contextPath}/Address">
        <i class='bx bx-map'></i>
        <span>Sổ địa chỉ</span>
      </a>
    </li>
  </ul>

  <!-- ===== ADDRESS LIST ===== -->
  <div class="recent-orders-box address-box">
    <h2>Danh sách địa chỉ</h2>

    <c:if test="${empty addresses}">
      <p>Bạn chưa có địa chỉ nào.</p>
    </c:if>

    <c:forEach items="${addresses}" var="addr">
      <div class="address-item">
        <p>
            ${addr.country}, ${addr.province},
            ${addr.district}, ${addr.street}
        </p>
        <a href="${pageContext.request.contextPath}/Address?edit=${addr.userAddressId}">
          Sửa
        </a>
        |
        <a href="${pageContext.request.contextPath}/Address?delete=${addr.userAddressId}"
           onclick="return confirm('Xóa địa chỉ này?')">
          Xóa
        </a>
      </div>
    </c:forEach>
  </div>

  <!-- ===== ADDRESS FORM ===== -->
  <div class="recent-orders-box address-box" style="margin-top:30px">
    <h2>
      <c:choose>
        <c:when test="${address.userAddressId > 0}">
          Cập nhật địa chỉ
        </c:when>
        <c:otherwise>
          Thêm địa chỉ mới
        </c:otherwise>
      </c:choose>
    </h2>

    <form action="${pageContext.request.contextPath}/Address" method="post">

      <input type="hidden" name="userAddressId"
             value="${address.userAddressId}" />

      <div class="form-row">
        <label>Quốc gia</label>
        <input type="text" name="country"
               value="${address.country}" required>
      </div>

      <div class="form-row">
        <label>Tỉnh / Thành phố</label>
        <input type="text" name="province"
               value="${address.province}" required>
      </div>

      <div class="form-row">
        <label>Quận / Huyện</label>
        <input type="text" name="district"
               value="${address.district}" required>
      </div>

      <div class="form-row">
        <label>Địa chỉ chi tiết</label>
        <input type="text" name="street"
               value="${address.street}" required>
      </div>

      <div class="address-actions">
        <button type="submit" class="btn-save">
          Lưu địa chỉ
        </button>
      </div>

    </form>
  </div>

</main>

<!-- ===== FOOTER ===== -->
<footer class="footer">
  <div class="container">
    <div class="footer-bottom">
      <p>© 2025 Handmade House. Tất cả quyền được bảo lưu.</p>
    </div>
  </div>
</footer>

</body>
</html>
