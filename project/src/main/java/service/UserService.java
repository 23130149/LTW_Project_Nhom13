package service;

import dao.UserDao;
import model.User;

public class UserService {

    private UserDao userDao = new UserDao();

    public User login(String email, String password) {
        return userDao.login(email, password);
    }
}
