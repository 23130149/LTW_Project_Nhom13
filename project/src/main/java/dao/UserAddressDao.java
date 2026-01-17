package dao;

import model.UserAddress;

public class UserAddressDao extends BaseDao {

    // lấy địa chỉ theo user
    public UserAddress findByUserId(int userId) {

        String sql = """
            SELECT
                User_Address_Id AS userAddressId,
                User_Id AS userId,
                Country AS country,
                Province AS province,
                District AS district,
                Street AS street
            FROM user_address
            WHERE User_Id = :user_id
        """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("user_id", userId)
                        .mapToBean(UserAddress.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // thêm mới
    public void insert(UserAddress address) {

        String sql = """
            INSERT INTO user_address
            (User_Id, Country, Province, District, Street)
            VALUES (:user_id, :country, :province, :district, :street)
        """;

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("user_id", address.getUserId())
                        .bind("country", address.getCountry())
                        .bind("province", address.getProvince())
                        .bind("district", address.getDistrict())
                        .bind("street", address.getStreet())
                        .execute()
        );
    }

    // cập nhật
    public void update(UserAddress address) {

        String sql = """
            UPDATE user_address
            SET
                Country = :country,
                Province = :province,
                District = :district,
                Street = :street
            WHERE User_Id = :user_id
        """;

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("country", address.getCountry())
                        .bind("province", address.getProvince())
                        .bind("district", address.getDistrict())
                        .bind("street", address.getStreet())
                        .bind("user_id", address.getUserId())
                        .execute()
        );
    }
}
