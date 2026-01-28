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
      margin-bottom: 30px;
    }

    .address-item {
      border: 1px solid #ddd;
      padding: 14px;
      border-radius: 10px;
      margin-bottom: 12px;
    }

    .address-item p {
      margin: 0 0 6px 0;
      font-size: 14px;
    }

    .address-item a {
      margin-right: 12px;
      font-size: 14px;
      color: #111;
      text-decoration: none;
    }

    .address-item a:hover {
      text-decoration: underline;
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
      justify-content: space-between;
      align-items: center;
    }

    .btn-save {
      background: #111;
      color: #fff;
      padding: 10px 22px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
    }

    .btn-cancel {
      font-size: 14px;
      text-decoration: none;
      color: #555;
    }
  </style>
</head>

<body>

<header class="header">
  <div class="header-top-container">
    <div class="header-content">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/home">Handmade House</a>
      </div>
      <form class="search-form" action="#" method="GET">
        <input type="text" class="search-input" placeholder="Tìm kiếm bất cứ thứ gì..."
               aria-label="Tìm kiếm sản phẩm">
        <button type="submit" class="search-btn">
          <i class="bx bx-search-alt-2"></i>
        </button>
      </form>
      <div class="icons">
        <a href="${pageContext.request.contextPath}/cart" class="icon-btn" id="cartBtn">
          <i class='bx  bx-cart'></i>
        </a>
        <a href="${pageContext.request.contextPath}/Account" class="icon-btn" id="userBtn">
          <i class='bx  bx-user'></i>
        </a>
      </div>
    </div>
  </div>
  <div class="search-bar-section header-bottom-nav">
    <div class="container nav-only-container">
      <nav class="nav__links">
        <ul>
          <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
          <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
          <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
          <li><a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a></li>
        </ul>
      </nav>
    </div>
  </div>
</header>

<main class="about-us-container">

  <h1>Sổ địa chỉ</h1>

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

  <!-- ================= DANH SÁCH ĐỊA CHỈ ================= -->
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

  <!-- ================= FORM THÊM / SỬA ================= -->
  <div class="recent-orders-box address-box">
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

    <form action="${pageContext.request.contextPath}/Address"
          method="post">

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

        <c:if test="${address.userAddressId > 0}">
          <a href="${pageContext.request.contextPath}/Address"
             class="btn-cancel">
            Hủy sửa
          </a>
        </c:if>
      </div>

    </form>
  </div>

</main>

<footer class="footer">
  <div class="container">
    <div class="footer-content">
      <div class="footer-column">
        <h3 class="footer-logo">Handmade House</h3>
        <p class="footer-desc">Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn yêu nghệ thuật
          và thủ công.</p>
        <div class="social-links">
          <a href="#"><i class="bx bxl-facebook"></i></a>
          <a href="#"><i class="bx bxl-instagram"></i></a>
          <a href="#"><i class="bx bxl-tiktok"></i></a>
        </div>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Blog</h3>
        <ul class="footer-links">
          <li><a href="#">Câu chuyện thương hiệu</a></li>
          <li><a href="#"> Giá trị & Triết lý thương hiệu</a></li>
          <li><a href="#">Quy trình sản xuất</a></li>
          <li><a href="#">Cam kết & Định hướng bền vững</a></li>
        </ul>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Hỗ trợ</h3>
        <ul class="footer-links">
          <li><a href="#">Chính sách đổi trả</a></li>
          <li><a href="#">Hướng dẫn đặt hàng</a></li>
          <li><a href="#">Phương thức thanh toán</a></li>
          <li><a href="#">Câu hỏi thường gặp</a></li>
        </ul>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Liên hệ</h3>
        <ul class="footer-links">
          <li>📍 Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh</li>
          <li>📞 0944912685</li>
          <li>📧 handmadehouse23@handmade.vn</li>
          <li>🕐 T2 - CN: 8:00 - 17:00</li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>@2025 Handmade. Tất cả quyền được bảo lưu.</p>
    </div>
  </div>
</footer>

</body>
</html>
