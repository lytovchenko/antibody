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

        html,
        body,
        header,
        .view {
            height: 100%;
            position: relative;
        }

        @media (max-width: 740px) {
            html,
            body,
            header,
            .view {
                height: 100vh;
            }
        }

        @media (max-width: 500px) {
            h4 {
                font-weight: lighter;
            }

            .span-text {
                font-weight: bold;
            }
        }
    </style>

    <title>MBB MolMet</title>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">

    <a class="navbar-brand" data-toggle="modal" href="#"
       data-target="#signIn">Sign in
    </a>

</nav>

<!-- Modal -->
<div class="modal fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Sign in</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/signin" method="post">
                <div class="modal-body">

                    <div class="form-group">
                        <label for="exampleInputEmail1">Login</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                               placeholder="Enter login" name="login">

                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password"
                               name="password">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Sign in</button>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- Full Page Intro -->
<div class="view"
     style="background-image: url('/images/background_truncated.jpeg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">

    <div class="container">
        <div class="row" align="center">
            <div class="col-sm welcome-text text-white text-center my-3" align="center">
                <h2 class="h1-responsive font-weight-bold mt-sm-5">Welcome to the <br>Research Division of Molecular
                    Metabolism<br>(MBB-MolMet)</h2>
                <hr class="hr-light">
            </div>
        </div>

        <div class="row" align="center">
            <div class="col-sm-2"></div>
            <h4 class="col-sm-8 mb-4 text-white text-center my-2" align="center">This is internal site foreseen for the
                MBB MolMet
                co-workers. If you are
                an external visitor interested
                in our research, please, visit our <span class="span-text"> <a
                        href="https://ki.se/en/mbb/research-division-of-molecular-metabolism" target="_blank">official
                    site</a></span>.
                <div class="col-sm-2"></div>
            </h4>
        </div>
        <div class="row" align="center">
            <div class="col-sm my-5">
                <button class="btn btn-lg btn-outline-light mx-1 my-1" data-toggle="modal"
                        data-target="#signIn">Sign in
                </button>
            </div>

        </div>
    </div>
</div>

<!-- Full Page Intro ends here-->


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