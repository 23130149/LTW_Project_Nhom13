document.addEventListener('DOMContentLoaded', () => {

    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    /* ======================
       SIDEBAR ACTIVE
       ====================== */
    const navItems = $$('.slidebar-nav ul li');
    navItems.forEach(item => {
        item.addEventListener('click', function () {
            navItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });

    /* ======================
       SEARCH CUSTOMER
       ====================== */
    const searchInput = $('.search-customer-box input');
    if (searchInput) {
        searchInput.addEventListener('input', function () {
            const keyword = this.value.toLowerCase().trim();
            $$('#customerTable tr').forEach(row => {
                const name = row.querySelector('.name')?.innerText.toLowerCase() || '';
                row.style.display = name.includes(keyword) ? '' : 'none';
            });
        });
    }

    /* ======================
       VIEW CUSTOMER MODAL
       ====================== */
    const detailModal = $('#customerModal');
    const detailBody = $('#customerDetailBody');
    const closeModal = $('.close-modal');

    document.addEventListener('click', (e) => {
        const viewBtn = e.target.closest('.view-btn');
        if (!viewBtn) return;

        e.stopPropagation();

        const row = viewBtn.closest('tr');

        detailBody.innerHTML = `
            <p><b>Khách hàng:</b> ${row.querySelector('.name').innerText}</p>
            <p><b>SĐT:</b> ${row.cells[1].innerText}</p>
            <p><b>Số đơn:</b> ${row.cells[2].innerText}</p>
            <p><b>Tổng chi tiêu:</b>
                <span style="color:#e74c3c;font-weight:600">
                    ${row.cells[3].innerText}
                </span>
            </p>
            <p><b>Ngày tham gia:</b> ${row.cells[4].innerText}</p>
            <p><b>Loại khách hàng:</b> ${row.cells[5].innerHTML}</p>
        `;

        detailModal.style.display = 'flex';
    });

    if (closeModal) {
        closeModal.onclick = () => detailModal.style.display = 'none';
    }

    /* ======================
       EDIT CUSTOMER MODAL
       ====================== */
    const editModal = $('#editCustomerModal');
    const editUserId = $('#editUserId');
    const editName = $('#editName');
    const editPhone = $('#editPhone');
    const closeEdit = $('.close-edit');

    document.addEventListener('click', (e) => {
        const editBtn = e.target.closest('.edit-btn');
        if (!editBtn) return;

        e.stopPropagation();

        editUserId.value = editBtn.dataset.id;
        editName.value = editBtn.dataset.name;
        editPhone.value = editBtn.dataset.phone;

        editModal.style.display = 'flex';
    });

    if (closeEdit) {
        closeEdit.onclick = () => editModal.style.display = 'none';
    }

    /* ======================
       CLOSE MODAL BY BACKDROP
       ====================== */
    window.addEventListener('click', (e) => {
        if (e.target === detailModal) detailModal.style.display = 'none';
        if (e.target === editModal) editModal.style.display = 'none';
    });

    /* ======================
       NOTIFICATION (OPTIONAL)
       ====================== */
    const notifyBtn = $('.notification-badge');
    if (notifyBtn) {
        notifyBtn.addEventListener('click', () => {
            alert("🔔 Bạn có thông báo mới!");
        });
    }

    /* ======================
       LOGOUT CONFIRM
       ====================== */
    const logoutBtn = $('.logout a');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', (e) => {
            if (!confirm("Xác nhận đăng xuất?")) e.preventDefault();
        });
    }

    console.log("✅ khachhang.js loaded successfully");
});
