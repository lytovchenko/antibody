<%--
    This is redundant file left as a backup for antibody database access code!

  Created by IntelliJ IDEA.
  User: olelyt
  Date: 02/04/19
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="services.AntibodyService" %>
<%@ page import="java.util.List" %>
<%@ page import="domain.Antibody" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    AntibodyService antibodyService = new AntibodyService();
    List<Antibody> antibodyList = antibodyService.getAllAntibodies();
    request.setAttribute("antibodyList", antibodyList);
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

    <title>Antibodies</title>

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


<div class="container  w-100 my-4 bg-light">

    <h2 align="center" id="page_title">Antibody list</h2>
    <p align="center" id="count"></p>

    <a href="antibodies-html.html" class="btn btn-outline-secondary mb-2 mr-sm-2 mx-1">Spreadsheet view</a>

    <form class="form-inline" name="search_form">
        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Antigen" name="search">
        <button class="btn btn-outline-primary mb-2" onclick="func_search(search_form.search.value); return false;">
            Search
        </button>
        <a href="antibody-list.jsp" class="btn btn-outline-secondary mb-2 mr-sm-2 mx-1">Reset</a>
    </form>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-outline-success mb-2" data-toggle="modal"
            data-target="#exampleModal">
        <i class="fa fa-plus"></i> New antibody
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add new antibody</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="border border-dark my-2 p-3" action="/addantibody" method="get">

                        <div class="form-group">
                            <label for="antigenInput">Antigen</label>
                            <input type="text" class="form-control" id="antigenInput" placeholder="Antigen"
                                   name="antigen">
                        </div>

                        <div class="form-group">
                            <label for="producedInSelect">Produced in</label>
                            <select class="form-control" id="producedInSelect" name="produced">
                                <option>-</option>
                                <option>Rabbit</option>
                                <option>Mouse</option>
                                <option>Goat</option>
                                <option>Chicken</option>
                                <option>Rat</option>
                                <option>Other (specified in comments)</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="companyInput">Company</label>
                            <input type="text" class="form-control" id="companyInput" placeholder="Company"
                                   name="company">
                        </div>

                        <div class="form-group">
                            <label for="catalogInput">Catalog No</label>
                            <input type="text" class="form-control" id="catalogInput"
                                   placeholder="Catalog #"
                                   name="catalog">
                        </div>

                        <div class="form-group">
                            <label for="locationSelect">Storage</label>
                            <select class="form-control" id="locationSelect" name="location">
                                <option>-</option>
                                <option>+4</option>
                                <option>-20</option>
                                <option>other (specified in comments)</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="boxSelect">Box</label>
                            <select class="form-control" id="boxSelect" name="box">
                                <option>-</option>
                                <option>Box 1</option>
                                <option>Box 2</option>
                                <option>Box 3</option>
                                <option>Box 4</option>
                                <option>Box 5</option>
                                <option>Box 6</option>
                                <option>Box 7</option>
                                <option>Box 8</option>
                                <option>Box 9</option>
                                <option>Box 10</option>
                                <option>Box 11</option>
                                <option>Box 12</option>
                                <option>Box 13</option>
                                <option>Box 14</option>
                                <option>Box 15</option>
                                <option>Box 16</option>
                                <option>Box 17</option>
                                <option>Box 18</option>
                                <option>Box 19</option>
                                <option>Box 20</option>
                                <option>other (specified in comments)</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Comment</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" name="comment"
                                      rows="3"
                                      placeholder="Please specify any relevant details here"></textarea>
                        </div>
                        <input class="btn btn-danger" type="submit" value="Submit">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <table id="anti_table" class="table table-bordered table-hover table-condensed bg-light table-sm table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Antigen</th>
            <th scope="col">Source</th>
            <th scope="col">Company</th>
            <th scope="col">Catalog #</th>
            <th scope="col">Location</th>
            <th scope="col">Box</th>
            <th scope="col">Details</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${antibodyList}" var="antibody">
            <tr>
                <th scope="row">${antibody.id}</th>
                <td id="anti">${antibody.antigen}</td>
                <td>${antibody.produced}</td>
                <td>${antibody.company}</td>
                <td>${antibody.catalog}</td>
                <td id="location">${antibody.location}</td>
                <td>${antibody.box}</td>
                <td>${antibody.details}</td>

                <td>
                    <a href="deleteAntibody.jsp?id=${antibody.id}" class="btn btn-outline-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button type="button" class="btn btn-outline-success my-3" data-toggle="modal" data-target="#exampleModal">
        <i class="fa fa-plus"></i> New antibody
    </button>
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
<script type="text/javascript">

    function func_search(text) {
        var arr_rows = document.getElementById('anti_table').getElementsByTagName('tr');
        var count = 0;

        if (text) {
            for (var i = 1; i < arr_rows.length; i++) {

                if (!arr_rows[i].childNodes[3].innerHTML.toUpperCase().includes(text.toUpperCase())) {
                    arr_rows[i].setAttribute("style", "display:none");
                } else {
                    count++;
                }

            }
            document.getElementById("page_title").innerHTML = "Search result";
            document.getElementById("count").innerHTML = "Total number of antibodies: " + (arr_rows.length - 1) + "<br>" + "Found containing \"" + text + "\": " + count;

        }
    }

    function func_color() {
        var arr_rows = document.getElementById('anti_table').getElementsByTagName('tr');

        for (var i = 0; i < arr_rows.length; i++) {

            if (arr_rows[i].childNodes[11].innerHTML.includes("4")) {
                arr_rows[i].setAttribute("style", "background-color:#f9fae8");
            } else {
                arr_rows[i].setAttribute("style", "background-color:#e8effa");
            }
        }
    }

    func_color();

</script>
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
