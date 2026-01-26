<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng Ký</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/css/dangky.css">
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

  <style>
    .msg {
      font-size: 13px;
      margin: 4px 10px;
    }
    .otp-box {
      margin-top: 18px;
      padding-top: 16px;
      border-top: 1px dashed #ddd;
    }
  </style>
</head>

<body>

<div class="wrapper">

  <form action="${pageContext.request.contextPath}/Register"
        method="post"
        id="registerForm">

    <h1>Đăng Ký</h1>

    <c:if test="${not empty error}">
      <p style="color:red; text-align:center; margin-bottom:12px;">
          ${error}
      </p>
    </c:if>

    <c:if test="${empty step}">

      <div class="input-box">

        <div class="input-field">
          <input type="text" placeholder="Họ Tên"
                 name="fullName" required>
          <i class='bx bx-user'></i>
        </div>
        <p id="nameMsg" class="msg"></p>

        <div class="input-field">
          <input type="email" placeholder="Email"
                 name="email" required>
          <i class='bx bx-envelope'></i>
        </div>
        <p id="emailMsg" class="msg"></p>

        <div class="input-field">
          <input type="password" placeholder="Mật khẩu"
                 name="password" required>
          <i class='bx bx-lock'></i>
        </div>
        <p id="passwordMsg" class="msg"></p>

        <div class="input-field">
          <input type="password"
                 placeholder="Xác nhận mật khẩu"
                 name="confirmPassword" required>
          <i class='bx bx-lock'></i>
        </div>
        <p id="confirmMsg" class="msg"></p>

      </div>

      <div class="term">
        <label>
          <input type="checkbox" required>
          Tôi đồng ý với điều khoản và điều kiện
        </label>
      </div>

      <button type="submit"
              class="btn"
              name="action"
              value="sendOtp">
        Gửi OTP xác nhận email
      </button>

    </c:if>

    <!-- ================== BƯỚC 2: NHẬP OTP ================== -->
    <c:if test="${step == 'OTP_SENT'}">

      <div class="otp-box">

        <p style="text-align:center; font-size:14px; margin-bottom:10px;">
          Mã OTP đã được gửi đến email của bạn.
        </p>

        <div class="input-field">
          <input type="text"
                 name="otp"
                 placeholder="Nhập mã OTP (6 chữ số)"
                 required>
          <i class='bx bx-key'></i>
        </div>

        <button type="submit"
                class="btn"
                name="action"
                value="confirmOtp"
                style="margin-top:14px;">
          Xác nhận đăng ký
        </button>

      </div>

    </c:if>

    <div class="register-link">
      <p>
        Đã có tài khoản?
        <a href="${pageContext.request.contextPath}/SignIn.jsp">
          Đăng nhập
        </a>
      </p>
    </div>

  </form>

</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("registerForm");
    if (!form) return;

    const fullName = form.fullName;
    const email = form.email;
    const password = form.password;
    const confirmPassword = form.confirmPassword;

    const nameMsg = document.getElementById("nameMsg");
    const emailMsg = document.getElementById("emailMsg");
    const passwordMsg = document.getElementById("passwordMsg");
    const confirmMsg = document.getElementById("confirmMsg");

    function showMsg(el, msg, ok) {
      if (!el) return;
      el.innerHTML = (ok ? "✔ " : "❌ ") + msg;
      el.style.color = ok ? "green" : "red";
    }

    if (fullName) {
      fullName.addEventListener("input", () => {
        const regex = /^([A-ZÀ-Ỹ][a-zà-ỹ]+)(\s[A-ZÀ-Ỹ][a-zà-ỹ]+)*$/;
        showMsg(nameMsg,
                "Viết hoa chữ cái đầu mỗi từ",
                regex.test(fullName.value.trim()));
      });
    }

    if (email) {
      email.addEventListener("input", () => {
        showMsg(emailMsg,
                "Email phải kết thúc bằng @gmail.com",
                email.value.endsWith("@gmail.com"));
      });
    }

    if (password) {
      password.addEventListener("input", () => {
        const v = password.value;
        const ok =
                /[A-Z]/.test(v) &&
                /[a-z]/.test(v) &&
                /\d/.test(v) &&
                /[^A-Za-z0-9]/.test(v) &&
                v.length >= 8;

        showMsg(passwordMsg,
                "Ít nhất 8 ký tự, đủ mạnh",
                ok);
      });
    }

    if (confirmPassword) {
      confirmPassword.addEventListener("input", () => {
        showMsg(confirmMsg,
                "Mật khẩu xác nhận phải trùng",
                confirmPassword.value === password.value &&
                confirmPassword.value !== "");
      });
    }

    form.addEventListener("submit", function (e) {
      if (
              nameMsg && nameMsg.style.color !== "green" ||
              emailMsg && emailMsg.style.color !== "green" ||
              passwordMsg && passwordMsg.style.color !== "green" ||
              confirmMsg && confirmMsg.style.color !== "green"
      ) {
        if (!document.querySelector("input[name='otp']")) {
          e.preventDefault();
          alert("Vui lòng nhập đúng thông tin!");
        }
      }
    });
  });
</script>

</body>
</html>
