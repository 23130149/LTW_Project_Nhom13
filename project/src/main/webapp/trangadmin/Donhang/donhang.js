document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const tabs = $$('.tab-btn');
    const rows = $$('.data-table tbody tr');

    tabs.forEach((tab) => {
        tab.onclick = () => {
            $('.tab-btn.active')?.classList.remove('active');
            tab.classList.add('active');

            const filterText = tab.innerText.split(' ')[0].toLowerCase().trim();

            rows.forEach((row) => {
                const statusCell = row.querySelector('.status');
                if (!statusCell) return;

                const statusText = statusCell.innerText.toLowerCase();

                if (filterText === 'tất' || statusText.includes(filterText)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        };
    });


    const searchInputs = $$('.search-box input, .search-review-box input');
    searchInputs.forEach(input => {
        input.addEventListener('input', (e) => {
            const value = e.target.value.toLowerCase();
            searchInputs.forEach(el => el.value = e.target.value);
            rows.forEach(row => {
                const isVisible = row.innerText.toLowerCase().includes(value);
                row.style.display = isVisible ? '' : 'none';
            });
        });
    });

    const modal = $('#orderDetailModal');
    if (modal) {
        $$('.action-icon').forEach(icon => {
            icon.onclick = () => {
                const row = icon.closest('tr');
                const maDon = row.cells[0].innerText;
                const khachHang = row.cells[1].innerText;
                const sanPham = row.cells[2].innerText;
                const tongTien = row.cells[3].innerText;
                const ngayDat = row.cells[4].innerText;
                const thanhToan = row.cells[5].innerText;
                const trangThaiHTML = row.cells[6].innerHTML;

                $('#orderDetailBody').innerHTML = `
                    <div class="order-info-grid">
                        <p><strong>Mã đơn hàng:</strong> ${maDon}</p>
                        <p><strong>Khách hàng:</strong> ${khachHang}</p>
                        <p><strong>Nội dung:</strong> ${sanPham}</p>
                        <p><strong>Tổng tiền:</strong> <span style="color: #e74c3c; font-weight: bold;">${tongTien}</span></p>
                        <p><strong>Ngày đặt:</strong> ${ngayDat}</p>
                        <p><strong>Thanh toán:</strong> ${thanhToan}</p>
                        <p><strong>Trạng thái:</strong> ${trangThaiHTML}</p>
                    </div>
                `;
                modal.style.display = "block";
            };
        });

        $('.close-btn').onclick = () => {
            modal.style.display = "none";
        };

        window.onclick = (event) => {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };
    }

    $('.view-all-btn')?.addEventListener('click', () => {
        window.print();
    });
    const bell = $('.notification-badge');
    if (bell) {
        bell.onclick = () => {
            alert(
                "🔔 THÔNG BÁO ĐƠN HÀNG MỚI:\n" +
                "----------------------------------\n" +
                "- Đơn hàng #DH001: Nguyễn Thanh Phú đã giao thành công.\n" +
                "- Đơn hàng #DH003: Trần Hoàng Quân đang chờ bạn xác nhận.\n" +
                "- Đơn hàng #DH005: Nguyễn Huy Bảo đã bị hủy hệ thống.\n" +
                "----------------------------------\n" +
                "Vui lòng kiểm tra lại danh sách đơn hàng!"
            );
        };
    }
});