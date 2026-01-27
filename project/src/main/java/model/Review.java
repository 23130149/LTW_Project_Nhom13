package model;
import java.time.LocalDateTime;
import java.util.Date;

public class Review {
    private int review_id;
    private double rating;
    private String comment;
    private LocalDateTime creatAt;
    private int product_id;
    private int user_id;
    private String user_name;
    private String formattedDate;
    private String status;
    private String shopReply;
    private int likeCount;
    @Override
    public String toString() {
        return "Review{" +
                "review_id=" + review_id +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", creatAt=" + creatAt +
                ", product_id=" + product_id +
                ", user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", formattedDate='" + formattedDate + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(LocalDateTime creatAt) {
        this.creatAt = creatAt;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getShopReply() {
        return shopReply;
    }

    public void setShopReply(String shopReply) {
        this.shopReply = shopReply;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }
}
