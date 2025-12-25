
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/chitietsp.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/Header_Footer/Styles.css">
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
<header class="header">
    <div class="header-top-container">
        <div class="header-content">
            <div class="logo">
                <a href="../html/trangchu.html">Handmade House</a>
            </div>
            <form class="search-form" action="#" method="GET">
                <input type="text" class="search-input" placeholder="Tìm kiếm bất cứ thứ gì..." aria-label="Tìm kiếm sản phẩm">
                <button type="submit" class="search-btn">
                    <i class="bx bx-search-alt-2"></i>
                </button>
            </form>
            <div class="icons" >
                <a href="../html/favourite.html" class="icon-btn" id="heartBtn">
                    <i class='bx  bx-heart'></i>
                </a>
                <a  href="../html/cart.html" class="icon-btn" id="cartBtn">
                    <i class='bx  bx-cart'></i>
                </a>
                <a href="../html/account.html" class="icon-btn" id="userBtn">
                    <i class='bx  bx-user'></i>
                </a>
            </div>
        </div>
    </div>
    <div class="search-bar-section header-bottom-nav">
        <div class="container nav-only-container">
            <nav class="nav__links" >
                <ul>
                    <li><a href="../html/trangchu.html">Trang chủ</a></li>
                    <li><a href="../html/sanpham.html">Sản phẩm</a></li>
                    <li><a href="../html/blog.html">Blog</a></li>
                    <li><a href="../html/contact.html">Liên hệ</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="page-title">
    <div class="page-title-container">
        <h2 class="page-main-title">Chi tiết sản phẩm</h2>
        <div class="breadcrumb">
            <a href="#">Trang chủ</a>
            <a href="#"><i class="bx bx-chevron-right"></i></a>
            <span>Chi tiết sản phẩm</span>
            <a href="#"><i class="bx bx-chevron-right"></i></a>
            <span>Móc khóa</span>
            <a href="#"><i class="bx bx-chevron-right"></i></a>
            <span>Móc khóa lá cờ Việt Nam</span>
        </div>
    </div>
</div>
<main class="product-detail-page">
    <div class="container">
        <div class="product-detail-content">
            <div class="product-image">
                <div class="main-image">
                    <img src="https://i.pinimg.com/736x/9c/0f/da/9c0fda2d42833544fba28360869fd5e8.jpg" alt="Móc khóa lá cờ Việt Nam">
                </div>
            </div>
            <div class="product-info">
                <h1 class="product-title">Móc khóa lá cờ Việt Nam</h1>
                <div class="product-rating">
                    <div class="stars">
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                        <i class="bx bxs-star"></i>
                    </div>
                    <span class="rating-text">5.0 (86 đánh giá)</span>
                </div>
                <p class="price">15.000đ</p>
                <div class="product-des">
                    <h2>Mô tả sản phẩm</h2>
                    <p> Tất cả đều làm thủ công 100%, để mang trải nghiệm tốt nhất cho khách hàng</p>
                </div>
                <div class="purchase-box">
                    <div class="quantity-input-box">
                        <input type="number" class="quantity-input" value="1" min="1">
                        <div class="quantity-arrows">
                            <button class="arrow-up"><i class="bx bx-chevron-up"></i></button>
                            <button class="arrow-down"><i class="bx bx-chevron-down"></i></button>
                        </div>
                    </div>
                    <div class="action-buttons">
                        <button class="btn btn-add-to-cart">
                            <i class="bx bx-cart"></i> Thêm vào giỏ hàng
                        </button>
                        <div class="extra-action">
                            <button class="btn btn-icon-action" aria-label="Yêu thích">
                                <i class="bx bx-heart"></i>
                            </button>
                        </div>
                    </div>
                    <button type="button" class="btn btn-buy-now">Mua ngay</button>
                </div>
                <div class="product-meta">
                    <p><strong>Danh mục: </strong><a href="#">Móc khóa</a></p>
                    <div class="share-links">
                        <strong>Chia sẻ:</strong>
                        <a href="#"><i class="bx bxl-facebook"></i></a>
                        <a href="#"><i class="bx bxl-instagram"></i></a>
                        <a href="#"><i class="bx bxl-tiktok"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="rating-section">
            <h2>Đánh giá sản phẩm</h2>
            <div class="rating-sumary">
                <p class="rating-number">5.0/5</p>
                <div class="stars">
                    <i class="bx bxs-star"></i>
                    <i class="bx bxs-star"></i>
                    <i class="bx bxs-star"></i>
                    <i class="bx bxs-star"></i>
                    <i class="bx bxs-star"></i>
                </div>
                <p class="rating-count">86 đánh giá</p>
            </div>
            <div class="rating-breakdown">
                <div class="rating-bar-now">
                    <span>5<i class="bx bxs-star"></i></span>
                    <div class="rating-bar"><div class="rating-fill" style="width: 95%"></div></div>
                    <span>82</span>
                </div>
                <div class="rating-bar-now">
                    <span>4<i class="bx bxs-star"></i></span>
                    <div class="rating-bar"><div class="rating-fill" style="width: 4%"></div></div>
                    <span>3</span>
                </div>
                <div class="rating-bar-now">
                    <span>3<i class="bx bxs-star"></i></span>
                    <div class="rating-bar"><div class="rating-fill" style="width: 1%"></div></div>
                    <span>1</span>
                </div>
                <div class="rating-bar-now">
                    <span>2<i class="bx bxs-star"></i></span>
                    <div class="rating-bar"><div class="rating-fill" style="width: 0%"></div></div>
                    <span>0</span>
                </div>
                <div class="rating-bar-now">
                    <span>1<i class="bx bxs-star"></i></span>
                    <div class="rating-bar"><div class="rating-fill" style="width: 0%"></div></div>
                    <span>0</span>
                </div>
            </div>
        </div>
        <div class="review-list">
            <h3>Bình luận từ khách hàng (3)</h3>
            <div class="review-item">
                <div class="review-header">
                    <span class="user-avatar">P</span>
                    <div class="user-info">
                        <p class="user-name">Nguyễn Thanh Phú</p>
                        <div class="review-rating">
                            <div class="small-stars">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                            </div>
                            <span class="review-date">28/12/2024</span>
                        </div>
                    </div>
                </div>
                <p class="review-text">Sản phẩm rất đẹp không có chỗ nào chê.</p>
                <div class="review-actions">
                    <i class="bx bxs-hand-up"></i>
                    <span>Hữu ích (60)</span>
                </div>
            </div>
            <div class="review-item">
                <div class="review-header">
                    <span class="user-avatar">K</span>
                    <div class="user-info">
                        <p class="user-name">Lê Viết Khanh</p>
                        <div class="review-rating">
                            <div class="small-stars">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                            </div>
                            <span class="review-date">17/10/2024</span>
                        </div>
                    </div>
                </div>
                <p class="review-text">Móc khóa dễ thương, chắc chắn lần sau tui sẽ mua tiếp.</p>
                <div class="review-actions">
                    <i class="bx bxs-hand-up"></i>
                    <span>Hữu ích (30)</span>
                </div>
            </div>
            <div class="review-item">
                <div class="review-header">
                    <span class="user-avatar">Q</span>
                    <div class="user-info">
                        <p class="user-name">Trần Hoàng Quân</p>
                        <div class="review-rating">
                            <div class="small-stars">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                            </div>
                            <span class="review-date">25/11/2024</span>
                        </div>
                    </div>
                </div>
                <p class="review-text">Sản phẩm rất đẹp, giá thành hợp lí.</p>
                <div class="review-actions">
                    <i class="bx bxs-hand-up"></i>
                    <span>Hữu ích (10)</span>
                </div>
            </div>
        </div>
        <section class="related-products">
            <h2 id="related-title">Sản phẩm liên quan</h2>
            <div class="product-grid">
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://i.pinimg.com/1200x/70/eb/79/70eb79391ab8889595d75d499251bd40.jpg" alt="Tên sản phẩm">
                        </a>
                        <div class="add-to-cart-btn"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</div>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Móc khóa</a>
                        <a href="" class="product-name">Móc khóa ngỗng lắc lư</a>
                        <div class="product-price">20.000đ</div>
                    </div>
                </div>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://i.pinimg.com/1200x/79/1a/eb/791aeb8e4aaad4275d8666640f321c06.jpg" alt="Tên sản phẩm">
                        </a>
                        <div class="add-to-cart-btn"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</div>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Móc khóa</a>
                        <a href="" class="product-name">Móc khóa gấu màu trắng</a>
                        <div class="product-price">13.000đ</div>
                    </div>
                </div>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://i.pinimg.com/736x/11/c6/89/11c689c0dfbf5e3da855f2617adca591.jpg" alt="Tên sản phẩm">
                        </a>
                        <div class="add-to-cart-btn"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</div>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Móc khóa</a>
                        <a href="" class="product-name">Móc khóa phi hành gia</a>
                        <div class="product-price">18.000đ</div>
                    </div>
                </div>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://i.pinimg.com/736x/b4/b0/2c/b4b02cd646ce34a6c91722c741adec4f.jpg" alt="Tên sản phẩm">
                        </a>
                        <div class="add-to-cart-btn"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</div>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Móc khóa</a>
                        <a href="" class="product-name">Móc khóa gấu trúc</a>
                        <div class="product-price">25.000đ</div>
                    </div>
                </div>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="https://i.pinimg.com/736x/46/b9/f9/46b9f9d1dfc6af1dd5f23334ff9fec76.jpg" alt="Tên sản phẩm">
                        </a>
                        <div class="add-to-cart-btn"><i class="bx bx-shopping-bag"></i>Thêm vào giỏ</div>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Móc khóa</a>
                        <a href="" class="product-name">Móc khóa răng sún</a>
                        <div class="product-price">30.000đ</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-column">
                <h3 class="footer-logo">Handmade House</h3>
                <p class="footer-desc">Chào mừng đến với Handmade House, ngôi nhà nhỏ của những tâm hồn yêu nghệ thuật và thủ công.</p>
                <div class="social-links">
                    <a href="#"><i class="bx bxl-facebook"></i></a>
                    <a href="#"><i class="bx bxl-instagram"></i></a>
                    <a href="#"><i class="bx bxl-tiktok"></i></a>
                </div>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Blog</h3>
                <ul class="footer-links">
                    <li> <a href="#">Câu chuyện thương hiệu</a></li>
                    <li> <a href="#"> Giá trị & Triết lý thương hiệu</a></li>
                    <li> <a href="#">Quy trình sản xuất</a></li>
                    <li> <a href="#">Cam kết & Định hướng bền vững</a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h3 class="footer-title">Hỗ trợ</h3>
                <ul class="footer-links">
                    <li> <a href="#">Chính sách đổi trả</a></li>
                    <li> <a href="#">Hướng dẫn đặt hàng</a></li>
                    <li> <a href="#">Phương thức thanh toán</a></li>
                    <li> <a href="#">Câu hỏi thường gặp</a></li>
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
</body>
</html>
