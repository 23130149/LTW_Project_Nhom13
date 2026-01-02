package dao;

import model.User;

public class UserDao extends BaseDao {

    // đăng ký
    public void register(User user) {
        String sql = """
            INSERT INTO user (User_Name, Email, Phone, Password, Create_At, Role)
            VALUES (:user_name, :email, :phone, :password, NOW(), :role)
        """;

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("user_name", user.getUser_name())
                        .bind("email", user.getEmail())
                        .bind("phone", user.getPhone())
                        .bind("password", user.getPassword())
                        .bind("role", user.getRole())
                        .execute()
        );
    }

    // đăng nhập
    public User login(String email, String password) {
        String sql = """
            SELECT * FROM user
            WHERE Email = :email AND Password = :password
        """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .bind("password", password)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // check email tồn tại
    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(*) FROM user WHERE Email = :email";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }
}
