package cart;

import model.Product;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

public class Cart implements Serializable {

    private Map<Integer, CartItem> data;

    public Cart() {
        data = new LinkedHashMap<>();
    }

    public void addProduct(Product p, int quantity) {
        if (quantity <= 0) quantity = 1;

        CartItem item = data.get(p.getProductId());

        if (item != null) {
            item.upQuantity(quantity);
        } else {
            data.put(
                    p.getProductId(),
                    new CartItem(p, quantity, p.getProductPrice())
            );
        }
    }


    public boolean update(int productId, int quantity) {
        CartItem item = data.get(productId);
        if (item == null) return false;

        item.setQuantity(quantity);
        return true;
    }

    public CartItem deleteProduct(int productId) {
        return data.remove(productId);
    }

    public List<CartItem> removeAllProducts() {
        List<CartItem> items = new ArrayList<>(data.values());
        data.clear();
        return items;
    }

    public void clear() {
        data.clear();
    }


    public List<CartItem> getList() {
        return new ArrayList<>(data.values());
    }

    public CartItem getItem(int productId) {
        return data.get(productId);
    }

    public int getTotalQuantity() {
        int total = 0;
        for (CartItem item : data.values()) {
            total += item.getQuantity();
        }
        return total;
    }

    public BigDecimal getTotalPrice() {
        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : data.values()) {
            total = total.add(item.getTotal());
        }
        return total;
    }

    public boolean isEmpty() {
        return data.isEmpty();
    }
}
