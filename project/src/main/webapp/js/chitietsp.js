document.addEventListener("DOMContentLoaded", function () {
    const qtyInput = document.querySelector(".quantity-input");
    const btnUp = document.querySelector(".arrow-up");
    const btnDown = document.querySelector(".arrow-down");

    const addToCartBtn = document.querySelector(".btn-add-to-cart");
    const buyNowBtn = document.querySelector(".btn-buy-now");

    if (!qtyInput || !btnUp || !btnDown) return;

    const min = parseInt(qtyInput.min) || 1;
    const max = parseInt(qtyInput.max) || 999;

    function updateLinks() {
        const q = qtyInput.value;

        if (addToCartBtn) {
            const url = new URL(addToCartBtn.href, window.location.origin);
            url.searchParams.set("q", q);
            addToCartBtn.href = url.toString();
        }

        if (buyNowBtn) {
            const url = new URL(buyNowBtn.href, window.location.origin);
            url.searchParams.set("q", q);
            buyNowBtn.href = url.toString();
        }
    }

    btnUp.addEventListener("click", function () {
        let value = parseInt(qtyInput.value) || min;
        if (value < max) {
            qtyInput.value = value + 1;
            updateLinks();
        }
    });

    btnDown.addEventListener("click", function () {
        let value = parseInt(qtyInput.value) || min;
        if (value > min) {
            qtyInput.value = value - 1;
            updateLinks();
        }
    });

    qtyInput.addEventListener("input", function () {
        let value = parseInt(this.value);
        if (isNaN(value) || value < min) value = min;
        if (value > max) value = max;
        this.value = value;
        updateLinks();
    });

    const stars = document.querySelectorAll(".star-rating i");
    const ratingInput = document.getElementById("ratingValue");

    stars.forEach(star => {
        star.addEventListener("click", () => {
            const value = star.dataset.value;
            ratingInput.value = value;

            stars.forEach(s => {
                s.classList.toggle("active", s.dataset.value <= value);
                s.classList.toggle("bxs-star", s.dataset.value <= value);
                s.classList.toggle("bx-star", s.dataset.value > value);
            });
        });
    });

    const toast = document.querySelector(".cart-toast");
    if (toast) {
        setTimeout(() => toast.remove(), 3000);
    }
});