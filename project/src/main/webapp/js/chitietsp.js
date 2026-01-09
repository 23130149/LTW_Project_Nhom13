document.addEventListener("DOMContentLoaded", function () {
    const qtyInput = document.querySelector(".quantity-input");
    const btnUp = document.querySelector(".arrow-up");
    const btnDown = document.querySelector(".arrow-down");

    if (qtyInput && btnUp && btnDown) {
        const min = parseInt(qtyInput.min) || 1;
        const max = parseInt(qtyInput.max) || 999;

        btnUp.addEventListener("click", function (e) {
            e.preventDefault();
            let value = parseInt(qtyInput.value) || min;
            if (value < max) {
                qtyInput.value = value + 1;
            }
        });

        btnDown.addEventListener("click", function (e) {
            e.preventDefault();
            let value = parseInt(qtyInput.value) || min;
            if (value > min) {
                qtyInput.value = value - 1;
            }
        });

        qtyInput.addEventListener("input", function () {
            let value = parseInt(this.value);
            if (isNaN(value) || value < min) this.value = min;
            if (value > max) this.value = max;
        });
    }

    const favBtn = document.getElementById("favoriteBtn");
    const favIcon = document.getElementById("favoriteIcon");

    if (favBtn && favIcon) {
        favBtn.addEventListener("click", function () {
            favIcon.classList.toggle("bx-heart");
            favIcon.classList.toggle("bxs-heart");

            if (favIcon.classList.contains("bxs-heart")) {
                favIcon.style.color = "red";
            } else {
                favIcon.style.color = "";
            }
        });
    }

    const addToCartBtn = document.querySelector(".btn-add-to-cart");

    if (addToCartBtn && qtyInput) {
        addToCartBtn.addEventListener("click", function () {
            const quantity = qtyInput.value;
            alert("🛒 Đã thêm " + quantity + " sản phẩm vào giỏ hàng!");
        });
    }

    const buyNowBtn = document.querySelector(".btn-buy-now");

    if (buyNowBtn && qtyInput) {
        buyNowBtn.addEventListener("click", function () {
            const quantity = qtyInput.value;
            alert("⚡ Mua ngay " + quantity + " sản phẩm!");
        });
    }

});