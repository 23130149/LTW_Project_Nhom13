document.addEventListener('DOMContentLoaded', () => {

    const headerSearch = document.getElementById('headerSearch');
    const listSearch = document.getElementById('listSearch');

    function filterReviews(keyword) {
        keyword = keyword.toLowerCase().trim();

        document.querySelectorAll('.review-item').forEach(item => {
            const name = item.querySelector('.reviewer-name').innerText.toLowerCase();
            const product = item.querySelector('.review-product').innerText.toLowerCase();
            const content = item.querySelector('.review-text').innerText.toLowerCase();

            const match =
                name.includes(keyword) ||
                product.includes(keyword) ||
                content.includes(keyword);

            item.style.display = match ? 'flex' : 'none';
        });
    }

    [headerSearch, listSearch].forEach(input => {
        input.addEventListener('input', function () {
            const value = this.value;

            if (this !== headerSearch) headerSearch.value = value;
            if (this !== listSearch) listSearch.value = value;

            filterReviews(value);
        });
    });

    document.querySelectorAll('.filter-button').forEach(btn => {
        btn.addEventListener('click', () => {
            document.querySelectorAll('.filter-button')
                .forEach(b => b.classList.remove('active'));

            btn.classList.add('active');

            const target = btn.innerText[0];

            document.querySelectorAll('.review-item').forEach(item => {
                const starCount = item.querySelectorAll('.bxs-star').length;
                item.style.display =
                    btn.innerText.includes('Tất cả') || starCount == target
                        ? 'flex' : 'none';
            });
        });
    });

    document.querySelectorAll('.bx-show-alt').forEach(btn => {
        btn.addEventListener('click', () => {
            const item = btn.closest('.review-item');
            document.getElementById('viewDetailContent').innerHTML = `
                <p><strong>Khách hàng:</strong> ${item.querySelector('.reviewer-name').innerText}</p>
                <p><strong>Ngày:</strong> ${item.querySelector('.review-item-date').innerText}</p>
                <div>${item.querySelector('.rating-stars').innerHTML}</div>
                <p><strong>Sản phẩm:</strong> ${item.querySelector('.review-product').innerText}</p>
                <p>"${item.querySelector('.review-text').innerText}"</p>
            `;
            document.getElementById('viewModal').style.display = 'block';
        });
    });

    let currentReview = null;

    document.querySelectorAll('.review-reply-action').forEach(btn => {
        btn.addEventListener('click', () => {
            currentReview = btn.closest('.review-item');
            document.getElementById('replyToName').innerText =
                currentReview.querySelector('.reviewer-name').innerText;
            document.getElementById('replyModal').style.display = 'block';
        });
    });

    document.getElementById('sendReplyBtn').onclick = () => {
        const text = document.getElementById('replyText').value.trim();
        if (!text) return;

        const div = document.createElement('div');
        div.className = 'shop-response';
        div.innerHTML = `<p class="response-title">Phản hồi:</p><p>${text}</p>`;
        currentReview.querySelector('.review-content').appendChild(div);

        currentReview.querySelector('.review-reply-action').remove();
        document.getElementById('replyModal').style.display = 'none';
        document.getElementById('replyText').value = '';
    };

    document.querySelectorAll('.close-modal').forEach(btn => {
        btn.onclick = () => {
            document.getElementById('replyModal').style.display = 'none';
            document.getElementById('viewModal').style.display = 'none';
        };
    });

    window.onclick = e => {
    }
}