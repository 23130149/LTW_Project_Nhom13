document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const detailModal = $("#customerModal");
    const addModal = $("#addCustomerModal");
    const detailBody = $("#customerDetailBody");
    const searchInput = $(".search-customer-box input");
    const addForm = $("#addCustomerForm");

    // Lưu trữ hàng đang được chọn để xóa hoặc sửa
    let currentSelectedRow = null;

    // --- 1. MỞ MODAL CHI TIẾT ---
    $$(".action-icon").forEach(icon => {
        icon.onclick = () => {
            currentSelectedRow = icon.closest("tr");

            const name = currentSelectedRow.cells[0].innerText.trim();
            const phone = currentSelectedRow.cells[1].innerText;
            const orderCount = currentSelectedRow.cells[2].innerText;
            const totalSpend = currentSelectedRow.cells[3].innerText;
            const joinDate = currentSelectedRow.cells[4].innerText;
            const typeTag = currentSelectedRow.cells[5].innerHTML;

            detailBody.innerHTML = `
                <div class="detail-container">
                    <div class="detail-header-info" style="display: flex; align-items: center; gap: 20px; margin-bottom: 20px;">
                        <div class="large-avatar" style="width: 70px; height: 70px; background: linear-gradient(135deg, #11998e, #38ef7d); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 28px; font-weight: bold;">
                            ${name.charAt(0).toUpperCase()}
                        </div>
                        <div>
                            <h4 id="displayCustName" style="font-size: 20px; margin: 0;">${name}</h4>
                            <div style="margin-top: 5px;">${typeTag}</div>
                        </div>
                    </div>
                    <hr style="border: none; border-top: 1px solid #eee; margin-bottom: 20px;">
                    <div class="detail-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <p><strong>SĐT:</strong> <span id="displayCustPhone">${phone}</span></p>
                        <p><strong>Tham gia:</strong> ${joinDate}</p>
                        <p><strong>Đơn hàng:</strong> ${orderCount}</p>
                        <p><strong>Chi tiêu:</strong> <span style="color: #27ae60; font-weight: bold;">${totalSpend}</span></p>
                    </div>
                    <div class="detail-actions" style="margin-top: 25px; display: flex; gap: 10px; justify-content: flex-end;">
                        <button type="button" class="btn-edit-active" style="padding: 8px 15px; border: 1px solid #ddd; border-radius: 6px; cursor: pointer; background: white;">Chỉnh sửa</button>
                        <button type="button" class="btn-delete-active" style="padding: 8px 15px; background: #ff7675; color: white; border: none; border-radius: 6px; cursor: pointer;">Xóa khách hàng</button>
                    </div>
                </div>
            `;
            detailModal.style.display = "flex";
        };
    });

    // --- 2. XỬ LÝ XÓA VÀ SỬA TRÊN GIAO DIỆN ---
    detailBody.onclick = (e) => {
        // Lệnh Xóa
        if (e.target.classList.contains('btn-delete-active')) {
            if (confirm("Bạn có chắc chắn muốn xóa khách hàng này khỏi danh sách?")) {
                if (currentSelectedRow) {
                    currentSelectedRow.remove(); // Xóa hàng khỏi bảng
                    detailModal.style.display = "none";
                    alert("Đã xóa khách hàng thành công!");
                }
            }
        }

        // Lệnh Sửa (Demo sửa tên)
        if (e.target.classList.contains('btn-edit-active')) {
            const newName = prompt("Nhập tên mới cho khách hàng:", $("#displayCustName").innerText);
            if (newName && newName.trim() !== "") {
                // Cập nhật trong Modal
                $("#displayCustName").innerText = newName;
                // Cập nhật ngược lại bảng chính
                if (currentSelectedRow) {
                    currentSelectedRow.cells[0].innerText = newName;
                }
                alert("Đã cập nhật tên khách hàng!");
            }
        }
    };

    // --- 3. CÁC HÀM ĐÓNG MODAL ---
    const closeModals = () => {
        detailModal.style.display = "none";
        addModal.style.display = "none";
    };

    // Sửa lỗi nút thoát (X) không bấm được
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('close-btn') || e.target.classList.contains('bx-x')) {
            closeModals();
        }
    });

    window.onclick = (e) => {
        if (e.target === detailModal || e.target === addModal) closeModals();
    };

    // --- 4. TÌM KIẾM ---
    if (searchInput) {
        searchInput.oninput = () => {
            const value = searchInput.value.toLowerCase().trim();
            const allRows = $$(".data-table tbody tr");
            allRows.forEach(row => {
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(value) ? "" : "none";
            });
        };
    }
});