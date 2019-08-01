<%@ page import="services.AntibodyService" %><%--
  Created by IntelliJ IDEA.
  User: olelyt
  Date: 09/04/19
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="antibody" class="domain.Antibody"/>
<jsp:setProperty name="antibody" property="id"/>

<%
    AntibodyService antibodyService = new AntibodyService();
    antibodyService.deleteAntibody(antibody);
    response.sendRedirect("antibody-list.jsp");
%>