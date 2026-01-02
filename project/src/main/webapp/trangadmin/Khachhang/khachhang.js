document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const detailModal = $('#customerModal');
    const addModal = $('#addCustomerModal');
    const detailBody = $('#customerDetailBody');

    function attachViewEvents() {
        $$('.action-icon').forEach(icon => {
            icon.onclick = function () {
                const row = this.closest('tr');

                const name = row.cells[0].innerText.trim();
                const contact = row.cells[1].innerText;
                const orders = row.cells[2].innerText;
                const spend = row.cells[3].innerText;
                const date = row.cells[4].innerText;
                const typeHTML = row.cells[5].innerHTML;

                detailBody.innerHTML = `
                    <div style="line-height: 2.2; font-size: 15px;">
                        <p><b>Khách hàng:</b> ${name}</p>
                        <p><b>Số điện thoại:</b> ${contact}</p>
                        <p><b>Số đơn hàng:</b> ${orders}</p>
                        <p><b>Tổng chi tiêu:</b> <span style="color: #e74c3c; font-weight: bold;">${spend}</span></p>
                        <p><b>Ngày tham gia:</b> ${date}</p>
                        <p style="display: flex; align-items: center; gap: 10px;">
                            <b>Hạng:</b> ${typeHTML}
                        </p>
                    </div>
                `;

                detailModal.style.display = 'block';
            };
        });
    }

    attachViewEvents();

    const addBtn = $('.add-customer-btn');
    if (addBtn) {
        addBtn.onclick = () => {
            addModal.style.display = 'block';
        };
    }

    $$('.close-modal, .close-add-modal').forEach(btn => {
        btn.onclick = () => {
            detailModal.style.display = 'none';
            addModal.style.display = 'none';
        };
    });

    window.onclick = (e) => {
        if (e.target == detailModal) detailModal.style.display = 'none';
        if (e.target == addModal) addModal.style.display = 'none';
    };

    const addForm = $('#addCustomerForm');
    if (addForm) {
        addForm.onsubmit = (e) => {
            e.preventDefault();
            alert("Hệ thống: Đã ghi nhận thông tin khách hàng mới!");
            addModal.style.display = 'none';
            addForm.reset();
        };
    }

    const mainSearch = $('.search-customer-box input');
    if (mainSearch) {
        mainSearch.oninput = function () {
            const val = this.value.toLowerCase();
            $$('.data-table tbody tr').forEach(row => {
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(val) ? '' : 'none';
            });
        };
    }
    const bell = $('.notification-badge');
    if (bell) {
        bell.onclick = () => {
            alert(
                "🔔 THÔNG BÁO HỆ THỐNG:\n" +
                "----------------------------------\n" +
                "- Khách hàng mới: 5 người đăng ký hôm nay.\n" +
                "- VIP: Nguyễn Thanh Phú vừa thăng hạng.\n" +
                "- Đơn hàng: Có 2 đơn hàng đang chờ xử lý.\n" +
                "----------------------------------"
            );
        };
    }
});