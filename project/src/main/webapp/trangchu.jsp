<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/trangchu.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <meta charset="UTF-8">
    <title>Handmade Shop</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://unsplash.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home">Handmade House</a>
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
                    <li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
                    <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<section class="section__container" id="home">
    <div class="wavy-top"></div>
    <div class="slider-wrapper">
        <div class="slide slide-active"
             style="background-image: url('https://plus.unsplash.com/premium_photo-1661753115934-cdf47487b294?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=871');">
            <div class="slide-overlay"></div>
            <div class="slide-content">
                <h1 class="section-title">
                    <span class="section-title-line">The Beauty</span>
                    <span class="section-title-line">Of Handmade</span>
                </h1>
                <p class="section-subtitle">
                    Chào mừng bạn đến với Handmade House, một chủ đề đầy cảm hứng được tạo ra riêng cho hành trình sáng
                    tạo của bạn!<br>
                    Dù là dự án thủ công hay sản phẩm nghệ thuật, Handmade House đều có mọi thứ bạn cần.
                </p>
                <a href="${pageContext.request.contextPath}/product" class="btn-view-more">Xem thêm</a>
            </div>
        </div>
        <div class="slide"
             style="background-image: url('https://bepos.io/wp-content/uploads/2021/08/lam-do-handmade-tai-nha-220.jpg')">
            <div class="slide-overlay"></div>
            <div class="slide-content">
                <h1 class="section-title">
                    <span class="section-title-line">HANDMADE GOODS</span>
                    <span class="section-title-line">FOR GENZ</span>
                </h1>
                <p class="section-subtitle">
                    Tự tin thể hiện gu thẩm mỹ và sự độc đáo qua từng sản phẩm thủ công, dẫn đầu xu hướng.
                </p>
                <a href="${pageContext.request.contextPath}/product" class="btn-view-more">Xem thêm</a>
            </div>
        </div>
        <div class="slide"
             style="background-image: url('https://t4.ftcdn.net/jpg/03/97/34/39/360_F_397343924_6WlXOaMVHNKkhMs2l8AHJ5e9MQ03YiBU.jpg');">
            <div class="slide-overlay"></div>
            <div class="slide-content">
                <h1 class="section-title">
                    <span class="section-title-line">ELEVATE YOUR SPACE</span>
                    <span class="section-title-line">AND PERSONALITY</span>
                </h1>
                <p class="section-subtitle">
                    Mang đến những sản phẩm thủ công chất lượng, kết hợp hoàn hảo giữa nghệ thuật và công năng.
                </p>
                <a href="${pageContext.request.contextPath}/product" class="btn-view-more">Xem thêm</a>
            </div>
        </div>
    </div>
</section>
<section class="categories">
                        <div class="container">
                            <div class="heading">
                                <h3>Danh mục sản phẩm</h3>
                                <p>Khám phá bộ sưu tập sản phẩm của chúng tôi</p>
                            </div>
                            <div class="category-list">
                                <c:forEach items="${categoryList}" var="cat">
                                    <div class="category-item">
                                        <img src="${cat.image_url}" alt="${cat.name}">
                                        <div class="category-overlay">
                                            <h4>${cat.name}</h4>
                                            <span>25 sản phẩm</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </section>
                        <section class="products-section">
                            <div class="container">
                                <div class="heading">
                                    <h3>Sản phẩm nổi bật</h3>
                                    <p>Chiêm ngưỡng những gợi ý hàng đầu của chúng tôi</p>
                                </div>
                                <div class="product-grid">
                                    <c:forEach items="${productList}" var="p" begin="0" end="7">
                                        <div class="product-item">
                                            <div class="product-top">
                                                <a href="${pageContext.request.contextPath}/chitietsp.jsp?id=${p.product_id}"  class="product-thumb">
                                                    <img src="${p.image_url}" alt="${p.product_name}">
                                                </a>
                        <div class="add-to-cart-btn"><a href="add-Cart?id=${p.product_id}&q=1"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</a></div>
                    </div>
                    <div class="product-info">
                        <a href="#" class="product-cat">Mã loại: ${p.category_id}</a>
                        <a href="#" class="product-name">${p.product_name}</a>
                        <div class="product-price">${p.product_price}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<section class="story-section">
    <div class="container">
        <div class="story-header">
            <h2 class="story-heading-main">Về chúng tôi</h2>
            <p class="story-subtitle">Câu chuyện của chúng tôi bắt đầu từ niềm đam mê thủ công</p>
        </div>
        <div class="story-content">
            <div class="story-text-container">
                <h3 class="story-title">Thủ công cho Gen Z</h3>
                <p>Handmade House chính thức ra đời năm 2025 với mục tiêu duy nhất là biến nghệ thuật thủ công truyền
                    thống thành những món đồ mới mẻ, độc đáo, thể hiện cá tính riêng của giới trẻ hiện nay. Chúng tôi
                    tin rằng phong cách không nên là hàng loạt, mà phải là duy nhất.</p>
                <p>Chúng tôi hoạt động như một studio sáng tạo, nơi đội ngũ thiết kế trẻ tuổi làm việc trực tiếp với hơn
                    3 nghệ nhân để liên tục cập nhật các xu hướng TikTok, Instagram, và Facebook mới nhất. Sự kết hợp
                    giữa kỹ thuật thủ công lâu đời và thẩm mỹ hiện đại tạo ra những sản phẩm vừa chất lượng, vừa
                    "viral".</p>
                <p>Tại Handmade House, bạn không chỉ mua một phụ kiện; bạn đang mua một món đồ thể hiện cá tính. Từ móc
                    khóa cá nhân hóa, túi xách đan lát theo mùa, đến nến thơm được custom (tùy chỉnh) mùi hương độc
                    quyền – mỗi món đồ đều phản ánh sự tự do và sáng tạo của người sở hữu.</p>
                <p>Hãy cùng chúng tôi phá vỡ ranh giới giữa truyền thống và hiện đại. Ủng hộ Handmade House là cách bạn
                    tham gia vào cộng đồng yêu thích sự độc đáo, trân trọng giá trị bền vững, và luôn dẫn đầu các xu
                    hướng phong cách.</p>
            </div>
            <div class="story-image-container">
                <img src="https://i.pinimg.com/736x/25/26/13/2526135b0ee31195600ccfa88e2ed474.jpg"
                     alt="Nhân viên đang làm việc" class="story-image-main">
            </div>
        </div>
    </div>
</section>
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
<script src="${pageContext.request.contextPath}/js/trangchu.js"></script>
</body>
</html>