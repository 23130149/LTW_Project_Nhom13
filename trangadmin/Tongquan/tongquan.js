document.addEventListener("DOMContentLoaded", () => {
    const navItems = document.querySelectorAll('.slidebar-nav ul li');
    navItems.forEach(item => {
        item.addEventListener('click', function() {
            navItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });
    const searchInput = document.querySelector('.search-box input');
    const tableRows = document.querySelectorAll('.data-table tbody tr');

    if (searchInput) {
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase().trim();
            tableRows.forEach(row => {
                const text = row.innerText.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });
    }
    const chartFilter = document.querySelector('.chart-filter');
    const bars = document.querySelectorAll('.bar-chart');

    if (chartFilter) {
        chartFilter.addEventListener('change', function() {
            bars.forEach(bar => {
                const randomHeight = Math.floor(Math.random() * 70) + 20;
                bar.style.height = randomHeight + '%';
            });
        });
    }
    const modal = document.getElementById("orderModal");
    const modalBody = document.getElementById("modalBody");
    const closeBtn = document.querySelector(".close-btn");

    document.querySelectorAll('.action-icon').forEach(icon => {
        icon.addEventListener('click', function() {
            const row = this.closest('tr');
            const cells = row.querySelectorAll('td');

            const orderId = cells[0].innerText;
            const customer = cells[1].innerText;
            const product = cells[2].innerText;
            const total = cells[4].innerText;
            const statusNode = cells[5].querySelector('.status');
            const statusText = statusNode.innerText;
            const statusClass = statusNode.className;
            modalBody.innerHTML = `
                <div style="line-height: 2;">
                    <p><strong>Mã đơn:</strong> <span style="color: #2c3e50;">${orderId}</span></p>
                    <p><strong>Khách hàng:</strong> ${customer}</p>
                    <p><strong>Sản phẩm:</strong> ${product}</p>
                    <p><strong>Tổng tiền:</strong> <span style="color: #e74c3c; font-weight: bold;">${total}</span></p>
                    <p><strong>Trạng thái:</strong> <span class="${statusClass}" style="display:inline-block; padding: 2px 10px;">${statusText}</span></p>
                </div>
            `;
            modal.style.display = "block";
        });
    });
    if (closeBtn) {
        closeBtn.onclick = () => modal.style.display = "none";
    }
    window.onclick = (event) => {
        if (event.target == modal) modal.style.display = "none";
    };
    const notifyBtn = document.querySelector('.notification-badge');
    if (notifyBtn) {
        notifyBtn.addEventListener('click', () => alert("Bạn có 3 thông báo mới!"));
    }
    const logoutBtn = document.querySelector('.logout a');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', (e) => {
            if (!confirm("Xác nhận đăng xuất khỏi hệ thống?")) e.preventDefault();
        });
    }
});