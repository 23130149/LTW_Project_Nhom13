package model;

public class Category {
    private Integer category_id;
    private String name;
    private String image_url;


    public Category() {
    }

    public Category(Integer category_id, String name, String image_url) {
        this.category_id = category_id;
        this.name = name;
        this.image_url= image_url;
    }

    @Override
    public String toString() {
        return "Category{" +
                "category_id=" + category_id +
                ", name='" + name + '\'' +
                ", imageUrl='" + image_url + '\'' +
                '}';
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}
