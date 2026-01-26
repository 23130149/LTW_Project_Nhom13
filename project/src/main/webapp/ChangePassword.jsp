<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đổi mật khẩu - Handmade House</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/account.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

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

    .msg {
      font-size: 13px;
      margin-top: 4px;
    }
  </style>
</head>

<body>

<header class="header">
  <div class="header-top-container">
    <div class="header-content">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/Home">Handmade House</a>
      </div>

      <form class="search-form">
        <input type="text" class="search-input"
               placeholder="Tìm kiếm bất cứ thứ gì...">
        <button type="submit" class="search-btn">
          <i class="bx bx-search-alt-2"></i>
        </button>
      </form>

      <div class="icons">
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
          <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
          <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
          <li><a href="${pageContext.request.contextPath}/Blog">Blog.jsp</a></li>
          <li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
        </ul>
      </nav>
    </div>
  </div>
</header>

<main class="about-us-container">

  <h1>Đổi mật khẩu</h1>

  <c:if test="${not empty error}">
    <p style="color:red; text-align:center; margin-bottom:15px;">
        ${error}
    </p>
  </c:if>

  <div class="password-box">
    <form action="${pageContext.request.contextPath}/ChangePassword"
          method="post">

      <c:if test="${empty step}">
        <div class="form-row">
          <label>Mật khẩu hiện tại</label>
          <input type="password" name="oldPassword" required>
        </div>

        <div class="password-actions">
          <button type="submit" class="btn-save"
                  name="action" value="sendOtp">
            Gửi OTP
          </button>

          <a href="${pageContext.request.contextPath}/Profile"
             class="btn-back">
            Quay lại
          </a>
        </div>
      </c:if>

      <c:if test="${step == 'OTP_SENT'}">
        <div class="form-row">
          <label>OTP</label>
          <input type="text" name="otp" required>
        </div>

        <div class="form-row">
          <label>Mật khẩu mới</label>
          <input type="password" name="newPassword"
                 id="newPassword" required>
          <p id="passwordMsg" class="msg"></p>
        </div>

        <div class="form-row">
          <label>Nhập lại mật khẩu mới</label>
          <input type="password" name="confirmPassword"
                 id="confirmPassword" required>
          <p id="confirmMsg" class="msg"></p>
        </div>

        <div class="countdown" id="countdownText"></div>

        <div class="password-actions">
          <button type="submit" class="btn-save"
                  name="action" value="confirm">
            Xác nhận đổi mật khẩu
          </button>

          <button type="submit" class="btn-back"
                  name="action" value="sendOtp"
                  id="resendBtn"
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
    <div class="footer-bottom">
      <p>© 2025 Handmade House. Tất cả quyền được bảo lưu.</p>
    </div>
  </div>
</footer>

<script>
  let remain = ${resendRemain != null ? resendRemain : 0};
  const btn = document.getElementById("resendBtn");
  const txt = document.getElementById("countdownText");

  if (btn && remain > 0) {
    btn.disabled = true;
    txt.innerText = "Gửi lại OTP sau " + remain + " giây";
    const timer = setInterval(() => {
      remain--;
      if (remain <= 0) {
        clearInterval(timer);
        btn.disabled = false;
        txt.innerText = "Bạn có thể gửi lại OTP";
      } else {
        txt.innerText = "Gửi lại OTP sau " + remain + " giây";
      }
    }, 1000);
  }

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

      showMsg(passwordMsg,
              "Ít nhất 8 ký tự, hoa, thường, số, ký tự đặc biệt",
              ok);
    });
  }

  if (confirmPassword) {
    confirmPassword.addEventListener("input", () => {
      showMsg(confirmMsg,
              "Mật khẩu xác nhận phải trùng",
              confirmPassword.value === newPassword.value &&
              confirmPassword.value !== "");
    });
  }
</script>

</body>
</html>
