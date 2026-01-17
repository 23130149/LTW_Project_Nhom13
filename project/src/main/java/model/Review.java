package model;

import java.util.Date;

public class Review {
    private int reviewId;
    private int rating;
    private String comment;
    private Date createAt;
    private int productId;
    private int userId;
    private String userName;

    public Review(int reviewId, int rating, String comment, Date createAt, int productId, int userId, String userName) {
        this.reviewId = reviewId;
        this.rating = rating;
        this.comment = comment;
        this.createAt = createAt;
        this.productId = productId;
        this.userId = userId;
        this.userName = userName;
    }

    public Review() {
    }

    @Override
    public String toString() {
        return "Review{" +
                "reviewId=" + reviewId +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", creatAt=" + createAt +
                ", productId=" + productId +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                '}';
    }

    public int getReviewId() {
        return reviewId;
    }
    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
    public Date getCreatedAt() {
        return createAt;
    }
    public void setCreatedAt(Date creatAt) {
        this.createAt = creatAt;
    }
    public int getProductId() {
        return productId;
    }
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
}
