import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {

    public List<Product> getListProduct() {
        Jdbi jdbi = DBConnection.getJdbi();
        if (jdbi == null) {
            throw new RuntimeException("JDBI NULL - KET NOI DB THAT BAI");
        }
        String sql = "select * from products";

        List<Product> products = jdbi.withHandle(handle -> {
            return handle.createQuery(sql)
                         .mapToBean(Product.class)
                         .list();
        });
        return products;
    }

    public Product getProductById(int id) {
        Jdbi jdbi = DBConnection.getJdbi();
        String sql = "select * from products where product_id = :id";

        Product product = jdbi.withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("id", id)
                    .mapToBean(Product.class)
                    .one();
        });
        return product;
    }
    public List<Product> getProductByCategoryId(int categoryId) {
        Jdbi jdbi = DBConnection.getJdbi();
        String sql = "select * from products     where category_id = :categoryId";
        List<Product> products = jdbi.withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("categoryId", categoryId)
                    .mapToBean(Product.class)
                    .list();
        });
        return products;
    }

    public static void main(String[] args) {
        ProductDao pdao = new ProductDao();

        System.out.println("--- KIEM TRA KET QUA DAO ---");
        try {
            List<Product> allProducts = pdao.getListProduct();
            if (allProducts.isEmpty()) {
                System.out.println("Khong co san pham nao trong DB hoac ket noi loi.");
            } else {
                for (Product p : allProducts) {
                    System.out.println(p.getProduct_name() + " ID: " + p.getProduct_id());
                }
            }
        } catch (Exception e) {
            System.err.println();
            e.printStackTrace();
        }
        Product productById = pdao.getProductById(1);
        if (productById != null) {
            System.out.println(productById.getProduct_name());
        } else {
            System.out.println();
        }
        List<Product> productByCategoryId = pdao.getProductByCategoryId(1);
        if (productByCategoryId.isEmpty()) {
            System.out.println();
        } else {
            for (Product p : productByCategoryId) {
                System.out.println(p.getProduct_name() + p.getCategory_id());
            }
        }
    }

