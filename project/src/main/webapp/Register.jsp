<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  </style>
</head>

<body>
<div class="wrapper">

  <!-- FORM ĐĂNG KÝ -->
  <form action="${pageContext.request.contextPath}/Register"
        method="post"
        id="registerForm">

    <h1>Đăng Ký</h1>

    <!-- HIỂN THỊ LỖI TỪ CONTROLLER -->
    <c:if test="${not empty error}">
      <p style="color:red; text-align:center;">${error}</p>
    </c:if>

    <div class="input-box">
      <div class="input-field">
        <input type="text" placeholder="Họ Tên" name="fullName" required>
        <i class='bx bx-user'></i>
      </div>
      <p id="nameMsg" class="msg"></p>

      <div class="input-field">
        <input type="email" placeholder="Email" name="email" required>
        <i class='bx bx-envelope-alt'></i>
      </div>
      <p id="emailMsg" class="msg"></p>

      <div class="input-field">
        <input type="password" placeholder="Mật khẩu" name="password" required>
        <i class='bx bx-lock'></i>
      </div>
      <p id="passwordMsg" class="msg"></p>

      <div class="input-field">
        <input type="password"
               placeholder="Xác Nhận Mật Khẩu"
               name="confirmPassword" required>
        <i class='bx bx-lock'></i>
      </div>
      <p id="confirmMsg" class="msg"></p>
    </div>

    <!-- CHECKBOX -->
    <div class="term">
      <label>
        <input type="checkbox" required>
        Tôi đồng ý với điều khoản và điều kiện
      </label>
    </div>

    <button type="submit" class="btn">Đăng Ký</button>
  </form>

</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {

    const form = document.getElementById("registerForm");

    const fullName = form.fullName;
    const email = form.email;
    const password = form.password;
    const confirmPassword = form.confirmPassword;

    const nameMsg = document.getElementById("nameMsg");
    const emailMsg = document.getElementById("emailMsg");
    const passwordMsg = document.getElementById("passwordMsg");
    const confirmMsg = document.getElementById("confirmMsg");

    function showMsg(el, msg, ok) {
      el.innerHTML = (ok ? "✔ " : "❌ ") + msg;
      el.style.color = ok ? "green" : "red";
    }

    fullName.addEventListener("input", () => {
      const regex = /^([A-ZÀ-Ỹ][a-zà-ỹ]+)(\s[A-ZÀ-Ỹ][a-zà-ỹ]+)*$/;
      showMsg(nameMsg,
              "Viết hoa chữ cái đầu mỗi từ",
              regex.test(fullName.value.trim()));
    });

    email.addEventListener("input", () => {
      showMsg(emailMsg,
              "Email phải kết thúc bằng @gmail.com",
              email.value.endsWith("@gmail.com"));
    });

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

    confirmPassword.addEventListener("input", () => {
      showMsg(confirmMsg,
              "Mật khẩu xác nhận phải trùng",
              confirmPassword.value === password.value &&
              confirmPassword.value !== "");
    });

    form.addEventListener("submit", function (e) {
      if (
              nameMsg.style.color !== "green" ||
              emailMsg.style.color !== "green" ||
              passwordMsg.style.color !== "green" ||
              confirmMsg.style.color !== "green"
      ) {
        e.preventDefault();
        alert("Vui lòng nhập đúng thông tin!");
      }
    });
  });
</script>

</body>
</html>
