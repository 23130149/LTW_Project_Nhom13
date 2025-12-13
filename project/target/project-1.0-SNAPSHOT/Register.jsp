
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link href='https://cdn.boxicons.com/3.0.3/fonts/basic/boxicons.min.css' rel='stylesheet'>
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
      background: linear-gradient(135deg, #11998e, #38ef7d); ;
    }

    .wrapper{
      width: 420px;
      background:white;
      border: 2px solid rgb(0,0,0,1);
      color:black;
      border-radius: 10px;
      padding: 30px 40px;
    }
    .wrapper h1{
      text-align: center;
      font-size: 30px;
      color: black;
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
      border: 2px solid rgb(0,0,0,1);
      border-radius: 40px;
      color: black;
      padding: 20px 25px 20px 20px;
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
      background: linear-gradient(135deg, #11998e, #38ef7d); ;
      border: none;
      outline: none;
      border-radius: 30px;
      box-shadow: 0 0 10px rgb(0,0,0,0.1);
      cursor: pointer;
      font-size: 20px;
      color: white;
      font-weight: 600;
    }
  </style>
</head>
<body>
<div class="wrapper">
  <form action ="">
    <h1>Đăng Ký</h1>
    <div class ="input-box">
      <div class ="input-field">
        <input type="text" placeholder="Họ Tên" required>
        <i class='bx  bx-user'    ></i> </div>
      <div class ="input-field">
        <input type="text" placeholder="Email" required>
        <i class='bx  bx-envelope-alt'    ></i></div>
      <div class ="input-field">
        <input type="password" placeholder="Mật khẩu" required>
        <i class='bx  bx-lock'    ></i></div>
      <div class ="input-field"> <input type="password" placeholder="Xác Nhận Mật Khẩu" required>
        <i class='bx  bx-lock'    ></i> </div>
    </div>
    <div class ="term"> <label><input type ="checkbox"  required> Tôi đồng ý với điều khoản và điều kiện trong thỏa thuận
    </label>
    </div>
    <button type="submit" class ="btn">Đăng Ký</button>
  </form>
</div>
</body>
</html>