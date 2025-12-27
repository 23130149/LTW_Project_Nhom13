import java.util.List;

public class ProductService {
    ProductDao pdao = new ProductDao();
    public List<Product> getListProduct() {
        return pdao.getListProduct();
    }
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }
    public List<Product> getListProductByCategoryId(int category_id) {
        return pdao.getProductByCategoryId(category_id);
    }
}
