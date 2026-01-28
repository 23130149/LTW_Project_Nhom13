document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const modal = $('#productModal');
    const imageInput = $('#imageInput');
    const imgPreview = $('#imgPreview');
    const placeholderIcon = $('#placeholderIcon');
    const productForm = $('#productForm');

    window.openAddModal = function() {
        productForm.reset();
        $('#modalAction').value = "add";
        $('#prodId').value = "";
        $('.modal-header h3').innerText = "Thêm sản phẩm mới";

        imgPreview.src = "";
        imgPreview.style.display = "none";
        placeholderIcon.style.display = "block";

        modal.style.display = "flex";
    };

    window.openEditModal = function(btn) {
        $('#modalAction').value = "edit";
        $('.modal-header h3').innerText = "Chỉnh sửa sản phẩm";

        $('#prodId').value = btn.dataset.id || "";
        $('#prodName').value = btn.dataset.name || "";
        $('#prodPrice').value = btn.dataset.price || "";
        $('#prodStock').value = btn.dataset.stock || "";
        $('#prodCategory').value = btn.dataset.category || "1";
        $('#prodDescription').value = btn.dataset.description || "";

        const imgUrl = btn.dataset.image;
        if (imgUrl && imgUrl !== 'null' && imgUrl !== '') {
            imgPreview.src = imgUrl.startsWith('http') ? imgUrl : `${window.location.origin}${window.location.pathname.substring(0, window.location.pathname.indexOf('/', 1))}/images/${imgUrl}`;
            imgPreview.style.display = "block";
            placeholderIcon.style.display = "none";
        } else {
            imgPreview.style.display = "none";
            placeholderIcon.style.display = "block";
        }

        modal.style.display = "flex";
    };

    window.closeModal = function() {
        modal.style.display = "none";
    };

    window.onclick = (e) => {
        if (e.target === modal) closeModal();
    };

    if (imageInput) {
        imageInput.onchange = function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imgPreview.src = e.target.result;
                    imgPreview.style.display = "block";
                    placeholderIcon.style.display = "none";
                }
                reader.readAsDataURL(file);
            }
        };
    }

    const searchInp = $('.search-review-box input');
    if (searchInp) {
        searchInp.oninput = (e) => {
            const val = e.target.value.toLowerCase();
            $$('.data-table tbody tr').forEach(row => {
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(val) ? "" : "none";
            });
        };
    }
});