package dao;

import model.Category;

import java.util.List;

public class CategoryDao extends BaseDao {
    public List<Category> getAllCategories() {
        String sql = "select category_id, name, image_url from categories order by name ASC";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
    }

    public static void main(String[] args) {
        ProductDao pdao = new ProductDao();
        System.out.println("So luong san pham trong DB: " + pdao.getTotalProducts());
        pdao.getListProduct().forEach(p -> System.out.println("Product: " + p.getProductName() + ", URL: " + p.getImageUrl()));
    }
}
