package dao;

import java.util.Map;

public class SettingDao extends BaseDao {

    public Map<String, Object> getSettings() {
        String sql = "SELECT shop_name, email, phone, website, address FROM settings WHERE id = 1";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToMap()
                        .findOne()
                        .orElse(null)
        );
    }

    public void updateSettings(String name, String email, String phone, String website, String address) {
        String sql = " UPDATE settings SET shop_name = :name, email = :email, phone = :phone, website = :website, address = :address WHERE id = 1";

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", name)
                        .bind("email", email)
                        .bind("phone", phone)
                        .bind("website", website)
                        .bind("address", address)
                        .execute()
        );
    }
}