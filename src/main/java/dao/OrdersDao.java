package dao;

import domain.Order;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrdersDao extends AbstractDao<Order, Integer> {

    @Override
    protected String getByKeyQuery() {
        return "SELECT * FROM orders WHERE id=?";
    }

    @Override
    protected String getCreateQuery() {
        return "{CALL new_order(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    }

    @Override
    protected void fillCallableStatement(CallableStatement cs, Order obj) throws DaoException {

        try {

            cs.setString(1, obj.getDateRequested());
            cs.setString(2, obj.getPerson());
            cs.setString(3, obj.getItem());
            cs.setString(4, obj.getAmount());
            cs.setString(5, obj.getCompany());
            cs.setString(6, obj.getCatalog());
            cs.setBoolean(7, obj.getOrdered());
            cs.setString(8, obj.getDateRequested());
            cs.setBoolean(9, obj.getDelivered());
            cs.setString(10, obj.getDateRequested());
            cs.setString(11, obj.getUrl());


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected String getSelectQuery() {
        return "SELECT * FROM orders";
    }

    @Override
    protected String getDeleteQuery() {
        return "{CALL delete_order(?)}";
    }

    @Override
    protected void fillDeleteStatement(CallableStatement cs, Order obj) throws DaoException {

        try {
            cs.setInt(1, obj.getId());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    protected String getSelectFilteredQuery() {
        return "SELECT * FROM orders WHERE id=";
    }


    @Override
    protected void fillPreparedStatement(PreparedStatement ps, Order obj) throws DaoException {

    }

    @Override
    public void update(Order obj1, Order obj2) throws DaoException {

    }

    @Override
    protected List<Order> parseResultsSet(ResultSet rs) throws DaoException {
        List<Order> list = new ArrayList<>();

        try {
            while (rs.next()) {

                Order order = new Order();
                order.setId(rs.getInt("id"));
                String dateReq = (rs.getString("date_requested"));
                order.setDateRequested(dateReq.substring(0, Math.min(dateReq.length(), 10)));
                order.setPerson(rs.getString("person"));
                order.setItem(rs.getString("item"));
                order.setAmount(rs.getString("amount"));
                order.setCompany(rs.getString("company"));
                order.setCatalog(rs.getString("cat_nr"));
                order.setOrdered(rs.getBoolean("is_ordered"));
                order.setDelivered(rs.getBoolean("is_delivered"));
                order.setUrl(rs.getString("url"));

                list.add(order);
            }
        } catch (SQLException e) {
            throw new DaoException(e);
        }
        Collections.reverse(list);
        return list;
    }

}
