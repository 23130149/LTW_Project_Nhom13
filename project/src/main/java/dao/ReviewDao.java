package dao;

import model.Review;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ReviewDao extends BaseDao {

    public List<Review> getReviewsByProductId(int productId) {

        String sql = """
        SELECT
                                                 r.Review_Id   AS review_id,
                                                 r.Rating      AS rating,
                                                 r.Comment     AS comment,
                                                 r.Create_At   AS creatAt,
                                                 r.Product_Id  AS product_id,
                                                 r.User_Id     AS user_id,
                                                 COALESCE(u.User_Name, 'Người dùng') AS user_name
                                             FROM reviews r
                                             LEFT JOIN user u ON r.User_Id = u.User_Id
                                             WHERE r.Product_Id = :productId
                                             ORDER BY r.Create_At DESC
                
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(Review.class)
                        .list()
        );
    }


    public Map<Double, Integer> getRatingCountByProductId(int productId) {

        String sql = """
            SELECT Rating, COUNT(*) AS total
            FROM reviews
            WHERE Product_Id = :productId
            GROUP BY Rating
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .map((rs, ctx) ->
                                Map.entry(rs.getDouble("Rating"), rs.getInt("total"))
                        )
                        .collect(Collectors.toMap(
                                Map.Entry::getKey,
                                Map.Entry::getValue
                        ))
        );
    }

    public double getAverageRating(int productId) {

        String sql = """
            SELECT COALESCE(AVG(Rating), 0)
            FROM reviews
            WHERE Product_Id = :productId
        """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("productId", productId)
                        .mapTo(double.class)
                        .one()
        );
    }

    public void insertReview(int userId, int productId, double rating, String comment) {

        String sql = """
            INSERT INTO reviews (Rating, Comment, Create_At, Product_Id, User_Id)
            VALUES (:rating, :comment, NOW(), :productId, :userId)
        """;

        getJdbi().withHandle(h ->
                h.createUpdate(sql)
                        .bind("rating", rating)
                        .bind("comment", comment)
                        .bind("productId", productId)
                        .bind("userId", userId)
                        .execute()
        );
    }
    public boolean hasReviewed(int userId, int productId) {

        String sql = """
        SELECT COUNT(*)
        FROM reviews
        WHERE User_Id = :userId
          AND Product_Id = :productId
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("userId", userId)
                        .bind("productId", productId)
                        .mapTo(int.class)
                        .one() > 0
        );
    }
    public List<Review> getAllReviews() {

        String sql = """
        SELECT
            r.Review_Id  AS review_id,
            r.Rating     AS rating,
            r.Comment    AS comment,
            r.Create_At  AS creatAt,
            r.Product_Id AS product_id,
            r.User_Id    AS user_id,
            r.Status     AS status,
            r.Shop_Reply AS shopReply,
            COALESCE(u.User_Name, 'Người dùng') AS user_name
        FROM reviews r
        LEFT JOIN user u ON r.User_Id = u.User_Id
        ORDER BY r.Create_At DESC
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapToBean(Review.class)
                        .list()
        );
    }

    public List<Review> getReviewsByRating(int rating) {

        String sql = """
        SELECT
            r.Review_Id  AS review_id,
            r.Rating     AS rating,
            r.Comment    AS comment,
            r.Create_At  AS creatAt,
            r.Product_Id AS product_id,
            r.User_Id    AS user_id,
            r.Status     AS status,
            COALESCE(u.User_Name,'Người dùng') AS user_name
        FROM reviews r
        LEFT JOIN user u ON r.User_Id = u.User_Id
                WHERE ROUND(r.Rating) = :rating
                                      ORDER BY r.Create_At DESC
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .bind("rating", rating)
                        .mapToBean(Review.class)
                        .list()
        );
    }


    public void updateStatus(int reviewId, String status) {
        String sql = "UPDATE reviews SET Status = :status WHERE Review_Id = :id";

        getJdbi().useHandle(h ->
                h.createUpdate(sql)
                        .bind("status", status)
                        .bind("id", reviewId)
                        .execute()
        );
    }
    public void saveReply(int reviewId, String reply) {

        String sql = """
        UPDATE reviews
        SET Shop_Reply = :reply
        WHERE Review_Id = :id
    """;

        getJdbi().useHandle(h ->
                h.createUpdate(sql)
                        .bind("reply", reply)
                        .bind("id", reviewId)
                        .execute()
        );
    }
    public Map<Integer, Integer> getRatingDistribution() {

        String sql = """
        SELECT ROUND(Rating) AS star, COUNT(*) AS total
                                         FROM reviews
                                         WHERE Status = 'APPROVED'
                                         GROUP BY ROUND(Rating)
                                         
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .map((rs, ctx) ->
                                Map.entry(
                                        rs.getInt("star"),
                                        rs.getInt("total")
                                )
                        )
                        .collect(Collectors.toMap(
                                Map.Entry::getKey,
                                Map.Entry::getValue
                        ))
        );
    }


    public int countAllReviews() {
        String sql = "SELECT COUNT(*) FROM reviews WHERE Status = 'APPROVED'\n";
        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapTo(int.class)
                        .one()
        );
    }
    public int countPendingReviews() {
        String sql = """
        SELECT COUNT(*)
        FROM reviews
        WHERE Status IS NULL OR Status = 'PENDING'
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapTo(int.class)
                        .one()
        );
    }
    public double getAverageRating() {
        String sql = "SELECT COALESCE(AVG(Rating),0)\n" +
                "FROM reviews\n" +
                "WHERE Status = 'APPROVED'\n";

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapTo(double.class)
                        .one()
        );
    }
    public int countFiveStarReviews() {
        String sql = """
        SELECT COUNT(*)
                               FROM reviews
                               WHERE Status = 'APPROVED'
                AND ROUND(Rating) = 5
                                                                                  
    """;

        return getJdbi().withHandle(h ->
                h.createQuery(sql)
                        .mapTo(int.class)
                        .one()
        );
    }



}
