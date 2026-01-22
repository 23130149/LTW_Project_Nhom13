package dao;

import model.Review;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ReviewDao extends BaseDao {
    public List<Review> getReviewsByProductId(int product_id) {
        String sql = "select r.review_id, r.rating, r.comment, r.product_id, r.create_at, r.user_id, u.user_name from reviews r join user u on r.user_id = u.user_id where r.product_id = :product_id order by r.create_at desc";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("product_id", product_id)
                        .map((rs, ctx) -> {
                            Review r = new Review();
                            r.setReviewId(rs.getInt("review_id"));
                            r.setRating(rs.getDouble("rating")); //
                            r.setComment(rs.getString("comment"));
                            r.setCreatedAt(rs.getTimestamp("create_at")); // FIX
                            r.setProductId(rs.getInt("product_id"));
                            r.setUserId(rs.getInt("user_id"));
                            r.setUserName(rs.getString("user_name")); // FIX
                            return r;
                        })
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


    public static void main(String[] args) {
        ReviewDao rdao = new ReviewDao();
        rdao.getReviewsByProductId(1).forEach(System.out::println);
    }
}