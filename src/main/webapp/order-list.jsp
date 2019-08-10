<%@ page import="java.util.List" %>
<%@ page import="services.OrderService" %>
<%@ page import="domain.Order" %>

<%--
  Created by IntelliJ IDEA.
  User: olelyt
  Date: 02/04/19
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    OrderService orderService = new OrderService();
    List<Order> orderList = orderService.getAllOrders();
    request.setAttribute("orderList", orderList);
%>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>

        @media (max-width: 1000px) {
            .large-only {
                display: none;
            }

            .mobile-only {
                display: block;
            }
        }

        @media (min-width: 1000px) {
            .large-only {
                display: block;
            }

            .mobile-only {
                display: none;
            }
        }
    </style>

    <title>Orders</title>

</head>

<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <a class="navbar-brand" href="home.html">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="calendar.html">Calendars</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="order-list.jsp">Orders</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Resources
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="antibody-list.jsp">Antibodies</a>
                    <a class="dropdown-item" href="taqman.html">TaqMan probes</a>
                    <a class="dropdown-item" href="nitrogen.html">Liquid nitrogen</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="other.html">Other files</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="other.html">Other</a>
            </li>
            <li class="nav-item">
                <a href="index.html" class="nav-link mobile-only">Sign out</a>
            </li>
        </ul>
    </div>
    <a href="index.html" class="btn btn-outline-light large-only">Sign out</a>
</nav>


<div class="container w-100 my-4 bg-light">

    <div class="large-only">
        <h3 align="center">Place a new order</h3>
        <table class="table bg-light table-sm large-only">
            <form class="form-inline" action="/neworder" method="get">
                <tbody>
                <tr>
                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder="Person ordering"
                               name="person"></td>
                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder="Item" name="item"></td>
                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder="Amount" name="amount"></td>
                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder="Company" name="company"></td>
                    <td><input type="text" class="form-control mb-2 mr-sm-2" placeholder="Catalog #" name="catalog">
                    </td>
                    <td><input type="url" class="form-control mb-2 mr-sm-2" placeholder="URL" name="url"></td>
                    <td>
                        <button type="submit" class="btn btn-outline-success mb-2">Order</button>
                    </td>
                </tr>
                </tbody>
            </form>
        </table>
    </div>

    <h3 align="center">Pending requests</h3>

    <!-- Button trigger modal -->
    <div class="mobile-only">
        <button class="btn btn-outline-success my-2" data-toggle="modal" data-target="#orderModal">
            <i class="fa fa-plus"></i> New order
        </button>
        <br>
        <!-- Modal -->
        <div class="modal fade" id="orderModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Place new order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="/neworder" method="get">
                            <div class="form-group">
                                <label for="person">Name</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Person ordering"
                                       name="person" id="person">
                            </div>

                            <div class="form-group">
                                <label for="item">Item</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Item" name="item"
                                       id="item">
                            </div>

                            <div class="form-group">
                                <label for="amount">Amount</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Amount" name="amount"
                                       id="amount">
                            </div>

                            <div class="form-group">
                                <label for="company">Company</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Company"
                                       name="company" id="company">
                            </div>

                            <div class="form-group">
                                <label for="catalog">Catalog #</label>
                                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Catalog #"
                                       name="catalog" id="catalog">
                            </div>

                            <div class="form-group">
                                <label for="url">URL</label>
                                <input type="url" class="form-control mb-2 mr-sm-2" placeholder="URL" name="url"
                                       id="url">
                            </div>

                            <button type="submit" class="btn btn-outline-success mb-2">Order now</button>
                            <button type="button" class="btn btn-outline-secondary mb-2" data-dismiss="modal">Close
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <table class="table table-bordered table-hover table-condensed bg-light table-sm table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Requested</th>
            <th scope="col">Person</th>
            <th scope="col">Item</th>
            <th scope="col">Amount</th>
            <th scope="col">Company</th>
            <th scope="col">Catalog #</th>
            <th scope="col">Delete</th>
            <th scope="col">Ordered</th>
            <th scope="col">Open</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${orderList}" var="order">
            <c:if test="${! order.ordered}">
                <tr>
                    <td>${order.dateRequested}</td>
                    <td>${order.person}</td>
                    <td>${order.item}</td>
                    <td>${order.amount}</td>
                    <td>${order.company}</td>
                    <td>${order.catalog}</td>
                    <td>
                        <a title="Delete order" href="deleteOrder.jsp?id=${order.id}" class="btn btn-outline-danger"><i
                                class="fa fa-remove"></i></a>
                    </td>
                    <td>
                        <a title="Mark as ordered" href="markAsOrdered.jsp?id=${order.id}"
                           class="btn btn-outline-secondary"><i
                                class="fa fa-check"></i></a>
                    </td>
                    <td><c:if test="${order.url!=('')}">
                        <c:if test="${order.url!=('null')}">
                            <a title="Open in new window" target="_blank" class="btn btn-outline-primary"
                               href="${order.url}"><i
                                    class="fa fa-external-link"></i></a>
                        </c:if>
                    </c:if>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>


    <h3 align="center">Order history</h3>
    <table class="table table-bordered table-hover table-condensed bg-light table-sm table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Ordered on</th>
            <th scope="col">Person</th>
            <th scope="col">Item</th>
            <th scope="col">Amount</th>
            <th scope="col">Company</th>
            <th scope="col">Catalog #</th>
            <th scope="col">Delete</th>
            <th scope="col">Reorder</th>
            <th scope="col">Open</th>

        </tr>
        </thead>
        <tbody>

        <c:forEach items="${orderList}" var="order">
            <c:if test="${order.ordered}">
                <tr>
                    <td>${order.dateRequested}</td>
                    <td>${order.person}</td>
                    <td>${order.item}</td>
                    <td>${order.amount}</td>
                    <td>${order.company}</td>
                    <td>${order.catalog}</td>


                    <td>
                        <a title="Delete order" href="deleteOrder.jsp?id=${order.id}" class="btn btn-outline-danger"><i
                                class="fa fa-remove"></i></a>
                    </td>
                    <td>
                        <a title="Reorder" href="reorder.jsp?id=${order.id}"
                           class="btn btn-outline-secondary"><i
                                class="fa fa-reply"></i></a>
                    </td>
                    <td><c:if test="${order.url!=('')}">
                        <c:if test="${order.url!=('null')}">
                            <a title="Open in new window" target="_blank" class="btn btn-outline-primary"
                               href="${order.url}"><i
                                    class="fa fa-external-link"></i></a>
                        </c:if>
                    </c:if>
                    </td>

                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>

</div>


<footer class="pt-1 pt-md-1 border-top bg-dark">
    <div class="row my-3">
        <div class="col-sm-4">
            <a href="https://twitter.com/MolMet_KI?ref_src=twsrc%5Etfw" class="twitter-follow-button my-2"
               data-show-count="false"> Follow @MolMet_KI</a>
            <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            <br>
            <a href="mailto:molmet@mbb.ki.se" class="text-white-50 text-small"> <i class="fa fa-envelope"
            ></i>
                molmet@mbb.ki.se</a><br>
            <a class="text-white-50 text-small"><i class="fa fa-phone"></i> +46-(0)8-524 830 39</a><br>
            <a href="https://goo.gl/maps/uCNK2s3mXGWnBdSt7" target="_blank" class="text-white-50 text-small"><i
                    class="fa fa-map-o"></i> Map <br></a>
            <br>
        </div>

        <div class="col-sm-4">

            <p class="text-white-50 text-small">
                <strong>Visiting address:</strong> <br>
                Division of Molecular Metabolism<br>
                Biomedicum 9D <br>
                Solnav&#228;gen 9<br>
                17165 Solna<br>
                Sweden</p>
        </div>

        <div class="col-sm-4">
            <ul class="list-unstyled">
                <li><strong class="text-white-50 text-small">External links:</strong></li>
                <li><a class="text-white-50 text-small"
                       href="https://ki.se/en/mbb/research-division-of-molecular-metabolism" target="_blank"><i
                        class="fa fa-external-link"></i> MolMet
                    official site</a></li>
                <li><a class="text-white-50 text-small" href="https://ki.se/en/mbb/nils-goran-larsson-group"
                       target="_blank"><i
                        class="fa fa-external-link"></i> Nils-G&ouml;ran
                    Larsson group</a></li>
                <li></i><a class="text-white-50 text-small" href="https://ki.se/en/mbb/joanna-rorbach-group"
                           target="_blank"><i
                        class="fa fa-external-link"></i> Joanna Rorbach
                    group</a></li>
                <li></i><a class="text-white-50 text-small" href="https://ki.se/en/mbb/anna-wredenberg-group"
                           target="_blank"><i
                        class="fa fa-external-link"></i> Anna Wredenberg
                    group</a></li>
            </ul>
        </div>
    </div>
</footer>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
