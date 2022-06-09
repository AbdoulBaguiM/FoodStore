<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FoodStore : Panneau de Configuration</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="/adminAssets/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="/adminAssets/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="/adminAssets/css/templatemo-style.css">
</head>

<body id="reportsPage">
<div class="" id="home">
    <nav class="navbar navbar-expand-xl">
        <div class="container h-100">
            <%--<a class="navbar-brand" href="/admin">
                <h1 class="tm-site-title mb-0">Panneau d'administration</h1>
            </a>--%>
            <%--<button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars tm-nav-icon"></i>
            </button>--%>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto h-100">
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/categories">
                            <i class="fas fa-list-alt "></i> Catégories
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/produits">
                            <i class="fas fa-shopping-cart"></i> Produits
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/admin/comptes">
                            <i class="far fa-user"></i>
                            Comptes
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/reviews">
                            <i class="far fa-star"></i>
                            Reviews
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/messages">
                            <i class="far fa-envelope"></i>
                            Messages
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/deconnexion">
                            <i class="fa fa-sign-out-alt"></i>
                            Déconnexion
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
    <div class="container">
        <div class="row">
            <div class="col">
                <p class="text-white mt-5 mb-5">Bienvenue, <b>${utilisateur.name}</b></p>
            </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row">
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Liste des commandes</h2>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">N°</th>
                            <th scope="col">STATUT</th>
                            <th scope="col">CLIENT</th>
                            <th scope="col">ADRESSE</th>
                            <th scope="col">TOTAL</th>
                            <th scope="col">DATE DE COMMANDE</th>
                            <th scope="col">ACTIONS</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="commande" items="${commandes}">
                            <tr>
                                <th scope="row"><b>#${commande.id}</b></th>
                                <td>
                                    <c:choose>
                                        <c:when test="${commande.statut == 0}">
                                            <div class="tm-status-circle pending">
                                            </div>En attente
                                        </c:when>
                                        <c:when test="${commande.statut == 1}">
                                            <div class="tm-status-circle moving">
                                            </div>Expediée
                                        </c:when>
                                        <c:when test="${commande.statut == 2}">
                                            <div class="tm-status-circle moving">
                                            </div>Reçue
                                        </c:when>
                                        <c:otherwise>
                                                <div class="tm-status-circle cancelled">
                                                </div>Annulée
                                        </c:otherwise>
                                    </c:choose>

                                </td>
                                <td><b>${commande.CEmail}</b></td>
                                <td><b>${commande.CAdresse}</b></td>
                                <td>${commande.CTotal} DHS</td>
                                <td>${commande.createdAt}</td>
                                <td align="center">
                                    <a href="/admin/commandes?id=${commande.id}" class="tm-product-delete-link">
                                        <i class="far fa-edit"></i>
                                    </a>
                                    <a href="/admin/commandes?id=${commande.id}&del" class="tm-product-delete-link">
                                        <i class="far fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
            <p class="text-center text-white mb-0 px-4 small">
                Copyright &copy; <b>2022</b> All rights reserved.
                ENSIAS
            </p>
        </div>
    </footer>
</div>

<script src="/adminAssets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="/adminAssets/js/moment.min.js"></script>
<!-- https://momentjs.com/ -->
<script src="/adminAssets/js/Chart.min.js"></script>
<!-- http://www.chartjs.org/docs/latest/ -->
<script src="/adminAssets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="/adminAssets/js/tooplate-scripts.js"></script>
<script>
    Chart.defaults.global.defaultFontColor = 'white';
    let ctxLine,
        ctxBar,
        ctxPie,
        optionsLine,
        optionsBar,
        optionsPie,
        configLine,
        configBar,
        configPie,
        lineChart;
    barChart, pieChart;
    // DOM is ready
    $(function () {
        drawLineChart(); // Line Chart
        drawBarChart(); // Bar Chart
        drawPieChart(); // Pie Chart

        $(window).resize(function () {
            updateLineChart();
            updateBarChart();
        });
    })
</script>
</body>

</html>