/**
 * Admin Settings Script
 * Xử lý: UI Theme, Validation Form, Toast Notifications
 */
document.addEventListener('DOMContentLoaded', function() {

    const colorCircles = document.querySelectorAll('.color-circle');
    colorCircles.forEach(circle => {
        circle.addEventListener('click', function() {
            colorCircles.forEach(c => c.classList.remove('active'));
            this.classList.add('active');

            const color = window.getComputedStyle(this).backgroundColor;
            console.log("Màu chủ đạo đã chọn:", color);
        });
    });

    const btnPassword = document.querySelector('.btn-password');
    if (btnPassword) {
        btnPassword.addEventListener('click', function(e) {
            // Lấy form chứa nút này
            const form = this.closest('section').querySelectorAll('input');
            const oldPass = form[0].value;
            const newPass = form[1].value;
            const confirmPass = form[2].value;

            if (!oldPass || !newPass || !confirmPass) {
                showToast("Vui lòng nhập đầy đủ các trường mật khẩu!", "error");
                return;
            }

            if (newPass.length < 6) {
                showToast("Mật khẩu mới phải từ 6 ký tự trở lên!", "error");
                return;
            }

            if (newPass !== confirmPass) {
                showToast("Mật khẩu xác nhận không khớp!", "error");
                return;
            }

            showToast("Đang xử lý đổi mật khẩu...", "info");
        });
    }

    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get('status');

    if (status === 'success') {
        showToast("Cập nhật dữ liệu thành công!", "success");
        window.history.replaceState({}, document.title, window.location.pathname);
    } else if (status === 'error') {
        showToast("Có lỗi xảy ra, vui lòng kiểm tra lại!", "error");
    }

    function showToast(message, type = 'success') {
        let container = document.querySelector('.toast-container');
        if (!container) {
            container = document.createElement('div');
            container.className = 'toast-container';
            document.body.appendChild(container);
        }

        const toast = document.createElement('div');
        toast.className = `toast-item ${type}`;

        let icon = 'bx-check-circle';
        if (type === 'error') icon = 'bx-error-circle';
        if (type === 'info') icon = 'bx-info-circle';

        toast.innerHTML = `
            <i class='bx ${icon}'></i>
            <span>${message}</span>
        `;

        container.appendChild(toast);

        setTimeout(() => {
            toast.style.animation = 'fadeOut 0.5s forwards';
            setTimeout(() => toast.remove(), 500);
        }, 4000);
    }
});