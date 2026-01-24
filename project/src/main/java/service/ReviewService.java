package service;

import dao.OrderDao;
import dao.ReviewDao;

public class ReviewService {

    private ReviewDao reviewDao = new ReviewDao();
    private OrderDao orderDao = new OrderDao();

    public void addReview(int userId, int productId, double rating, String comment) {

        if (!orderDao.hasUserPurchasedProduct(userId, productId)) {
            throw new RuntimeException("User has not purchased product");
        }

        if (reviewDao.hasReviewed(userId, productId)) {
            throw new RuntimeException("User already reviewed this product");
        }

        reviewDao.insertReview(userId, productId, rating, comment);
    }
}