<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FoodStore : Gestion des Reviews</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="/adminAssets/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="/adminAssets/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="/adminAssets/css/templatemo-style.css">
</head>
<body id="reportsPage">
<nav class="navbar navbar-expand-xl">
    <div class="container h-100">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item">
                    <a class="nav-link" href="/admin">
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
                <li class="nav-item active">
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
<div class="container mt-5">
    <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-products">
                <div class="tm-product-table-container">
                    <table class="table table-hover tm-table-small tm-product-table">
                        <thead>
                        <tr>
                            <th scope="col">&nbsp;</th>
                            <th scope="col">CLIENT</th>
                            <th scope="col">PRODUIT</th>
                            <th scope="col">PHOTO</th>
                            <th scope="col">NOTE</th>
                            <th scope="col">MESSAGE</th>
                            <th scope="col">STATUT</th>
                            <th scope="col">DATE DE CREATION</th>
                            <th scope="col">&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="review" items="${reviews}">
                            <tr>
                                <th scope="row"><input type="checkbox" value="${review.id}"/></th>
                                <td class="tm-product-name">${review.user.name}</td>
                                <td>${review.produit.nom}</td>
                                <td>
                                    <img src="/storage/products/${review.produit.photoPrincipale}" width="60px" height="40px">
                                </td>
                                <td>${review.note}</td>
                                <td>${review.message}</td>
                                <td>
                                    <c:choose>
                                    <c:when test="${review.statut == false}">
                                        <div class="tm-status-circle cancelled">
                                        </div>Non vérifié
                                    </c:when>
                                    <c:otherwise>
                                        <div class="tm-status-circle moving">
                                        </div>Achat vérifié
                                    </c:otherwise>
                                </c:choose>
                                </td>
                                <td>${review.updatedAt}</td>
                                <td>
                                    <!-- Rounded switch -->
                                    <label class="switch">
                                        <input type="checkbox"  onclick='handleClick(${review.id});' ${review.statut ==
                                         true ?
                                        'checked' : '' }>
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
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

<script src="/adminAssets/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="/adminAssets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    function handleClick(reviewId) {
        window.location.href = "/admin/reviews?id="+reviewId;
    }
</script>
</body>
</html>
