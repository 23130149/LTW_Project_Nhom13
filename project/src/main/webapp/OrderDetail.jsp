<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="util" uri="http://handmade/util" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Chi tiết đơn hàng - Handmade House</title>

  <!-- CSS dùng chung -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/account.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

  <!-- ICON + FONT -->
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>

<header class="header">
  <div class="header-top-container">
    <div class="header-content">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/home">Handmade House</a>
      </div>
      <form class="search-form" action="${pageContext.request.contextPath}/product" method="GET">
        <input type="text" class="search-input" name="keyword" value="${keyword}" placeholder="Tìm kiếm bất cứ thứ gì" aria-label="Tìm kiếm sản phẩm" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false">
        <button type="submit" class="search-btn">
          <i class="bx bx-search-alt-2"></i>
        </button>
      </form>
      <div class="icons">
        <a href="${pageContext.request.contextPath}/cart" class="icon-btn cart-icon">
                    <span class="cart-wrap">
                        <i class="bx bx-cart"></i>
                        <span class="cart-badge ${cart.totalQuantity == 0 ? 'hidden' : ''}">
                          ${cart.totalQuantity}
                        </span>
                    </span>
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
          <li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
        </ul>
      </nav>
    </div>
  </div>
</header>

<main class="about-us-container">

  <h1>Chi tiết đơn hàng</h1>

  <div class="recent-orders-box">
    <h2>Thông tin đơn hàng</h2>

    <table class="orders-table">
      <tr>
        <th>Mã đơn</th>
        <td>${order.orderCode}</td>
      </tr>
      <tr>
        <th>Ngày đặt</th>
        <td>${util:formatDateTime(order.createAt)}</td>
      </tr>
      <tr>
        <th>Trạng thái</th>
        <td>
          ${util:orderStatusIcon(order.status)}
          ${util:orderStatusLabel(order.status)}
        </td>
      </tr>
      <tr>
        <th>Tổng tiền</th>
        <td>${util:formatMoney(order.totalPrice)}</td>
      </tr>
      <tr>
        <th>Ghi chú</th>
        <td>${order.note}</td>
      </tr>
    </table>
  </div>

  <div class="recent-orders-box">
    <h2>Sản phẩm trong đơn</h2>

    <table class="orders-table">
      <thead>
      <tr>
        <th>Sản phẩm</th>
        <th>Đơn giá</th>
        <th>Số lượng</th>
        <th>Thành tiền</th>
      </tr>
      </thead>

      <tbody>
      <c:forEach var="item" items="${orderItems}">
        <tr>
          <td>${item.productName}</td>
          <td>${util:formatMoney(item.unitPrice)}</td>
          <td>${item.quantity}</td>
          <td>
              ${util:formatMoney(item.unitPrice.multiply(item.quantity))}
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <a href="${pageContext.request.contextPath}/OrderHistory"
     class="btn-logout"
     style="background:#11998e">
    Quay lại lịch sử đơn hàng
  </a>

</main>

<footer class="footer">
  <div class="container">

    <div class="footer-content">

      <div class="footer-column">
        <h3 class="footer-logo">Handmade House</h3>
        <p class="footer-desc">
          Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn
          yêu nghệ thuật và thủ công.
        </p>
        <div class="social-links">
          <a href="#"><i class="bx bxl-facebook"></i></a>
          <a href="#"><i class="bx bxl-instagram"></i></a>
          <a href="#"><i class="bx bxl-tiktok"></i></a>
        </div>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Hỗ trợ</h3>
        <ul class="footer-links">
          <li><a href="#">Chính sách đổi trả</a></li>
          <li><a href="#">Hướng dẫn đặt hàng</a></li>
          <li><a href="#">FAQ</a></li>
        </ul>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Liên hệ</h3>
        <ul class="footer-links">
          <li>📍 Linh Trung, Thủ Đức, TP.HCM</li>
          <li>📞 0944 912 685</li>
          <li>📧 handmadehouse23@handmade.vn</li>
        </ul>
      </div>

    </div>

    <div class="footer-bottom">
      <p>© 2025 Handmade House. All rights reserved.</p>
    </div>

  </div>
</footer>

</body>
</html>
