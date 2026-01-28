package service;

import dao.UserDao;
import model.User;
import util.PasswordUtil;

public class UserService {

    private UserDao userDao = new UserDao();

    public User login(String email, String plainPassword) {

        User user = userDao.findByEmail(email);

        if (user == null || user.getPassword() == null) {
            return null;
        }

        if (!PasswordUtil.verify(plainPassword, user.getPassword())) {
            return null;
        }

        return user;
    }
}
