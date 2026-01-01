package cart;

import model.Product;

import java.io.Serializable;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart implements Serializable {
    Map<Integer,CartItem> data;
    public  Cart(){
        data = new HashMap<>();
    }
    public void addProduct(Product p, int quantity){
        if (data.containsKey(p.getProduct_id())) data.get(p.getProduct_id()).upQuantity(quantity);
        else data.put(p.getProduct_id(), new CartItem(p,p.getProduct_price(),quantity));
    }
    public CartItem deleteProduct(int id){
        return data.remove(id);
    }
    public List<CartItem> removeAllProducts(){
      Collection<CartItem> values = data.values();
        data.clear();
        return  new ArrayList<>(values);
    }
    public List<CartItem> getList(){
        return new ArrayList<>(data.values());
    }
    public int getTotalQuantity(){
        AtomicInteger total = new AtomicInteger();
        data.values().stream().forEach(p -> total.addAndGet(p.getQuantity()));
        return total.get();
    }

    public double getTotalPrice(){
        AtomicReference<Double> total = new AtomicReference<>((double) 0);
        data.values().forEach(p -> total.updateAndGet(v ->  (v + p.getQuantity() * p.getPrice())));
    return total.get();
    }
    public boolean update(int id, Product p){
        //
        return true;
    }
}
