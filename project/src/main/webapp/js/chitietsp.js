document.addEventListener("DOMContentLoaded", function () {

    const mainImage = document.getElementById("mainImage");
    const thumbnails = document.querySelectorAll(".thumbnail-item");

    thumbnails.forEach(thumbnail => {
        thumbnail.addEventListener("click", function () {

            const newSrc = this.getAttribute("data-src") || this.src;
            mainImage.src = newSrc;

            thumbnails.forEach(t => t.classList.remove("active"));

            this.classList.add("active");
        });
    });

    const quantityInput = document.querySelector(".quantity-input");
    const btnUp = document.querySelector(".arrow-up");
    const btnDown = document.querySelector(".arrow-down");

    if (quantityInput && btnUp && btnDown) {

        btnUp.addEventListener("click", function () {
            let value = parseInt(quantityInput.value) || 1;
            const max = parseInt(quantityInput.max) || 999;

            if (value < max) {
                quantityInput.value = value + 1;
            }
        });

        btnDown.addEventListener("click", function () {
            let value = parseInt(quantityInput.value) || 1;
            const min = parseInt(quantityInput.min) || 1;

            if (value > min) {
                quantityInput.value = value - 1;
            }
        });
    }

    const stars = document.querySelectorAll(".star-rating i");
    const ratingInput = document.getElementById("ratingValue");

    stars.forEach(star => {
        star.addEventListener("click", function () {
            const rating = this.getAttribute("data-value");
            ratingInput.value = rating;

            stars.forEach(s => {
                s.classList.remove("bxs-star");
                s.classList.add("bx-star");
            });

            for (let i = 0; i < rating; i++) {
                stars[i].classList.remove("bx-star");
                stars[i].classList.add("bxs-star");
            }
        });
    });

});
