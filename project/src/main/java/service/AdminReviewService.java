package service;

import dao.ReviewDao;
import model.Review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminReviewService {

    private ReviewDao reviewDao = new ReviewDao();

    public List<Review> getAllReviews() {
        return reviewDao.getAllReviews();
    }

    public List<Review> filterByStar(int star) {
        return reviewDao.getReviewsByRating(star);
    }

    public void approve(int reviewId) {
        reviewDao.updateStatus(reviewId, "APPROVED");
    }

    public void hide(int reviewId) {
        reviewDao.updateStatus(reviewId, "HIDDEN");
    }
    public void reply(int reviewId, String reply) {
        reviewDao.saveReply(reviewId, reply);
    }
    public Map<String, Object> getReviewSummary() {
        Map<String, Object> map = new HashMap<>();

        int total = reviewDao.countAllReviews();
        int pending = reviewDao.countPendingReviews();
        double avg = reviewDao.getAverageRating();
        int fiveStar = reviewDao.countFiveStarReviews();

        double percentFiveStar = total == 0 ? 0 : (fiveStar * 100.0 / total);

        map.put("total", total);
        map.put("avg", Math.round(avg * 10.0) / 10.0); // 4.6
        map.put("pending", pending);
        map.put("fiveStarPercent", Math.round(percentFiveStar));

        return map;
    }
    public Map<Integer, Integer> getRatingSummaryMap() {
        Map<Integer, Integer> raw = reviewDao.getRatingDistribution();
        Map<Integer, Integer> result = new HashMap<>();

        for (int i = 1; i <= 5; i++) {
            result.put(i, raw.getOrDefault(i, 0));
        }

        return result;
    }


}
