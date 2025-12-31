package service;

import dao.ProductDao;
import model.Product;

import java.util.List;

public class ProductService {
    ProductDao pdao = new ProductDao();

    public List<Product> getListProduct() {
        return pdao.getListProduct();
    }
    public List<Product> getProductsPerPage(int limit, int offset) {
        return pdao.getProductsPerPage(limit, offset);
    }
    public int getTotalProducts() {
        return pdao.getTotalProducts();
    }
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }
    public List<Product> getListProductByCategoryId(int category_id) {
        return pdao.getProductByCategoryId(category_id);
    }
}
