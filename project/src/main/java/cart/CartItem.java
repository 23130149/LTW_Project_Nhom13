package cart;

import model.Product;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {

    private Product product;
    private int quantity;
    private BigDecimal price; // giá tại thời điểm add vào cart

    public CartItem(Product product, int quantity, Integer price) {
        this.product = product;
        this.quantity = Math.max(quantity, 1);
        this.price = BigDecimal.valueOf(price);
    }

    // ===== BUSINESS =====
    public void upQuantity(int amount) {
        if (amount <= 0) amount = 1;
        this.quantity += amount;
    }

    public BigDecimal getTotal() {
        return price.multiply(BigDecimal.valueOf(quantity));
    }

    // ===== GET / SET =====
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = Math.max(quantity, 1);
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
