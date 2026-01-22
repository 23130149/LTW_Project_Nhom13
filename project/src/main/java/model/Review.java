package model;

import java.util.Date;

public class Review {
    private int review_id;
    private double rating;
    private String comment;
    private Date creatAt;
    private int product_id;
    private int user_id;
    private String user_name;

    public Review(int review_id, double rating, String comment, int product_id, Date creatAt, int user_id, String user_name) {
        this.review_id = review_id;
        this.rating = rating;
        this.comment = comment;
        this.product_id = product_id;
        this.creatAt = creatAt;
        this.user_id = user_id;
        this.user_name = user_name;
    }

    public Review() {
    }

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

    public Date getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(Date creatAt) {
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
}
