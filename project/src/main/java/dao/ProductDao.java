package dao;

import model.Product;

import java.util.List;

public class ProductDao extends BaseDao {

    public List<Product> getListProduct() {
        String sql = "select p.*, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as image_url from products p";
            return getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                    .mapToBean(Product.class)
                    .list()
        );
    }
    public List<Product> getProductsPerPage(int limit, int offset) {
        String sql = "select p.*, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as image_url from products p Order by product_id ASC LIMIT :limit OFFSET :offset";
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
        String sql = "select p.*, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as image_url from products p where product_id = :id";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                    .bind("id", id)
                    .mapToBean(Product.class)
                    .findOne()
                    .orElse(null)
        );
    }

    public List<Product> getProductByCategoryId(int categoryId) {
        String sql = "select p.*, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as image_url from products p where category_id = :categoryId";

            return getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                    .bind("categoryId", categoryId)
                    .mapToBean(Product.class)
                    .list()
        );
    }
    public List<Product> getFeaturedProductsByCategoryId(int  categoryId) {
        String sql = "select p.*, (select pi.image_url from product_images pi where pi.product_id = p.product_id order by pi.image_id ASC limit 1) as imageUrl from products p where p.category_id = :categoryId LIMIT 8";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public static void main(String[] args) {
        ProductDao pdao = new ProductDao();

        System.out.println("--- KIEM TRA KET QUA DAO ---");
        pdao.getListProduct().forEach(p ->
                System.out.println(p.getProduct_name() + " URL: " + p.getImage_url()));
        Product p = pdao.getProductById(1);
        if(p != null) {
            System.out.println("Product ID 1: " + p.getProduct_name() + " URL: " + p.getImage_url());
        }
        pdao.getProductByCategoryId(1).forEach(p2 ->
                System.out.println(p2.getProduct_name() + "Cat: " + p2.getCategory_id() +  " URL: " + p2.getImage_url()));
        }
}
