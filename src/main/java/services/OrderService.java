package services;

import dao.AntibodyDao;
import dao.DaoException;
import dao.OrdersDao;
import domain.Antibody;
import domain.Order;

import java.util.List;

public class OrderService {
    private OrdersDao ordersDao = new OrdersDao();


    public List<Order> getAllOrders() {
        List<Order> orderList = null;
        try {
            orderList = ordersDao.getAll();
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    public void deleteOrder(Order order) {
        try {
            ordersDao.delete(order);
        } catch (DaoException e) {
            e.printStackTrace();
        }
    }

    public Order createOrder(Order order) {
        try {
            ordersDao.create(order);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        return order;
    }
}
