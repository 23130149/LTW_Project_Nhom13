document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const detailModal = $("#customerModal");
    const addModal = $("#addCustomerModal");
    const detailBody = $("#customerDetailBody");
    const searchInput = $(".search-customer-box input");
    const addForm = $("#addCustomerForm");
    const rows = $$(".data-table tbody tr");

    $$(".action-icon").forEach(icon => {
        icon.onclick = () => {
            const row = icon.closest("tr");

            const name = row.cells[0].innerText.trim();
            const phone = row.cells[1].innerText;
            const orderCount = row.cells[2].innerText;
            const totalSpend = row.cells[3].innerText;
            const joinDate = row.cells[4].innerText;
            const typeTag = row.cells[5].innerHTML;

            detailBody.innerHTML = `
                <div class="detail-container">
                    <div class="detail-header-info" style="display: flex; align-items: center; gap: 20px; margin-bottom: 20px;">
                        <div class="large-avatar" style="width: 70px; height: 70px; background: linear-gradient(135deg, #11998e, #38ef7d); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: bold; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
                            ${name.charAt(0).toUpperCase()}
                        </div>
                        <div>
                            <h4 style="font-size: 20px; margin: 0;">${name}</h4>
                            <div style="margin-top: 5px;">${typeTag}</div>
                        </div>
                    </div>
                    <hr style="border: none; border-top: 1px solid #eee; margin-bottom: 20px;">
                    <div class="detail-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <p><strong><i class='bx bx-phone'></i> SĐT:</strong> ${phone}</p>
                        <p><strong><i class='bx bx-calendar'></i> Tham gia:</strong> ${joinDate}</p>
                        <p><strong><i class='bx bx-shopping-bag'></i> Đơn hàng:</strong> ${orderCount}</p>
                        <p><strong><i class='bx bx-wallet'></i> Chi tiêu:</strong> <span style="color: #27ae60; font-weight: bold;">${totalSpend}</span></p>
                    </div>
                    <div class="detail-actions" style="margin-top: 25px; display: flex; gap: 10px; justify-content: flex-end;">
                        <button class="btn-edit" style="padding: 8px 15px; border: 1px solid #ddd; border-radius: 6px; cursor: pointer; background: white;">Chỉnh sửa</button>
                        <button class="btn-delete" style="padding: 8px 15px; background: #ff7675; color: white; border: none; border-radius: 6px; cursor: pointer;">Xóa khách hàng</button>
                    </div>
                </div>
            `;
            detailModal.style.display = "flex";
        };
    });

    $(".add-customer-btn").onclick = () => {
        addModal.style.display = "flex";
    };

    addForm.onsubmit = (e) => {
        e.preventDefault();
        const name = $("#newCustName").value;
        const phone = $("#newCustPhone").value;

        alert(`🎉 Chúc mừng! Đã thêm khách hàng ${name} thành công.`);

        addForm.reset();
        addModal.style.display = "none";
    };

    searchInput.onkeyup = () => {
        const value = searchInput.value.toLowerCase().trim();

        rows.forEach(row => {
            const name = row.cells[0].innerText.toLowerCase();
            const phone = row.cells[1].innerText.toLowerCase();

            const isMatch = name.includes(value) || phone.includes(value);
            row.style.display = isMatch ? "" : "none";
        });
    };

    const closeModals = () => {
        detailModal.style.display = "none";
        addModal.style.display = "none";
    };

    $$(".close-modal, .close-add-modal").forEach(btn => {
        btn.onclick = closeModals;
    });

    window.onclick = (e) => {
        if (e.target === detailModal || e.target === addModal) {
            closeModals();
        }
    };

    const headerSearch = $(".header .search-box input");
    if (headerSearch) {
        headerSearch.oninput = (e) => {
            searchInput.value = e.target.value;
            searchInput.onkeyup();
        };
    }
});