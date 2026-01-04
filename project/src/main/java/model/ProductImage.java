package model;

public class ProductImage {
    private Integer image_id;
    private Integer product_id;
    private String image_url;

    public ProductImage() {
    }

    public ProductImage(Integer product_id, Integer image_id, String image_url) {
        this.product_id = product_id;
        this.image_id = image_id;
        this.image_url = image_url;
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "image_id=" + image_id +
                ", product_id=" + product_id +
                ", image_url='" + image_url + '\'' +
                '}';
    }

    public Integer getImage_id() {
        return image_id;
    }

    public void setImage_id(Integer image_id) {
        this.image_id = image_id;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}
