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
                        .bind("user_name", user.getUserName())
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
        SELECT
            User_Id     AS userId,
            User_Name   AS userName,
            Email       AS email,
            Phone       AS phone,
            Password    AS password,
            Create_At   AS createAt,
            Role        AS role
        FROM user
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
    // cập nhật thông tin cá nhân
    public boolean updateProfile(User user) {

        String sql = """
        UPDATE user
        SET
            User_Name = :user_name,
            Phone = :phone
        WHERE User_Id = :user_id
    """;

        int rows = getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("user_name", user.getUserName())
                        .bind("phone", user.getPhone())
                        .bind("user_id", user.getUserId())
                        .execute()
        );

        return rows > 0;
    }
    public boolean checkPassword(int userId, String oldPassword) {

        String sql = """
        SELECT COUNT(*)
        FROM `user`
        WHERE User_Id = :user_id AND Password = :password
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("user_id", userId)
                        .bind("password", oldPassword)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }
    public boolean updatePassword(int userId, String newPassword) {

        String sql = """
        UPDATE `user`
        SET Password = :password
        WHERE User_Id = :user_id
    """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("password", newPassword)
                        .bind("user_id", userId)
                        .execute()
        ) > 0;
    }
    public int countUsers() {
        String sql = "select count(*) from user";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
    }
}
