document.addEventListener("DOMContentLoaded", function () {

    const modal = document.getElementById("productModal");
    const form = document.getElementById("productForm");

    const modalAction = document.getElementById("modalAction");

    const prodId = document.getElementById("prodId");
    const prodName = document.getElementById("prodName");
    const prodPrice = document.getElementById("prodPrice");
    const prodStock = document.getElementById("prodStock");
    const prodCategory = document.getElementById("prodCategory");
    const prodDescription = document.getElementById("prodDescription");

    const imgPreview = document.getElementById("imgPreview");
    const imageInput = document.getElementById("imageInput");

    const closeBtns = document.querySelectorAll(".close-btn");

    // ================= ADD =================
    window.openAddModal = function () {
        form.reset();
        modalAction.value = "add";   // 🔴 QUAN TRỌNG
        prodId.value = "";           // 🔴 KHÔNG CÓ productId khi add

        imgPreview.style.display = "none";
        imgPreview.src = "";

        modal.style.display = "block";
    };

    // ================= EDIT =================
    window.openEditModal = function (btn) {
        modal.style.display = "block";
        modalAction.value = "update"; // 🔴 QUAN TRỌNG

        prodId.value = btn.dataset.id;
        prodName.value = btn.dataset.name;
        prodPrice.value = btn.dataset.price;
        prodStock.value = btn.dataset.stock;
        prodCategory.value = btn.dataset.category;
        prodDescription.value = btn.dataset.description || "";

        if (btn.dataset.image) {
            imgPreview.src = btn.dataset.image;
            imgPreview.style.display = "block";
        }
    };

    // ================= CLOSE =================
    closeBtns.forEach(btn => {
        btn.addEventListener("click", () => {
            modal.style.display = "none";
        });
    });

    window.addEventListener("click", e => {
        if (e.target === modal) modal.style.display = "none";
    });

    // ================= PREVIEW IMAGE =================
    imageInput.addEventListener("change", () => {
        const file = imageInput.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = e => {
            imgPreview.src = e.target.result;
            imgPreview.style.display = "block";
        };
        reader.readAsDataURL(file);
    });

});
