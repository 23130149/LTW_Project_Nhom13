package cart;

import model.Product;

public class CartItem {
    private Product product;
    private int quantity;
    private int price;

    public CartItem(Product product, int quantity, int price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void upQuantity(int quantity) {
        if(quantity <= 0) quantity = 1;
        this.quantity += quantity;
    }
    public double getTotal(){
        return price * quantity;
    }

}
