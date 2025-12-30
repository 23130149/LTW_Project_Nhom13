document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const searchInputs = $$('.search-box input, .search-review-box input');
    const rows = $$('.data-table tbody tr');

    searchInputs.forEach(input => {
        input.addEventListener('input', (e) => {
            const value = e.target.value.toLowerCase();

            searchInputs.forEach(el => el.value = e.target.value);

            rows.forEach(row => {
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(value) ? '' : 'none';
            });
        });
    });

    const bell = $('.notification-badge');
    if (bell) {
        bell.onclick = () => {
            alert("Thông báo kho hàng:\n- Móc khóa lá cờ Việt Nam đã hết hàng!\n- Túi hoa Tulip sắp hết (còn 5).");
        };
    }

    const modal = $('#productModal');
    const addBtn = $('.view-all-btn');
    const closeBtn = $('.close-btn');

    if (addBtn) {
        addBtn.onclick = () => {
            $('#modalTitle').innerText = "Thêm sản phẩm mới";
            $('#productForm').reset();
            modal.style.display = 'block';
        };
    }

    $$('.bx-pencil').forEach(btn => {
        btn.parentElement.onclick = () => {
            const row = btn.closest('tr');
            $('#modalTitle').innerText = "Chỉnh sửa sản phẩm";

            $('#prodName').value = row.cells[1].innerText;
            $('#prodPrice').value = row.cells[2].innerText;
            $('#prodStock').value = row.cells[3].innerText;

            modal.style.display = 'block';
        };
    });

    if (closeBtn) {
        closeBtn.onclick = () => modal.style.display = 'none';
    }

    $$('.bx-trash').forEach(btn => {
        btn.parentElement.onclick = () => {
            const row = btn.closest('tr');
            const productName = row.cells[1].innerText;
            if (confirm(`Bạn có chắc chắn muốn xóa sản phẩm: ${productName}?`)) {
                row.remove();
                showToast("Đã xóa sản phẩm thành công!");
            }
        };
    });

    $('#productForm')?.addEventListener('submit', (e) => {
        e.preventDefault();
        modal.style.display = 'none';
        showToast("Dữ liệu đã được cập nhật!");
    });

    function showToast(message) {
        const container = $('#toast-container');
        const toast = document.createElement('div');
        toast.className = 'toast';
        toast.innerText = message;
        container.appendChild(toast);

        setTimeout(() => {
            toast.remove();
        }, 3000);
    }
});