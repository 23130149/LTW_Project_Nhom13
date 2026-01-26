document.addEventListener('DOMContentLoaded', () => {

    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const detailModal = $('#customerModal');
    const detailBody = $('#customerDetailBody');
    const closeModalBtn = $('.close-modal');

    /* ======================
       VIEW CUSTOMER
       ====================== */
    document.addEventListener('click', (e) => {
        const viewBtn = e.target.closest('.view-btn');
        if (!viewBtn) return;

        const row = viewBtn.closest('tr');
        if (!row) return;

        const name = row.querySelector('.name')?.innerText || '';
        const phone = row.cells[1]?.innerText || '';
        const orders = row.cells[2]?.innerText || '';
        const spend = row.cells[3]?.innerText || '';
        const date = row.cells[4]?.innerText || '';
        const typeHTML = row.cells[5]?.innerHTML || '';

        detailBody.innerHTML = `
            <p><b>Khách hàng:</b> ${name}</p>
            <p><b>SĐT:</b> ${phone}</p>
            <p><b>Số đơn:</b> ${orders}</p>
            <p><b>Tổng chi tiêu:</b> 
                <span style="color:#e74c3c;font-weight:600">${spend}</span>
            </p>
            <p><b>Ngày tham gia:</b> ${date}</p>
            <p><b>Loại:</b> ${typeHTML}</p>
        `;

        detailModal.style.display = 'flex';
    });

    if (closeModalBtn) {
        closeModalBtn.onclick = () => {
            detailModal.style.display = 'none';
        };
    }

    window.addEventListener('click', (e) => {
        if (e.target === detailModal) {
            detailModal.style.display = 'none';
        }
    });

    /* ======================
       SEARCH
       ====================== */
    const searchInput = $('#searchInput');
    if (searchInput) {
        searchInput.addEventListener('keyup', function () {
            const keyword = this.value.toLowerCase();
            $$('#customerTable tr').forEach(row => {
                const name = row.querySelector('.name')?.innerText.toLowerCase() || '';
                row.style.display = name.includes(keyword) ? '' : 'none';
            });
        });
    }

    /* ======================
       EDIT CUSTOMER
       ====================== */
    const editModal = $('#editCustomerModal');
    const editUserId = $('#editUserId');
    const editName = $('#editName');
    const editPhone = $('#editPhone');
    const closeEdit = $('.close-edit');

    document.addEventListener('click', (e) => {
        const editBtn = e.target.closest('.edit-btn');
        if (!editBtn) return;

        editUserId.value = editBtn.dataset.id;
        editName.value = editBtn.dataset.name;
        editPhone.value = editBtn.dataset.phone;

        editModal.style.display = 'flex';
    });

    if (closeEdit) {
        closeEdit.onclick = () => {
            editModal.style.display = 'none';
        };
    }

    window.addEventListener('click', (e) => {
        if (e.target === editModal) {
            editModal.style.display = 'none';
        }
    });
});
