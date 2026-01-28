package model;

public class Setting {
    private String shopName;
    private String email;
    private String phone;
    private String website;
    private String address;

    public Setting(String shopName, String email, String website, String phone, String address) {
        this.shopName = shopName;
        this.email = email;
        this.website = website;
        this.phone = phone;
        this.address = address;
    }

    public Setting() {
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
