document.addEventListener('DOMContentLoaded', function() {

    const modal = document.getElementById("orderModal");
    const closeBtn = document.querySelector(".close-btn");
    const actionIcons = document.querySelectorAll(".action-icon");
    const modalBody = document.getElementById("modalBody");

    actionIcons.forEach(icon => {
        icon.addEventListener("click", function() {
            const row = this.closest("tr");
            const orderId = row.cells[0].innerText;
            const customer = row.cells[1].innerText;
            const product = row.cells[2].innerText;
            const quantity = row.cells[3].innerText;
            const total = row.cells[4].innerText;
            const status = row.cells[5].innerText.trim();
            const date = row.cells[6].innerText;

            modalBody.innerHTML = `
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-top: 15px;">
                    <p><strong>Mã đơn hàng:</strong> ${orderId}</p>
                    <p><strong>Ngày đặt:</strong> ${date}</p>
                    <p><strong>Khách hàng:</strong> ${customer}</p>
                    <p><strong>Trạng thái:</strong> <span class="status status-${getStatusClass(status)}">${status}</span></p>
                    <p><strong>Sản phẩm:</strong> ${product}</p>
                    <p><strong>Số lượng:</strong> ${quantity}</p>
                    <p style="grid-column: span 2; font-size: 1.2rem; color: #11998e; border-top: 1px solid #eee; padding-top: 10px;">
                        <strong>Tổng cộng:</strong> ${total}
                    </p>
                </div>
            `;
            modal.style.display = "block";
        });
    });

    closeBtn.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function getStatusClass(status) {
        if (status === 'Hoàn thành') return 'completed';
        if (status === 'Đang giao') return 'shipping';
        return 'pending';
    }

    const bars = document.querySelectorAll('.bar-chart');
    bars.forEach(bar => {
        const height = bar.style.height;
        bar.style.height = '0'; // Reset về 0
        setTimeout(() => {
            bar.style.transition = 'height 1s ease-out';
            bar.style.height = height;
        }, 3000);
    });

    const chartFilter = document.querySelector('.chart-filter');
    if(chartFilter) {
        chartFilter.addEventListener('change', function() {
            document.querySelector('.chart-area').style.opacity = '0.5';
        });
    }

    const valueElements = document.querySelectorAll('.stat-details .value');
    valueElements.forEach(el => {
        const rawValue = el.innerText.replace(/[^0-9]/g, ''); // Lấy chỉ số
        const target = parseInt(rawValue);
        if(isNaN(target)) return;

        let count = 0;
        const speed = 2000 / target;

        const updateCount = () => {
            const increment = Math.ceil(target / 100);
            if (count < target) {
                count += increment;
                if(count > target) count = target;

                if (el.innerText.includes('đ')) {
                    el.innerText = count.toLocaleString('vi-VN') + 'đ';
                } else {
                    el.innerText = count;
                }
                setTimeout(updateCount, 20);
            }
        };
        updateCount();
    });
});