document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const rows = $$('.data-table tbody tr');

    const searchInputs = $$('.search-box input, .search-review-box input');
    searchInputs.forEach(input => {
        input.addEventListener('input', (e) => {
            const value = e.target.value.toLowerCase().trim();

            searchInputs.forEach(el => el.value = e.target.value);

            rows.forEach(row => {
                const textSearch = row.cells[0].innerText + row.cells[1].innerText + row.cells[2].innerText;
                const isVisible = textSearch.toLowerCase().includes(value);
                row.style.display = isVisible ? '' : 'none';
            });
        });
    });

    const confirmButtons = $$('.btn-confirm');
    confirmButtons.forEach(btn => {
        btn.onclick = (e) => {
            if (!confirm("Bạn có chắc chắn muốn xác nhận đơn hàng này và chuyển sang trạng thái Đã giao?")) {
                e.preventDefault();
            } else {
                showToast("Đang cập nhật trạng thái...");
            }
        };
    });

    const modal = $('#orderDetailModal');
    if (modal) {
        rows.forEach(row => {
            row.addEventListener('click', (e) => {
                if (e.target.closest('.btn-confirm') || e.target.closest('form')) return;

                const maDon = row.cells[0].innerText;
                const khachHang = row.cells[1].innerText;
                const sanPham = row.cells[2].innerText;
                const tongTien = row.cells[3].innerText;
                const ngayDat = row.cells[4].innerText;
                const trangThaiHTML = row.cells[5].innerHTML;

                $('#orderDetailBody').innerHTML = `
                    <div class="order-detail-info">
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                            <p><strong>Mã đơn hàng:</strong> <span style="color: #11998e;">${maDon}</span></p>
                            <p><strong>Ngày đặt:</strong> ${ngayDat}</p>
                            <p><strong>Khách hàng:</strong> ${khachHang}</p>
                            <p><strong>Trạng thái:</strong> ${trangThaiHTML}</p>
                        </div>
                        <div style="margin-top: 20px; padding: 15px; background: #f8f9fa; border-radius: 8px;">
                            <p><strong>Nội dung đơn hàng:</strong></p>
                            <p style="margin-top: 5px;">${sanPham}</p>
                        </div>
                        <div style="margin-top: 15px; text-align: right;">
                            <p style="font-size: 1.2rem;"><strong>Tổng tiền thanh toán:</strong> 
                                <span style="color: #e74c3c; font-weight: bold;">${tongTien}</span>
                            </p>
                        </div>
                    </div>
                `;
                modal.style.display = "flex";
            });
        });

        $('.close-btn').onclick = () => modal.style.display = "none";

        window.onclick = (event) => {
            if (event.target === modal) modal.style.display = "none";
        };
    }

    function showToast(message) {
        const container = $('#toast-container');
        if (!container) return;
        const toast = document.createElement('div');
        toast.className = 'toast-item';
        toast.innerText = message;
        container.appendChild(toast);
        setTimeout(() => toast.remove(), 3000);
    }

    const bell = $('.notification-badge');
    if (bell) {
        bell.onclick = () => {
            const count = bell.querySelector('.badge')?.innerText || "0";
            showToast(`Bạn có ${count} thông báo mới!`);
        };
    }
});