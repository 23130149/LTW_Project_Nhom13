document.addEventListener('DOMContentLoaded', () => {
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    const replyModal = $('#replyModal');
    const viewModal = $('#viewModal');
    const replyToName = $('#replyToName');
    const viewDetailContent = $('#viewDetailContent');
    let currentReviewItem = null;

    const searchInputs = [
        $('.header .search-box input'),
        $('.search-review-box input')
    ].filter(el => el !== null);

    searchInputs.forEach(input => {
        input.oninput = function () {
            const keyword = this.value.toLowerCase().trim();
            const reviews = $$('.review-item');

            searchInputs.forEach(other => {
                if (other) other.value = this.value;
            });

            reviews.forEach(item => {
                const name = item.querySelector('.reviewer-name').innerText.toLowerCase();
                const product = item.querySelector('.review-product').innerText.toLowerCase();
                const content = item.querySelector('.review-text').innerText.toLowerCase();

                const isMatch = name.includes(keyword) || product.includes(keyword) || content.includes(keyword);
                item.style.display = isMatch ? 'flex' : 'none';
            });
        };
    });

    $$('.bx-show-alt').forEach(btn => {
        btn.onclick = function () {
            const item = this.closest('.review-item');
            viewDetailContent.innerHTML = `
                <div style="border-bottom: 1px solid #eee; padding-bottom: 10px; margin-bottom: 10px;">
                    <p><strong>Khách hàng:</strong> ${item.querySelector('.reviewer-name').innerText}</p>
                    <p><strong>Ngày:</strong> ${item.querySelector('.review-item-date').innerText}</p>
                    <div style="color: #f1c40f;">${item.querySelector('.rating-stars').innerHTML}</div>
                </div>
                <p><strong>Sản phẩm:</strong> ${item.querySelector('.review-product').innerText}</p>
                <div style="background: #f9f9f9; padding: 15px; border-radius: 8px; margin-top: 10px; font-style: italic;">
                    "${item.querySelector('.review-text').innerText}"
                </div>
            `;
            viewModal.style.display = 'block';
        };
    });

    $$('.review-reply-action').forEach(btn => {
        btn.onclick = function () {
            currentReviewItem = this.closest('.review-item');
            replyToName.innerText = currentReviewItem.querySelector('.reviewer-name').innerText;
            replyModal.style.display = 'block';
            $('#replyText').focus();
        };
    });

    $('#sendReplyBtn').onclick = () => {
        const text = $('#replyText').value.trim();
        if (!text) return alert("Vui lòng nhập nội dung!");

        const responseDiv = document.createElement('div');
        responseDiv.className = 'shop-response';
        responseDiv.innerHTML = `<p class="response-title"><i class="bx bx-reply"></i> Shop phản hồi:</p><p class="response-text">${text}</p>`;

        currentReviewItem.querySelector('.review-content').appendChild(responseDiv);
        const replyBtn = currentReviewItem.querySelector('.review-reply-action');
        if (replyBtn) replyBtn.remove();

        alert("Gửi thành công!");
        replyModal.style.display = 'none';
        $('#replyText').value = "";
    };

    const filterButtons = $$('.filter-button');
    filterButtons.forEach(btn => {
        btn.onclick = function () {
            filterButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const starTarget = this.innerText.trim()[0];
            $$('.review-item').forEach(item => {
                if (this.innerText.includes("Tất cả")) {
                    item.style.display = 'flex';
                } else {
                    const stars = item.querySelectorAll('.rating-stars .bxs-star').length;
                    item.style.display = (stars == starTarget) ? 'flex' : 'none';
                }
            });
        };
    });

    $$('.close-modal').forEach(btn => {
        btn.onclick = () => {
            replyModal.style.display = 'none';
            viewModal.style.display = 'none';
        };
    });

    window.onclick = (e) => {
        if (e.target == replyModal || e.target == viewModal) {
            replyModal.style.display = 'none';
            viewModal.style.display = 'none';
        }
    };
});