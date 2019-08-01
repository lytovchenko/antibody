<%@ page import="services.OrderService" %>
<%@ page import="domain.Order" %>
<%@ page import="dao.OrdersDao" %>
<%@ page import="dao.DaoException" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: olelyt
  Date: 09/04/19
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="order" class="domain.Order"/>
<jsp:setProperty name="order" property="id"/>

<%
    OrderService orderService = new OrderService();
    OrdersDao od = new OrdersDao();

    Order orderUpdate = new Order();
    try {
        orderUpdate = od.read(order.getId());
    } catch (DaoException e) {
        e.printStackTrace();
    }

    orderUpdate.setDateRequested(LocalDateTime.now().toString());
    //orderUpdate.setOrdered(!orderUpdate.getOrdered());
    orderUpdate.setOrdered(true);


    // orderService.deleteOrder(order);
    OrdersDao ordersDao = new OrdersDao();
    try {
        ordersDao.delete(order);
        ordersDao.create(orderUpdate);
    } catch (DaoException e) {
        e.printStackTrace();
    }

    response.sendRedirect("order-list.jsp");
%>