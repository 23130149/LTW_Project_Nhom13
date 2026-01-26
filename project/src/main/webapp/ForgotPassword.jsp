<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quên mật khẩu - Handmade House</title>

  <!-- CSS -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/account.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

  <!-- ICON + FONT -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    .password-box {
      max-width: 520px;
      margin: 40px auto;
      background: #fff;
      padding: 30px;
      border-radius: 14px;
    }
    .form-row {
      margin-bottom: 14px;
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
    }
    .password-actions {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }
    .btn-save {
      background: #111;
      color: #fff;
      padding: 10px 22px;
      border-radius: 8px;
      border: none;
      cursor: pointer;
    }
    .btn-back {
      background: #eee;
      padding: 10px 18px;
      border-radius: 8px;
      text-decoration: none;
      color: #333;
    }
    .countdown {
      font-size: 13px;
      color: #666;
      margin-top: 6px;
    }
  </style>
</head>

<body>

<!-- ================= HEADER (COPY Y CHANG BLOG) ================= -->
<header class="header">
  <div class="header-top-container">
    <div class="header-content">

      <div class="logo">
        <a href="${pageContext.request.contextPath}/home">Handmade House</a>
      </div>

      <form class="search-form" action="#" method="GET">
        <input type="text" class="search-input"
               placeholder="Tìm kiếm bất cứ thứ gì...">
        <button type="submit" class="search-btn">
          <i class="bx bx-search-alt-2"></i>
        </button>
      </form>

      <div class="icons">
        <a href="${pageContext.request.contextPath}/cart" class="icon-btn">
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
          <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
          <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
          <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
          <li><a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a></li>
        </ul>
      </nav>
    </div>
  </div>
</header>

<!-- ================= MAIN ================= -->
<main class="about-us-container">

  <h1>Quên mật khẩu</h1>

  <c:if test="${not empty error}">
    <p style="color:red; text-align:center; margin-bottom: 15px;">
        ${error}
    </p>
  </c:if>

  <div class="password-box">

    <form action="${pageContext.request.contextPath}/ForgotPassword"
          method="post">

      <!-- ===== BƯỚC 1: NHẬP EMAIL ===== -->
      <c:if test="${empty step}">
        <div class="form-row">
          <label>Email đăng ký</label>
          <input type="email"
                 name="email"
                 placeholder="Nhập Gmail của bạn"
                 required>
        </div>

        <div class="password-actions">
          <button type="submit"
                  class="btn-save"
                  name="action"
                  value="sendOtp">
            Gửi OTP
          </button>

          <a href="${pageContext.request.contextPath}/SignIn"
             class="btn-back">
            Quay lại
          </a>
        </div>
      </c:if>

      <c:if test="${step == 'OTP_SENT'}">

        <div class="form-row">
          <label>OTP</label>
          <input type="text"
                 name="otp"
                 placeholder="Nhập mã OTP"
                 required>
        </div>

        <div class="form-row">
          <label>Mật khẩu mới</label>
          <input type="password"
                 name="newPassword"
                 id="newPassword"
                 required>
          <p id="passwordMsg" class="msg"></p>
        </div>

        <div class="form-row">
          <label>Nhập lại mật khẩu mới</label>
          <input type="password"
                 name="confirmPassword"
                 id="confirmPassword"
                 required>
          <p id="confirmMsg" class="msg"></p>
        </div>


        <c:if test="${resendRemain > 0}">
          <div class="countdown">
            Gửi lại OTP sau ${resendRemain} giây
          </div>
        </c:if>

        <div class="password-actions">
          <button type="submit"
                  class="btn-save"
                  name="action"
                  value="confirm">
            Xác nhận
          </button>

          <button type="submit"
                  class="btn-back"
                  name="action"
                  value="sendOtp"
            ${resendRemain > 0 ? "disabled" : ""}>
            Gửi lại OTP
          </button>
        </div>

      </c:if>

    </form>
  </div>

</main>

<footer class="footer">
  <div class="container">
    <div class="footer-content">

      <div class="footer-column">
        <h3 class="footer-logo">Handmade House</h3>
        <p class="footer-desc">
          Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn yêu nghệ thuật và thủ công.
        </p>
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
          <li><a href="#">Giá trị & Triết lý</a></li>
          <li><a href="#">Quy trình sản xuất</a></li>
          <li><a href="#">Định hướng bền vững</a></li>
        </ul>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Hỗ trợ</h3>
        <ul class="footer-links">
          <li><a href="#">Chính sách đổi trả</a></li>
          <li><a href="#">Hướng dẫn đặt hàng</a></li>
          <li><a href="#">Thanh toán</a></li>
          <li><a href="#">FAQ</a></li>
        </ul>
      </div>

      <div class="footer-column">
        <h3 class="footer-title">Liên hệ</h3>
        <ul class="footer-links">
          <li>📍 Thủ Đức, TP.HCM</li>
          <li>📞 0944912685</li>
          <li>📧 handmadehouse23@handmade.vn</li>
        </ul>
      </div>

    </div>

    <div class="footer-bottom">
      <p>© 2025 Handmade House. Tất cả quyền được bảo lưu.</p>
    </div>
  </div>
</footer>
<script>
  const newPassword = document.getElementById("newPassword");
  const confirmPassword = document.getElementById("confirmPassword");
  const passwordMsg = document.getElementById("passwordMsg");
  const confirmMsg = document.getElementById("confirmMsg");

  function showMsg(el, msg, ok) {
    if (!el) return;
    el.innerHTML = (ok ? "✔ " : "❌ ") + msg;
    el.style.color = ok ? "green" : "red";
  }

  if (newPassword) {
    newPassword.addEventListener("input", () => {
      const v = newPassword.value;
      const ok =
              /[A-Z]/.test(v) &&
              /[a-z]/.test(v) &&
              /\d/.test(v) &&
              /[^A-Za-z0-9]/.test(v) &&
              v.length >= 8;

      showMsg(
              passwordMsg,
              "Ít nhất 8 ký tự, gồm hoa, thường, số, ký tự đặc biệt",
              ok
      );
    });
  }

  if (confirmPassword) {
    confirmPassword.addEventListener("input", () => {
      showMsg(
              confirmMsg,
              "Mật khẩu xác nhận phải trùng",
              confirmPassword.value === newPassword.value &&
              confirmPassword.value !== ""
      );
    });
  }
</script>

</body>
</html>
