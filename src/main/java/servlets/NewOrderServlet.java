package servlets;

import dao.AntibodyDao;
import dao.DaoException;
import dao.OrdersDao;
import domain.Antibody;
import domain.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "NewOrderServlet", urlPatterns = {"/neworder"})

public class NewOrderServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Order order = new Order();

        order.setPerson(req.getParameter("person"));
        order.setItem(req.getParameter("item"));
        order.setAmount(req.getParameter("amount"));
        order.setCompany(req.getParameter("company"));
        order.setCatalog(req.getParameter("catalog"));
        order.setUrl(req.getParameter("url"));
        order.setOrdered(false);

        OrdersDao ordersDao = new OrdersDao();
        try {
            ordersDao.create(order);
        } catch (DaoException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("order-list.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
