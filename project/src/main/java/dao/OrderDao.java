package dao;

import model.Order;
import model.Product;

import java.util.List;

public class OrderDao extends BaseDao {

    public List<Order> getOrdersByUserId(int userId) {

        String sql = """
        SELECT *
        FROM orders
        WHERE User_Id = :userId
          AND Status <> 'PROCESSING'
        ORDER BY Create_At DESC
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .mapToBean(Order.class)
                        .list()
        );
    }


    public void insert(Order order) {

        String sql = """
        INSERT INTO orders (
            User_Id,
            User_Address_Id,
            Note,
            Status,
            Create_At,
            Total_Price,
            Order_Code
        ) VALUES (
            :userId,
            :userAddressId,
            :note,
            :status,
            NOW(),
            :totalPrice,
            :orderCode
        )
    """;

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(order)
                        .execute()
        );
    }
    public List<Order> getRecentOrdersByUser(int userId, int limit) {

        String sql = """
        SELECT
            Order_Id            AS orderId,
            User_Id             AS userId,
            User_Address_Id     AS userAddressId,
            Note                AS note,
            Status              AS status,
            Create_At           AS createAt,
            Total_Price         AS totalPrice,
            Order_Code          AS orderCode
        FROM orders
        WHERE User_Id = :user_id
        ORDER BY Create_At DESC
        LIMIT :limit
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("user_id", userId)
                        .bind("limit", limit)
                        .mapToBean(Order.class)
                        .list()
        );
    }
    public int countOrders() {
        String sql = "select count(*) from orders";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
    }
    public List<Order> getLatestOrders(int limit) {
        String sql = "select  o.Order_Id as orderId,o.User_Id as userId, o.User_Address_Id as userAddressId, o.Payment_Method_Id as paymentMethodId, o.Create_At as createAt, o.Status as status, o.Payment_Status as paymentStatus, o.Order_Code as orderCode, o.Note as note, o.Total_Price as totalPrice from orders o order by o.Create_At desc limit :limit";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Order.class)
                        .list()
        );
    }
    public List<Product> getTopProducts(int limit) {
        String sql = "select p.product_id as productId, p.product_name as productName, p.product_price as productPrice, sum(oi.quantity) as sold, sum(oi.quantity*oi.price) as revenue from order_items oi join products p on oi.product_id = p.product_id group by p.product_id, p.product_name, p.product_price order by sold desc limit :limit";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list() );
    }
    public double getTotalRevenue() {
        String sql = "select coalesce(sum(total_price),0) from orders where status = 'Hoàn thành'";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Double.class)
                        .one()
        );
    }
    public int insertAndReturnId(Order order) {
        String sql = """
        INSERT INTO orders (
            User_Id, User_Address_Id, Note,
            Status, Create_At, Total_Price,
             Order_Code
        )
        VALUES (
            :userId, :userAddressId, :note,
            :status, NOW(), :totalPrice,
             :orderCode
        )
    """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(order)
                        .executeAndReturnGeneratedKeys("Order_Id")
                        .mapTo(Integer.class)
                        .one()
        );
    }
    public Order getOrderByIdAndUser(int orderId, int userId) {

        String sql = """
        SELECT
            Order_Id       AS orderId,
            User_Id        AS userId,
            Create_At      AS createAt,
            Total_Price    AS totalPrice,
            Status         AS status,
            Order_Code     AS orderCode,
            Note           AS note
        FROM orders
        WHERE Order_Id = :orderId
          AND User_Id = :userId
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("orderId", orderId)
                        .bind("userId", userId)
                        .mapToBean(Order.class)
                        .findOne()
                        .orElse(null)
        );
    }


    public boolean hasUserPurchasedProduct(int userId, int productId) {

        String sql = """
        SELECT COUNT(*)
        FROM Orders o
        JOIN Order_Items oi ON o.Order_Id = oi.Order_Id
        WHERE o.User_Id = :userId
          AND oi.Product_Id = :productId
          AND o.Status IN ('CONFIRMED','SHIPPED','COMPLETED')
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .mapTo(int.class)
                        .one() > 0
        );
    }
    public void updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET Status = :status WHERE Order_Id = :id";

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("status", status)
                        .bind("id", orderId)
                        .execute()
        );}


    public List<Order> getAllOrders() {
        String sql = """
        SELECT
            o.Order_Id        AS id,
            o.User_Id         AS userId,
            u.User_Name       AS customerName,
            o.Status          AS status,
            o.Create_At       AS createdAt,
            o.Total_Price     AS totalPrice,
            COUNT(oi.Product_Id) AS totalItems
        FROM orders o
        JOIN user u ON o.User_Id = u.User_Id
        JOIN order_items oi ON oi.Order_Id = o.Order_Id
        GROUP BY
            o.Order_Id, o.User_Id, u.User_Name,
            o.Status, 
            o.Create_At, o.Total_Price
        ORDER BY o.Create_At DESC
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Order.class)
                        .list()
        );
    }
}
