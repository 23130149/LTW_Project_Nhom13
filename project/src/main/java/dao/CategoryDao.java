package dao;

import model.Category;

import java.util.List;

public class CategoryDao extends BaseDao {
    public List<Category> getAllCategories() {
        String sql = "select category_id, name from categories order by name ASC";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
    }
}
