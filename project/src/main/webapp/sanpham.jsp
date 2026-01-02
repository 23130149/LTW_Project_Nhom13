<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/sanpham.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <meta charset="UTF-8">
    <title>Sản phẩm</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://unsplash.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/trangchu.jsp">Handmade House</a>
            </div>
            <form class="search-form" action="#" method="GET">
                <input type="text" class="search-input" placeholder="Tìm kiếm bất cứ thứ gì..."
                       aria-label="Tìm kiếm sản phẩm">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>
            <div class="icons">
                <a href="${pageContext.request.contextPath}/favourite.jsp" class="icon-btn" id="heartBtn">
                    <i class='bx  bx-heart'></i>
                </a>
                <a href="${pageContext.request.contextPath}/cart.jsp" class="icon-btn" id="cartBtn">
                    <i class='bx  bx-cart'></i>
                </a>
                <a href="${pageContext.request.contextPath}/account.jsp" class="icon-btn" id="userBtn">
                    <i class='bx  bx-user'></i>
                </a>
            </div>
        </div>
    </div>
    <div class="search-bar-section header-bottom-nav">
        <div class="container nav-only-container">
            <nav class="nav__links">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/trangchu.jsp">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<main class="main-content">
    <div class="container">
        <div class="page-meta">
            <h1 class="page-title-main">Sản phẩm</h1>
            <div class="breadcrumb">
                <a href="#">Trang chủ</a>
                <a href="#"><i class="bx bx-chevron-right"></i></a>
                <span>Sản phẩm</span>
            </div>
        </div>
        <div class="product-page-layout">
            <div class="product-listing-area">
                <div class="sort-stats-bar">
                    <div class="product-stats">
                        Hiển thị ${list.size()} sản phẩm
                    </div>
                    <div class="sort-options">
                        <div class="custom-select-wrapper">
                            <select class="sort-options-select">
                                <option value="default">Sắp xếp mặc định</option>
                                <option value="price-asc">Giá tăng dần</option>
                                <option value="price-desc">Giá giảm dần</option>
                            </select>
                            <i class="dropdown-arrow bx bx-chevron-down"></i>
                        </div>
                    </div>
                </div>
                <div class="product-grid">
                    <c:forEach items="${list}" var="p">
                        <div class="product-item">
                            <div class="product-top">
                                <a href="${pageContext.request.contextPath}/chitietsp.jsp?id=${p.product_id}"
                                   class="product-thumb">
                                    <img src="${p.image_url}" alt="${p.product_name}">
                                </a>
                                <div class="add-to-cart-btn"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</div>
                            </div>
                            <div class="product-info">
                                <a href="#" class="product-cat">Mã loại: ${p.category_id}</a>
                                <a href="#" class="product-name">${p.product_name}</a>
                                <div class="product-price">${p.product_price}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="pagination">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="current-page">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/product?page=${i}">
                                        ${i}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a href="${pageContext.request.contextPath}/product?page=${currentPage + 1}">
                            <i class="bx bx-chevron-right"></i>
                        </a>
                    </c:if>
                </div>
            </div>
            <aside class="sidebar-filters">
                <div class="filter-group category-filter">
                    <h4 class="filter-group-title">Danh mục</h4>
                    <ul>
                        <li><a href="#">Móc khóa(25)</a></li>
                        <li><a href="#">Vòng tay(25)</a></li>
                        <li><a href="#">Nến thơm(25)</a></li>
                        <li><a href="#">Túi xách(25)</a></li>
                        <li><a href="#">Ốp lưng(25)</a></li>
                        <li><a href="#">Kẹp tóc(25)</a></li>
                        <li><a href="#">Sổ trang trí(25)</a></li>
                        <li><a href="#">Đồ trang trí nhà(25)</a></li>
                    </ul>
                </div>
            </aside>
        </div>
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
<script src="${pageContext.request.contextPath}/js/sanpham.js"></script>

</body>
</html>
