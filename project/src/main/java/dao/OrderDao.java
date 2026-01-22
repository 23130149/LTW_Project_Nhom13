package dao;

import model.Order;
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

    public Order getOrderByIdAndUser(int orderId, int userId) {
        return null;
    }

    public boolean hasUserPurchasedProduct(int userId, int productId) {
        return false;
    }
}
