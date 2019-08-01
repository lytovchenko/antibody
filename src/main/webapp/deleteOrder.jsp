<%@ page import="services.OrderService" %><%--
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
    orderService.deleteOrder(order);
    response.sendRedirect("order-list.jsp");
%>