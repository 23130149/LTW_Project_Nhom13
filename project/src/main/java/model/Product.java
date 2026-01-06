    package model;

    public class Product {
        private Integer product_id;
        private Integer category_id;
        private String product_name;
        private String category_name;
        private Integer product_price;
        private Integer Stock_Quantity;
        private String product_description;
        private String image_url;

        public Product(Integer product_id, Integer category_id, String product_name, String category_name, Integer product_price, Integer stock_Quantity, String product_description, String image_url) {
            this.product_id = product_id;
            this.category_id = category_id;
            this.product_name = product_name;
            this.category_name = category_name;
            this.product_price = product_price;
            Stock_Quantity = stock_Quantity;
            this.product_description = product_description;
            this.image_url = image_url;
        }

        public Product() {
        }

        @Override
        public String toString() {
            return "Product{" +
                    "product_id=" + product_id +
                    ", category_id=" + category_id +
                    ", product_name='" + product_name + '\'' +
                    ", category_name='" + category_name + '\'' +
                    ", product_price=" + product_price +
                    ", Stock_Quantity=" + Stock_Quantity +
                    ", product_description='" + product_description + '\'' +
                    ", image_url='" + image_url + '\'' +
                    '}';
        }

        public Integer getCategory_id() {
            return category_id;
        }

        public void setCategory_id(Integer category_id) {
            this.category_id = category_id;
        }

        public Integer getProduct_id() {
            return product_id;
        }

        public void setProduct_id(Integer product_id) {
            this.product_id = product_id;
        }

        public String getProduct_name() {
            return product_name;
        }

        public void setProduct_name(String product_name) {
            this.product_name = product_name;
        }

        public Integer getProduct_price() {
            return product_price;
        }

        public void setProduct_price(Integer product_price) {
            this.product_price = product_price;
        }

        public Integer getStock_Quantity() {
            return Stock_Quantity;
        }

        public void setStock_Quantity(Integer stock_Quantity) {
            Stock_Quantity = stock_Quantity;
        }

        public String getProduct_description() {
            return product_description;
        }

        public void setProduct_description(String product_description) {
            this.product_description = product_description;
        }

        public String getImage_url() {
            return image_url;
        }

        public void setImage_url(String image_url) {
            this.image_url = image_url;
        }

        public String getCategory_name() {
            return category_name;
        }

        public void setCategory_name(String category_name) {
            this.category_name = category_name;
        }
    }

