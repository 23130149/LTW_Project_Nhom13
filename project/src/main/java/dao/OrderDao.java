package dao;

import model.Order;
import model.Product;

import java.util.List;

public class OrderDao extends BaseDao {

    public List<Order> getOrdersByUserId(int userId) {

        String sql = """
            SELECT
                Order_Id        AS orderId,
                User_Id         AS userId,
                Create_At       AS createAt,
                Total_Price     AS totalPrice,
                Status          AS status,
                Payment_Status  AS paymentStatus,
                Order_Code      AS orderCode,
                Note            AS note
            FROM orders
            WHERE User_Id = :userId
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
            Payment_Method_Id,
            Note,
            Status,
            Create_At,
            Total_Price,
            Payment_Status,
            Order_Code
        ) VALUES (
            :userId,
            :userAddressId,
            :paymentMethodId,
            :note,
            :status,
            NOW(),
            :totalPrice,
            :paymentStatus,
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
            Payment_Method_Id   AS paymentMethodId,
            Note                AS note,
            Status              AS status,
            Create_At           AS createAt,
            Total_Price         AS totalPrice,
            Payment_Status      AS paymentStatus,
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
        String sql = "select  o.Order_Id as orderId,o.User_Id as userId, o.User_Address_Id as userAddressId, o.Payment_Method_Id as paymentMethodId, o.Create_At as createAt, o.Status as status, o.Payment_Status as paymentStatus, o.Order_Code as orderCode, o.Note as note, o.Total_Price as totalPrice, u.user_name as userName, p.Product_Name  as productName, oi.Quantity as quantity from orders o  join user u ON o.user_id = u.user_id join order_items oi ON o.order_id = oi.order_id join products p ON oi.product_id = p.product_id order by o.Create_At desc limit :limit";
        String sql = "select  o.Order_Id as orderId,o.User_Id as userId, o.User_Address_Id as userAddressId, o.Payment_Method_Id as paymentMethodId, o.Create_At as createAt, o.Status as status, o.Payment_Status as paymentStatus, o.Order_Code as orderCode, o.Note as note, o.Total_Price as totalPrice from orders o order by o.Create_At desc limit :limit";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Order.class)
                        .list()
        );
    }
    public List<Product> getTopProducts(int limit) {
        String sql = "select p.product_id as productId, p.product_name as productName, p.product_price as productPrice, sum(oi.quantity) as sold, sum(oi.quantity*p.product_price) as revenue from order_items oi join orders o on oi.order_id = o.order_id join products p on oi.product_id = p.product_id where o.status = 'Hoàn thành' group by p.product_id, p.product_name, p.product_price order by sold desc limit :limit";
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
    public Order getOrderByIdAndUser(int orderId, int userId) {
        return null;
    }

    public boolean hasUserPurchasedProduct(int userId, int productId) {
        return false;
    }
}
