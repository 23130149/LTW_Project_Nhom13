<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Đăng Ký</title>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <style>
    *{
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    body{
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: linear-gradient(135deg, #11998e, #38ef7d);
    }

    .wrapper{
      width: 420px;
      background:white;
      border: 2px solid rgba(0,0,0,1);
      color:black;
      border-radius: 10px;
      padding: 30px 40px;
    }

    .wrapper h1{
      text-align: center;
      font-size: 30px;
      color: black;
      margin-bottom: 25px;
    }

    .wrapper .input-box .input-field{
      width: 100%;
      height: 50px;
      margin: 15px 0;
      position: relative;
    }

    .input-box input{
      width: 100%;
      height: 100%;
      background: transparent;
      outline: none;
      border: 2px solid rgba(0,0,0,1);
      border-radius: 40px;
      color: black;
      padding: 0 25px 0 20px;
    }
    .input-box input::placeholder{
      color: black;
    }
    .input-box i   {
      position: absolute;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 20px;
    }
    .wrapper .term {
      display: flex;
      justify-content: space-between;
      font-size: 14.5px;
      margin: 4px 0 15px;
    }
    .term label input{
      accent-color: Black;
      margin-right: 3px;
    }
    .term a{
      text-decoration: none;
      color: Black;
    }
    .wrapper .btn{
      width: 100%;
      height: 45px;
      background: linear-gradient(135deg, #11998e, #38ef7d);
      border: none;
      outline: none;
      border-radius: 30px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      cursor: pointer;
      font-size: 20px;
      color: white;
      font-weight: 600;
    }
  </style>
</head>
<body>
<div class="wrapper">
  <form action="RegisterController" method="post" id="registerForm">
    <h1>Đăng Ký</h1>
    <div class="input-box">
      <div class="input-field">
        <input type="text" placeholder="Họ Tên" name="fullName" required>
        <i class='bx bx-user'></i>
      </div>
      <div class="input-field">
        <input type="email" placeholder="Email" name="email" required>
        <i class='bx bx-envelope-alt'></i>
      </div>
      <div class="input-field">
        <input type="password" placeholder="Mật khẩu" name="password" required>
        <i class='bx bx-lock'></i>
      </div>
      <div class="input-field">
        <input type="password" placeholder="Xác Nhận Mật Khẩu" name="confirmPassword" required>
        <i class='bx bx-lock'></i>
      </div>
    </div>
    <div class="term">
      <label><input type="checkbox" required> Tôi đồng ý với điều khoản và điều kiện trong thỏa thuận</label>
    </div>
    <button type="submit" class="btn">Đăng Ký</button>
  </form>

  <div id="successMessage" style="display: none; text-align: center; padding: 20px 0;">
    <h1>Đăng ký thành công!</h1>
    <p style="margin: 20px 0;">Vui lòng Đăng Nhập để tiếp tục.</p>
    <a href="SignIn.jsp" class="btn" style="text-decoration: none; display: inline-block; line-height: 45px; width: 100%;">Đăng Nhập</a>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
    const successMessage = document.getElementById('successMessage');

    registerForm.addEventListener('submit', function(event) {
      event.preventDefault();

      registerForm.style.display = 'none';

      successMessage.style.display = 'block';
    });
  });
</script>
</body>
</html>