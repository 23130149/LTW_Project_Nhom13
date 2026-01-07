document.addEventListener("DOMContentLoaded", () => {
    const addToCartButtons = document.querySelectorAll(".add-to-cart-btn");

    addToCartButtons.forEach(button => {
        button.addEventListener("click", () => {
            const productItem = button.closest(".product-item");

            const productName = productItem
                ? productItem.querySelector(".product-name")?.textContent
                : "Sản phẩm";

            const productPrice = productItem
                ? productItem.querySelector(".product-price")?.textContent
                : "";

            alert(`Đã thêm "${productName}" vào giỏ hàng`);
            console.log("ADD TO CART:", productName, productPrice);

        });
    });
    const searchForm = document.querySelector(".search-form");
    const searchInput = document.querySelector(".search-input");

    if (searchForm) {
        searchForm.addEventListener("submit", (e) => {
            const keyword = searchInput.value.trim();

            if (keyword === "") {
                e.preventDefault();
                alert("Vui lòng nhập nội dung tìm kiếm");
            } else {
                console.log("SEARCH:", keyword);
            }
        });
    }

    const navLinks = document.querySelectorAll(".nav__links a");

    navLinks.forEach(link => {
        link.addEventListener("click", () => {
            console.log("NAV CLICK:", link.textContent.trim());
        });
    });
    const categoryItems = document.querySelectorAll(".category-item");

    categoryItems.forEach(item => {
        item.addEventListener("click", () => {
            const categoryName = item.querySelector("h4")?.textContent;
            console.log("CATEGORY:", categoryName);
        });
    });
    const productThumbs = document.querySelectorAll(".product-thumb");

    productThumbs.forEach(thumb => {
        thumb.addEventListener("click", (e) => {
            e.preventDefault();

            const productItem = thumb.closest(".product-item");
            const productName = productItem
                ?.querySelector(".product-name")?.textContent;

            console.log("VIEW DETAIL:", productName);
        });
    });

    const heartBtn = document.getElementById("heartBtn");
    const cartBtn = document.getElementById("cartBtn");
    const userBtn = document.getElementById("userBtn");

    heartBtn?.addEventListener("click", () => {
        console.log("OPEN FAVORITE");
    });

    cartBtn?.addEventListener("click", () => {
        console.log("OPEN CART");
    });

    userBtn?.addEventListener("click", () => {
        console.log("OPEN ACCOUNT");
    });

});
