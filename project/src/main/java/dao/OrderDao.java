package dao;

import model.Order;
import model.Product;

import java.util.List;

public class OrderDao extends BaseDao {


    public List<Order> getOrdersByUserId(int userId) {

        String sql = """
            SELECT
                o.Order_Id        AS orderId,
                o.User_Id         AS userId,
                o.User_Address_Id AS userAddressId,
                o.Order_Code      AS orderCode,
                o.Total_Price     AS totalPrice,
                o.Status          AS status,
                o.Create_At       AS createAt,
                o.Note            AS note,
                o.Ship_Address    AS shipAddress
            FROM orders o
            WHERE o.User_Id = :userId
              AND o.Status <> 'PROCESSING'
            ORDER BY o.Create_At DESC
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("userId", userId)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    // Lấy chi tiết 1 đơn hàng của user (OrderDetail)
    public Order getOrderByIdAndUser(int orderId, int userId) {

        String sql = """
            SELECT
                o.Order_Id        AS orderId,
                o.User_Id         AS userId,
                o.User_Address_Id AS userAddressId,
                o.Order_Code      AS orderCode,
                o.Total_Price     AS totalPrice,
                o.Status          AS status,
                o.Create_At       AS createAt,
                o.Note            AS note,
                o.Ship_Address    AS shipAddress
            FROM orders o
            WHERE o.Order_Id = :orderId
              AND o.User_Id = :userId
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


    public void insert(Order order) {

        String sql = """
            INSERT INTO orders (
                User_Id,
                User_Address_Id,
                Ship_Address,
                Note,
                Status,
                Create_At,
                Total_Price,
                Order_Code
            )
            VALUES (
                :userId,
                :userAddressId,
                :shipAddress,
                :note,
                :status,
                NOW(),
                :totalPrice,
                :orderCode
            )
        """;

        getJdbi().withHandle(h ->
                h.createUpdate(sql)
                        .bindBean(order)
                        .execute()
        );
    }

    // Insert và trả về Order_Id (Payment)
    public int insertAndReturnId(Order order) {

        String sql = """
            INSERT INTO orders (
                User_Id,
                User_Address_Id,
                Ship_Address,
                Note,
                Status,
                Create_At,
                Total_Price,
                Order_Code
            )
            VALUES (
                :userId,
                :userAddressId,
                :shipAddress,
                :note,
                :status,
                NOW(),
                :totalPrice,
                :orderCode
            )
        """;

        return getJdbi().withHandle(h ->
                h.createUpdate(sql)
                        .bindBean(order)
                        .executeAndReturnGeneratedKeys("Order_Id")
                        .mapTo(Integer.class)
                        .one()
        );
    }


    public int countOrders() {
        String sql = "SELECT COUNT(*) FROM orders";
        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public void updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET Status = :status WHERE Order_Id = :id";

        getJdbi().withHandle(h ->
                h.createUpdate(sql)
                        .bind("status", status)
                        .bind("id", orderId)
                        .execute()
        );
    }

    // Danh sách đơn mới (dashboard)
    public List<Order> getLatestOrders(int limit) {

        String sql = """
            SELECT
                o.Order_Id        AS orderId,
                o.Order_Code      AS orderCode,
                u.User_Name       AS userName,
                COUNT(oi.Product_Id) AS totalQuantity,
                o.Total_Price     AS totalPrice,
                o.Create_At       AS createAt,
                o.Status          AS status
            FROM orders o
            JOIN user u ON o.User_Id = u.User_Id
            JOIN order_items oi ON o.Order_Id = oi.Order_Id
            GROUP BY
                o.Order_Id, o.Order_Code, u.User_Name,
                o.Total_Price, o.Create_At, o.Status
            ORDER BY o.Create_At DESC
            LIMIT :limit
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public List<Order> getAllOrders() {

        String sql = """
            SELECT
                o.Order_Id        AS orderId,
                o.Order_Code      AS orderCode,
                u.User_Name       AS userName,
                COUNT(oi.Product_Id) AS totalQuantity,
                o.Total_Price     AS totalPrice,
                o.Create_At       AS createAt,
                o.Status          AS status
            FROM orders o
            JOIN user u ON o.User_Id = u.User_Id
            JOIN order_items oi ON o.Order_Id = oi.Order_Id
            GROUP BY
                o.Order_Id, o.Order_Code, u.User_Name,
                o.Total_Price, o.Create_At, o.Status
            ORDER BY o.Create_At DESC
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public List<Order> getOrdersByStatus(String status) {

        String sql = """
            SELECT
                o.Order_Id        AS orderId,
                o.Order_Code      AS orderCode,
                u.User_Name       AS userName,
                COUNT(oi.Product_Id) AS totalQuantity,
                o.Total_Price     AS totalPrice,
                o.Create_At       AS createAt,
                o.Status          AS status
            FROM orders o
            JOIN user u ON o.User_Id = u.User_Id
            JOIN order_items oi ON o.Order_Id = oi.Order_Id
            WHERE o.Status = :status
            GROUP BY
                o.Order_Id, o.Order_Code, u.User_Name,
                o.Total_Price, o.Create_At, o.Status
            ORDER BY o.Create_At DESC
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("status", status)
                        .mapToBean(Order.class)
                        .list()
        );
    }


    public boolean hasUserPurchasedProduct(int userId, int productId) {

        String sql = """
            SELECT COUNT(*)
            FROM orders o
            JOIN order_items oi ON o.Order_Id = oi.Order_Id
            WHERE o.User_Id = :userId
              AND oi.Product_Id = :productId
              AND o.Status IN ('CONFIRMED','SHIPPED','COMPLETED')
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }


    public List<Product> getTopProducts(int limit) {

        String sql = """
            SELECT
                p.Product_Id   AS productId,
                p.Product_Name AS productName,
                p.Product_Price AS productPrice,
                SUM(oi.Quantity) AS sold,
                SUM(oi.Quantity * p.Product_Price) AS revenue
            FROM order_items oi
            JOIN orders o ON oi.Order_Id = o.Order_Id
            JOIN products p ON oi.Product_Id = p.Product_Id
            WHERE o.Status = 'Hoàn thành'
            GROUP BY p.Product_Id, p.Product_Name, p.Product_Price
            ORDER BY sold DESC
            LIMIT :limit
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("limit", limit)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public double getTotalRevenue() {

        String sql = """
            SELECT COALESCE(SUM(Total_Price), 0)
            FROM orders
            WHERE Status = 'Hoàn thành'
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapTo(Double.class)
                        .one()
        );
    }
}
