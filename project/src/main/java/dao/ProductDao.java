package dao;

import model.Product;

import java.util.List;

public class ProductDao extends BaseDao {

    public int getStockById(int productId) {
        String sql = "select stock_quantity from products where product_id = :id";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", productId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0)
        );
    }

    public List<Product> getListProduct() {
        String sql = "select p.product_id AS productId, p.category_id AS categoryId, p.product_name AS productName, c.name AS categoryName, p.product_price AS productPrice, p.stock_quantity AS stockQuantity, p.product_description AS productDescription, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p join categories c on p.category_id = c.category_id";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public List<Product> getProductsPerPage(int limit, int offset) {
        String sql = "select p.product_id AS productId, p.category_id AS categoryId, p.product_name AS productName, c.name AS categoryName, p.product_price AS productPrice, p.stock_quantity AS stockQuantity, p.product_description AS productDescription, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p join categories c on p.category_id = c.category_id Order by p.product_id ASC LIMIT :limit OFFSET :offset";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("limit", limit)
                        .bind("offset", offset)
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public int getTotalProducts() {
        String sql = "select count(*) from products";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
    }
    public Product getProductById(int id) {
        String sql = "select p.product_id AS productId, p.category_id AS categoryId, p.product_name AS productName, c.name AS categoryName, p.product_price AS productPrice, p.stock_quantity AS stockQuantity, p.product_description AS productDescription, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p join categories c on p.category_id = c.category_id where p.product_id = :id";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("id", id)
                        .mapToBean(Product.class)
                        .findOne()
                        .orElse(null)
        );
    }
    public List<Product> getProductByCategoryId(int categoryId, int limit) {
        String sql = "select p.product_id AS productId, p.category_id AS categoryId, p.product_name AS productName, c.name AS categoryName, p.product_price AS productPrice, p.stock_quantity AS stockQuantity, p.product_description AS productDescription, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p join categories c on p.category_id = c.category_id where p.category_id = :categoryId limit :limit";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list()
        );
    }
    public Product getFeaturedProductByCategoryId(int categoryId) {
        String sql = "select p.product_id AS productId, p.category_id AS categoryId, p.product_name AS productName, c.name AS categoryName, p.product_price AS productPrice, p.stock_quantity AS stockQuantity, p.product_description AS productDescription, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p join categories c on p.category_id = c.category_id where p.category_id = :categoryId order by p.product_id desc LIMIT 1";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .mapToBean(Product.class)
                        .findOne()
                        .orElse(null)
        );
    }
    public List<Product> getRelatedProducts(int categoryId, int productId) {
        String sql = "select p.product_id AS productId, p.category_id AS categoryId, p.product_name AS productName, c.name AS categoryName, p.product_price AS productPrice, p.stock_quantity AS stockQuantity, p.product_description AS productDescription, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p join categories c on p.category_id = c.category_id where p.category_id = :categoryId and p.product_id != :productId limit 4";


        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .bind("productId", productId)
                        .mapToBean(Product.class)
                        .list()
        );
    }

}