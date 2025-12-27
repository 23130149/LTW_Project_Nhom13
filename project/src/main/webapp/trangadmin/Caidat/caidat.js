document.addEventListener("DOMContentLoaded", () => {
    const saveBtn = document.querySelector(".btn-save");

    saveBtn.addEventListener("click", () => {
        const inputs = document.querySelectorAll(
            ".settings-card input, .settings-card textarea"
        );

        let valid = true;
        inputs.forEach(input => {
            if (input.value.trim() === "") {
                input.style.borderColor = "red";
                valid = false;
            } else {
                input.style.borderColor = "#e2e8f0";
            }
        });

        if (!valid) {
            alert("❌ Vui lòng nhập đầy đủ thông tin!");
            return;
        }

        alert("✅ Lưu thông tin thành công!");
    });

    document.querySelectorAll(".toggle input").forEach(toggle => {
        toggle.addEventListener("change", () => {
            console.log(toggle.checked ? "🔔 Bật thông báo" : "🔕 Tắt thông báo");
        });
    });

    const colorCircles = document.querySelectorAll(".color-circle");
    const sidebar = document.querySelector(".sliderbar");
    const saveButton = document.querySelector(".btn-save");
    const passwordButton = document.querySelector(".btn-password");
    const activeIcon = document.querySelectorAll(".settings-card h3 i");

    const themes = {
        c1: "linear-gradient(to bottom, #11998e, #38ef7d)",
        c2: "linear-gradient(to bottom, #0984e3, #74b9ff)",
        c3: "linear-gradient(to bottom, #e17055, #fab1a0)",
        c4: "linear-gradient(to bottom, #7f00ff, #c77dff)"
    };

    colorCircles.forEach(circle => {
        circle.addEventListener("click", () => {
            colorCircles.forEach(c => c.classList.remove("active"));
            circle.classList.add("active");

            const themeClass = [...circle.classList].find(c => themes[c]);
            if (!themeClass) return;

            sidebar.style.background = themes[themeClass];
            saveButton.style.background = themes[themeClass];
            passwordButton.style.background = themes[themeClass];

            activeIcon.forEach(icon => {
                icon.style.color = getComputedStyle(circle).backgroundColor;
            });

            console.log("🎨 Đã đổi theme:", themeClass);
        });
    });

    const languageSelect = document.querySelector("select");
    languageSelect.addEventListener("change", () => {
        alert(`🌐 Đã chuyển sang ${languageSelect.value} (demo)`);
    });

    const passwordBtn = document.querySelector(".btn-password");

    passwordBtn.addEventListener("click", () => {
        const inputs = document.querySelectorAll(".form-input");
        const current = inputs[0].value;
        const newPass = inputs[1].value;
        const confirm = inputs[2].value;

        if (!current || !newPass || !confirm) {
            alert("❌ Nhập đầy đủ mật khẩu");
            return;
        }

        if (newPass.length < 6) {
            alert("❌ Mật khẩu phải ≥ 6 ký tự");
            return;
        }

        if (newPass !== confirm) {
            alert("❌ Mật khẩu xác nhận không khớp");
            return;
        }

        alert("✅ Đổi mật khẩu thành công!");
        inputs.forEach(i => i.value = "");
    });

    document.querySelector(".notification-badge").addEventListener("click", () => {
        alert("🔔 Bạn có 3 thông báo mới");
    });

});
