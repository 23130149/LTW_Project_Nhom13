document.addEventListener('DOMContentLoaded', () => {
    const addToCartButtons = document.querySelectorAll('.add-to-cart-btn');
    addToCartButtons.forEach(button => {
        button.addEventListener('click', () => {
            const productItem = button.closest('.product-item');
            if (!productItem) return;
            const productName = productItem.querySelector('.product-name')?.textContent.trim();
            const productPrice = productItem.querySelector('.product-price')?.textContent.trim();
            let cart = JSON.parse(localStorage.getItem('cart')) || [];
            const existingProduct = cart.find(item => item.name === productName);
            if (existingProduct) {
                existingProduct.quantity += 1;
            } else {
                cart.push({
                    name: productName,
                    price: productPrice,
                    quantity: 1
                });
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            alert(`Đã thêm "${productName}" vào giỏ hàng`);
            console.log('Giỏ hàng hiện tại:', cart);
        });
    });
    const searchForm = document.querySelector('.search-form');
    const searchInput = document.querySelector('.search-input');
    const products = document.querySelectorAll('.product-item');

    if (searchForm) {
        searchForm.addEventListener('submit', (e) => {
            e.preventDefault();

            const keyword = searchInput.value.toLowerCase().trim();

            if (keyword === '') {
                alert('Vui lòng nhập nội dung tìm kiếm.');
                resetProducts();
                return;
            }
            products.forEach(item => {
                const name = item.querySelector('.product-name')
                    .textContent.toLowerCase();

                item.style.display = name.includes(keyword) ? 'block' : 'none';
            });
        });
    }
    const sortSelect = document.querySelector('.sort-options-select');
    const productGrid = document.querySelector('.product-grid');
    if (sortSelect) {
        sortSelect.addEventListener('change', (e) => {
            const value = e.target.value;
            const productArray = Array.from(document.querySelectorAll('.product-item'));
            if (value === 'price-asc') {
                productArray.sort((a, b) => getPrice(a) - getPrice(b));
            }
            if (value === 'price-desc') {
                productArray.sort((a, b) => getPrice(b) - getPrice(a));
            }
            productGrid.innerHTML = '';
            productArray.forEach(item => productGrid.appendChild(item));
        });
    }
    function getPrice(productItem) {
        const priceText = productItem.querySelector('.product-price').textContent;
        return parseInt(priceText.replace(/[^\d]/g, '')) || 0;
    }

    function resetProducts() {
        products.forEach(item => {
            item.style.display = 'block';
        });
    }
});
