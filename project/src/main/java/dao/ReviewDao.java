package dao;

import model.Review;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ReviewDao extends BaseDao {
    public List<Review> getReviewsByProductId(int productId) {
        String sql = "select r.review_id as reviewId, r.rating as rating, r.comment as comment, r.product_id as productId, r.user_id as userId, u.username as userName from reviews r join user u on r.user_id = u.user_id where r.product_id = :product_id order by r.create_at desc";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .mapToBean(Review.class)
                        .list()
        );
    }
    public Map<Double, Integer> getRatingCountByProductId(int productId) {
        String sql = """
        SELECT rating, COUNT(*) AS total
        FROM reviews
        WHERE product_id = :productId
        GROUP BY rating
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("productId", productId)
                        .map((rs, ctx) -> Map.entry(
                                rs.getDouble("rating"),
                                rs.getInt("total")
                        ))
                        .collect(Collectors.toMap(
                                Map.Entry::getKey,
                                Map.Entry::getValue
                        ))
        );
    }

}