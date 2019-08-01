package dao;

import domain.User;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends AbstractDao<User, String> {


    @Override
    public void update(User obj1, User obj2) throws DaoException {
    }

    @Override
    protected String getByKeyQuery() {
        return "SELECT * FROM users WHERE login=?";
    }

    @Override
    protected String getCreateQuery() {
        return "{CALL add_user(?, ?, ?, ?, ?)}";
    }

    @Override
    protected String getDeleteQuery() {
        return "{CALL delete_user(?)}";
    }

    @Override
    protected void fillCallableStatement(CallableStatement cs, User obj) throws DaoException {
        try {
            cs.setString(4, obj.getLogin());
            cs.setString(5, obj.getPassword());


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void fillDeleteStatement(CallableStatement cs, User obj) throws DaoException {
        try {
            cs.setInt(1, obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected String getSelectQuery() {
        return "SELECT * FROM users";
    }

    @Override
    protected String getSelectFilteredQuery() {
        return "SELECT * FROM users WHERE id=";
    }

    @Override
    protected void fillPreparedStatement(PreparedStatement ps, User obj) throws DaoException {

    }

    @Override
    protected List<User> parseResultsSet(ResultSet rs) throws DaoException {
        List<User> list = new ArrayList<>();

        try {
            while (rs.next()) {

                User user = new User();
                user.setId(rs.getInt("id"));
                user.setLogin(rs.getString("login"));
                user.setPassword(rs.getString("password"));

                list.add(user);
            }
        } catch (SQLException e) {
            throw new DaoException(e);
        }
        return list;
    }

    //TODO add getByLogin


}
