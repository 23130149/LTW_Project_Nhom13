package dao;

import model.Review;

import java.util.List;

public class ReviewDao extends BaseDao {
    public List<Review> getReviewsByProductId(int product_id) {
        String sql = "select r.review_id, r.rating, r.comment, r.product_id, r.user_id, u.username from reviews r join user u on r.user_id = u.user_id where r.product_id = :product_id order by r.create_at desc";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("product_id", product_id)
                        .map((rs, ctx) -> {
                            Review r = new Review();
                            r.setReview_id(rs.getInt("review_id"));
                            r.setRating(rs.getDouble("rating"));
                            r.setComment(rs.getString("comment"));
                            r.setCreatAt(rs.getTimestamp("create_at"));
                            r.setProduct_id(rs.getInt("product_id"));
                            r.setUser_id(rs.getInt("user_id"));
                            r.setUser_name(rs.getString("username"));
                            return r;
                        })
                        .list()
        );
    }

    public static void main(String[] args) {
        ReviewDao rdao = new ReviewDao();
        rdao.getReviewsByProductId(1).forEach(System.out::println);
    }
}