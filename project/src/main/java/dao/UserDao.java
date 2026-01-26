package dao;

import model.User;

import java.util.List;

public class UserDao extends BaseDao {

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

    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(*) FROM user WHERE Email = :email";

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }

    public User findByEmail(String email) {
        String sql = """
            SELECT
                User_Id     AS userId,
                User_Name   AS userName,
                Email       AS email,
                Phone       AS phone,
                Password    AS password,
                Google_Id   AS googleId,
                Create_At   AS createAt,
                Role        AS role
            FROM user
            WHERE Email = :email
        """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }

    public boolean updateProfile(User user) {
        String sql = """
            UPDATE user
            SET User_Name = :user_name,
                Phone = :phone
            WHERE User_Id = :user_id
        """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("user_name", user.getUserName())
                        .bind("phone", user.getPhone())
                        .bind("user_id", user.getUserId())
                        .execute()
        ) > 0;
    }

    public boolean updatePassword(int userId, String hashedPassword) {
        String sql = """
            UPDATE user
            SET Password = :password
            WHERE User_Id = :user_id
              AND Google_Id IS NULL
        """;

        return getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("password", hashedPassword)
                        .bind("user_id", userId)
                        .execute()
        ) > 0;
    }

    public int countUsers() {
        String sql = "SELECT COUNT(*) FROM user";
        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public void insertGoogleUser(String email, String googleId) {
        String sql = """
            INSERT INTO user (Email, Google_Id, Role, Create_At)
            VALUES (:email, :google_id, 'USER', NOW())
        """;

        getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("email", email)
                        .bind("google_id", googleId)
                        .execute()
        );
    }

    public User getAdmin() {
        String sql = """
            SELECT
                User_Id   AS userId,
                User_Name AS userName,
                Email     AS email,
                Phone     AS phone,
                Password  AS password,
                Create_At AS createAt,
                Role      AS role
            FROM user
            WHERE Role = :role
            LIMIT 1
        """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("role", "ADMIN")
                        .mapToBean(User.class)
                        .findOne()
                        .orElse(null)
        );
    }
    public List<User> getAllUsers() {
        String sql = """
        SELECT
            User_Id   AS userId,
            User_Name AS userName,
            Email     AS email,
            Phone     AS phone,
            Password  AS password,
            Google_Id AS googleId,
            Role      AS role
        FROM user
        WHERE Password IS NOT NULL
    """;

        return getJdbi().withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(User.class)
                        .list()
        );
    }

}
