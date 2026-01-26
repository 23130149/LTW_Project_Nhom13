document.addEventListener("DOMContentLoaded", function () {
    const modal = document.getElementById("productModal");
    const productForm = document.getElementById("productForm");

    const prodIdInput = document.getElementById("prodId");
    const prodNameInput = document.getElementById("prodName");
    const prodPriceInput = document.getElementById("prodPrice");
    const prodStockInput = document.getElementById("prodStock");
    const prodCategoryInput = document.getElementById("prodCategory");
    const prodDescriptionInput = document.getElementById("prodDescription");
    const actionInput = document.getElementById("modalAction");

    const imageInput = document.getElementById("imageInput");
    const imgPreview = document.getElementById("imgPreview");
    const placeholderIcon = document.getElementById("placeholderIcon");

    window.openEditModal = function (btn) {
        modal.querySelector(".modal-header h3").innerText = "Chỉnh sửa sản phẩm";
        actionInput.value = "update";

        const id = btn.getAttribute("data-id");
        const name = btn.getAttribute("data-name");
        const price = btn.getAttribute("data-price");
        const stock = btn.getAttribute("data-stock");
        const catId = btn.getAttribute("data-category");
        const desc = btn.getAttribute("data-description");
        const img = btn.getAttribute("data-image");

        prodIdInput.value = id;
        prodNameInput.value = name;
        prodPriceInput.value = price;
        prodStockInput.value = stock;
        prodCategoryInput.value = catId;
        prodDescriptionInput.value = (desc && desc !== 'null') ? desc : "";

        if (img && img !== 'null' && img !== '') {
            const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
            imgPreview.src = img.startsWith('http') ? img : contextPath + "/images/" + img;
            imgPreview.style.display = "block";
            placeholderIcon.style.display = "none";
        } else {
            resetImagePreview();
        }

        modal.style.display = "block";
    };

    const addBtn = document.querySelector(".view-all-btn");
    if (addBtn) {
        addBtn.addEventListener("click", () => {
            modal.querySelector(".modal-header h3").innerText = "Thêm sản phẩm mới";
            actionInput.value = "add";
            productForm.reset();
            prodIdInput.value = "";
            resetImagePreview();
            modal.style.display = "block";
        });
    }

    if (imageInput) {
        imageInput.addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    imgPreview.src = e.target.result;
                    imgPreview.style.display = "block";
                    placeholderIcon.style.display = "none";
                };
                reader.readAsDataURL(file);
            }
        });
    }

    document.querySelectorAll(".close-btn, .btn-cancel").forEach(btn => {
        btn.onclick = () => {
            modal.style.display = "none";
        };
    });

    window.onclick = (event) => {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };

    function resetImagePreview() {
        imgPreview.src = "";
        imgPreview.style.display = "none";
        placeholderIcon.style.display = "block";
    }
});