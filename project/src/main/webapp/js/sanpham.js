document.addEventListener("DOMContentLoaded", function () {

    const params = new URLSearchParams(window.location.search);

    const currentKeyword = params.get("keyword") || "";
    const currentCategoryId = params.get("categoryId") || "0";
    const currentSort = params.get("sort") || "default";

    const sortSelect = document.querySelector(".sort-options-select");

    if (sortSelect) {
        sortSelect.value = currentSort;

        sortSelect.addEventListener("change", function () {
            const sortValue = this.value;
            const newParams = new URLSearchParams();

            if (currentKeyword !== "") {
                newParams.set("keyword", currentKeyword);
            }

            if (currentCategoryId !== "0") {
                newParams.set("categoryId", currentCategoryId);
            }

            if (sortValue !== "default") {
                newParams.set("sort", sortValue);
            }

            newParams.set("page", "1");

            window.location.href = "product?" + newParams.toString();
        });
    }

    const categoryLinks = document.querySelectorAll(".category-filter a");

    categoryLinks.forEach(link => {
        link.addEventListener("click", function (e) {
            e.preventDefault();

            const url = new URL(this.href, window.location.origin);
            const catId = url.searchParams.get("categoryId");

            const newParams = new URLSearchParams();

            if (currentKeyword !== "") {
                newParams.set("keyword", currentKeyword);
            }

            if (catId) {
                newParams.set("categoryId", catId);
            }

            if (currentSort !== "default") {
                newParams.set("sort", currentSort);
            }

            newParams.set("page", "1");

            window.location.href = "product?" + newParams.toString();
        });
    });

});
