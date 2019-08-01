package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractDao<T, K> implements Dao<T, K> {


    protected abstract String getByKeyQuery();

    protected abstract String getCreateQuery();

    protected abstract String getDeleteQuery();

    protected abstract void fillDeleteStatement(CallableStatement cs, T obj) throws DaoException;

    protected abstract String getSelectQuery();

    protected abstract String getSelectFilteredQuery();

    protected abstract void fillPreparedStatement(PreparedStatement ps, T obj) throws DaoException;

    protected abstract List<T> parseResultsSet(ResultSet rs) throws DaoException;

    protected abstract void fillCallableStatement(CallableStatement cs, T obj) throws DaoException;

    @Override
    public T create(T obj) throws DaoException {
        Connection con = JdbcUtil.getConnection();
        String query = getCreateQuery();
        T fetchedObject = null;


        try {
            CallableStatement cs = con.prepareCall(query);
            fillCallableStatement(cs, obj);

            cs.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        query = getSelectFilteredQuery() + "LAST_INSERT_ID();";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            List<T> list = parseResultsSet(rs);

            if ((list == null) || (list.size() != 1)) {
                throw new DaoException("Problem with fetching created object");
            } else {
                fetchedObject = list.iterator().next();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        return fetchedObject;
    }

    @Override
    public T read(K key) throws DaoException {
        T someObject = null;

        Connection con = JdbcUtil.getConnection();
        String query = getByKeyQuery();
        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setObject(1, key);

            List<T> list = parseResultsSet(ps.executeQuery());
            if (list.size() != 1) {
                throw new DaoException("Duplicate entry or no entry");
            }
            someObject = list.get(0);


        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return someObject;
    }


    @Override
    public void delete(T obj) throws DaoException {
        Connection con = JdbcUtil.getConnection();
        String query = getDeleteQuery();

        try (CallableStatement cs = con.prepareCall(query)) {
            fillDeleteStatement(cs, obj);
            cs.executeQuery();

            System.out.println("Deleted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Unable to delete");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }


    @Override

    public List<T> getAll() throws DaoException {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        List<T> list = new ArrayList<>();


        String query = getSelectQuery();

        try {
            con = JdbcUtil.getConnection();
            st = con.createStatement();
            rs = st.executeQuery(query);
            list = parseResultsSet(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }
}

