  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đổi mật khẩu - Handmade House</title>

  <!-- CSS -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/account.css">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/Header_Footer/Styles.css">

  <!-- ICON + FONT -->
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <!-- STYLE RIÊNG -->
  <style>
    .password-box {
      max-width: 520px;
      margin: 30px auto;
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

    .msg {
      font-size: 13px;
      margin: 4px 6px;
    }

    .password-actions {
      display: flex;
      justify-content: space-between;
      margin-top: 22px;
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
  </style>
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

  <h1>Đổi mật khẩu</h1>
  <c:if test="${not empty error}">
    <p style="color:red; text-align:center; margin-bottom: 15px;">
        ${error}
    </p>
  </c:if>
  <div class="password-box">

    <form action="${pageContext.request.contextPath}/ChangePassword"
          method="post"
          id="changePasswordForm">

      <div class="form-row">
        <label>Mật khẩu hiện tại</label>
        <input type="password" name="oldPassword" required>
      </div>

      <div class="form-row">
        <label>Mật khẩu mới</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <p id="passwordMsg" class="msg"></p>
      </div>

      <div class="form-row">
        <label>Nhập lại mật khẩu mới</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>
        <p id="confirmMsg" class="msg"></p>
      </div>

      <div class="password-actions">
        <button type="submit" class="btn-save">
          Cập nhật mật khẩu
        </button>

        <a href="${pageContext.request.contextPath}/Profile"
           class="btn-back">
          Quay lại
        </a>
      </div>

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
  document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("changePasswordForm");
    const newPassword = document.getElementById("newPassword");
    const confirmPassword = document.getElementById("confirmPassword");

    const passwordMsg = document.getElementById("passwordMsg");
    const confirmMsg = document.getElementById("confirmMsg");

    function showMsg(el, msg, ok) {
      el.innerHTML = (ok ? "✔ " : "❌ ") + msg;
      el.style.color = ok ? "green" : "red";
    }

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
              "Ít nhất 8 ký tự, gồm hoa, thường, số và ký tự đặc biệt",
              ok
      );
    });

    confirmPassword.addEventListener("input", () => {
      showMsg(
              confirmMsg,
              "Mật khẩu xác nhận phải trùng",
              confirmPassword.value === newPassword.value &&
              confirmPassword.value !== ""
      );
    });

    form.addEventListener("submit", function (e) {
      if (
              passwordMsg.style.color !== "green" ||
              confirmMsg.style.color !== "green"
      ) {
        e.preventDefault();
        alert("Vui lòng nhập mật khẩu hợp lệ!");
      }
    });
  });
</script>

</body>
</html>
