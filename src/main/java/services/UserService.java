package services;

import dao.DaoException;
import dao.UserDao;
import domain.User;

import java.util.List;

public class UserService {
    private UserDao ud = new UserDao();


    public boolean signUp(String ps, String lg) {
        try {
            User someUser = ud.create(new User(ps, lg));
            if (someUser.getId() != 0) {
                return true;
            }
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User signIn(String login, String pass) {
        try {
            User someUser = ud.read(login);
            if (someUser != null) {
                if (pass.equals(someUser.getPassword())) {
                    System.out.println("Welcome " + someUser.toString());
                    return someUser;
                }
            }

        } catch (DaoException e) {
            e.printStackTrace();
        }
        System.out.println("Incorect login or password");
        return null;
    }

    public List<User> getAllUsers() {
        List<User> list = null;
        try {
            list = ud.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteUser(User user) {
        try {
            ud.delete(user);
        } catch (DaoException e) {
            e.printStackTrace();
        }
    }

    public User getUserByID(String id) {

        User user = null;
        try {
            user = ud.read(id);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return user;
    }
}
