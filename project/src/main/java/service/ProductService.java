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
    public  int getStockById(int productId){return pdao.getStockById(productId);}
    public int getTotalProducts() {
        return pdao.getTotalProducts();
    }
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }
    public List<Product> getListProductByCategoryId(int categoryId, int limit) { return pdao.getProductByCategoryId(categoryId, 8); }
    public Product getFeaturedProductByCategoryId(int categoryId) { return pdao.getFeaturedProductByCategoryId(categoryId); }
    public List<Product> getRelatedProducts(int categoryId, int productId) { return pdao.getRelatedProducts(categoryId, productId); }
}
