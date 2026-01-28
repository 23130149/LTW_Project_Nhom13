<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/trangadmin/Caidat/caidat.css">
    <meta charset="UTF-8">
    <title>Admin - Cài đặt</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<aside class="sliderbar">
    <div class="slidebar-header">
        <h2 class="logo">Handmade House</h2>
    </div>
    <nav class="slidebar-nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="bx bx-chart"></i>Tổng quan</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/products"><i class="bx bx-package"></i>Sản phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="bx bx-receipt"></i>Đơn hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/customers"><i class="bx bx-group"></i>Khách hàng</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/reviews"><i class="bx bx-star"></i>Đánh giá</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/contacts"><i class="bx bx-envelope"></i> Liên hệ</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/setting"><i class="bx bx-cog"></i>Cài đặt</a></li>
        </ul>
    </nav>
    <div class="logout">
        <a href="${pageContext.request.contextPath}/home"><i class="bx bx-log-out"></i>Đăng xuất</a>
    </div>
</aside>
<main class="main-content">
    <header class="header">
        <h2>Tổng quan</h2>
        <div class="search-box">
            <input type="text" placeholder="Tìm kiếm...">
            <button><i class="bx bx-search"></i></button>
        </div>
        <div class="user-info">
            <span class="notification-badge">
                <i class="bx bx-bell"></i>
                <c:if test="${notificationCount > 0}">
                    <span class="badge">${notificationCount}</span>
                </c:if>
            </span>
            <div class="profile-admin">
                <span class="admin-avatar">${adminAvatar}</span>
                <div class="user-details">
                    <span class="user-name">${adminName}</span>
                    <span class="user-role">${adminRole}</span>
                </div>
            </div>
        </div>
    </header>
    <div class="setting-container">
        <form action="${pageContext.request.contextPath}/admin/setting" method="POST">
        <section class="settings-card">
            <h3><i class='bx bx-store-alt'></i> Thông tin cửa hàng</h3>
            <div class="form-grid">
                <div class="form-group">
                    <label>Tên cửa hàng</label>
                    <input type="text"  name="shopName" value="${st.shop_name}">
                </div>
                <div class="form-group">
                    <label>Email liên hệ</label>
                    <input type="email" name="email" value="${st.email}">
                </div>
                <div class="form-group">
                    <label>Số điện thoại</label>
                    <input type="text" name="phone" value="${st.phone}">
                </div>
                <div class="form-group">
                    <label>Website</label>
                    <input type="text" name="website" value="${st.website}">
                </div>
                <div class="form-group full-width">
                    <label>Địa chỉ</label>
                    <textarea name="address" rows="3">${st.address}</textarea>
                </div>
            </div>
            <div class="card-footer">
                <button class="btn-save"><i class='bx bx-save'></i> Lưu thay đổi</button>
            </div>
        </section>
        <section class="settings-card">
            <h3><i class='bx bx-bell'></i> Thông báo</h3>
            <div class="switch-group">
                <div class="switch-item">
                    <div class="info">
                        <strong>Đơn hàng mới</strong>
                        <p>Nhận thông báo khi có đơn hàng mới từ khách hàng</p>
                    </div>
                    <label class="toggle">
                        <input type="checkbox" checked>
                        <span class="slider"></span>
                    </label>
                </div>
                <div class="switch-item">
                    <div class="info">
                        <strong>Sản phẩm sắp hết</strong>
                        <p>Thông báo khi tồn kho sản phẩm dưới mức tối thiểu</p>
                    </div>
                    <label class="toggle">
                        <input type="checkbox" checked>
                        <span class="slider"></span>
                    </label>
                </div>
            </div>
        </section>
        <section class="settings-card">
            <h3><i class='bx bx-palette'></i> Giao diện</h3>
            <div class="appearance-section">
                <label>Màu chủ đạo</label>
                <div class="color-options">
                    <div class="color-circle c1 active"></div>
                    <div class="color-circle c2"></div>
                    <div class="color-circle c3"></div>
                    <div class="color-circle c4"></div>
                </div>
                <div class="form-group" style="margin-top: 20px; max-width: 300px;">
                    <label>Ngôn ngữ</label>
                    <select>
                        <option>Tiếng Việt</option>
                        <option>English</option>
                    </select>
                </div>
            </div>
        </section>
        <section class="settings-card">
            <h3 class="card-title"><i class='bx bx-lock-alt'></i> Bảo mật</h3>
            <div class="form-grid">
                <div class="form-group full-width">
                    <label>Mật khẩu hiện tại</label>
                    <input type="password" name="oldPassword" class="form-input" placeholder="••••••••">
                </div>
                <div class="form-group">
                    <label>Mật khẩu mới</label>
                    <input type="password" name="newPassword" class="form-input" placeholder="••••••••">
                </div>
                <div class="form-group">
                    <label>Xác nhận mật khẩu mới</label>
                    <input type="password" name="confirmPassword" class="form-input" placeholder="••••••••">
                </div>
            </div>
            <div class="button-row">
                <button class="btn-password">Đổi mật khẩu</button>
            </div>
        </section>
    </div>
</main>

<script src="${pageContext.request.contextPath}/trangadmin/Caidat/caidat.js"></script>

</body>
</html>