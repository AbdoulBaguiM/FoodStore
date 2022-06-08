<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FoodStore : Gestion des produits</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="/adminAssets/css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="/adminAssets/css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="/adminAssets/css/templatemo-style.css">
</head>
<body>
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
                        <i class="fas fa-shopping-cart"></i> Catégories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/admin/produits">
                        <i class="fas fa-shopping-cart"></i> Produits
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/admin/comptes">
                        <i class="far fa-user"></i> Comptes
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
<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Ajouter | Modifier un plat</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                        <div class="col-xl-6 col-lg-6 col-md-12">
                            <form action="/admin/produit" method="POST" class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label for="name">Nom</label>
                                <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control validate"
                                        value="${produit.nom}"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label for="name">Détails</label>
                                <input
                                        id="details"
                                        name="details"
                                        type="text"
                                        class="form-control validate"
                                        value="${produit.details}"
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label for="description">Description</label>
                                <textarea
                                        id="description"
                                        name="description"
                                        class="form-control validate"
                                        required>${produit.description}</textarea>
                            </div>
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="category">Catégorie</label>
                                    <select class="custom-select tm-select-accounts" id="category" name="categorie" required>
                                        <option value="" selected>Aucune</option>
                                        <c:forEach var="categorie" items="${categories}">
                                            <option value="${categorie.id}"
                                                ${categorie.id == produit.categorie.id ? 'selected' : ''}>
                                                    ${categorie.nom}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="category">Promotion</label>
                                    <select class="custom-select tm-select-accounts" id="promotion" name="promotion">
                                        <option value="" selected>Aucune</option>
                                        <c:forEach var="promotion" items="${promotions}">
                                            <option value="${promotion.id}"
                                                ${promotion.id == produit.promotion.id ? 'selected' : ''}>
                                                    ${promotion.percentOff}%</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="priceWt">Prix Unitaire</label>
                                    <input
                                            id="priceWt"
                                            name="prixHt"
                                            type="number" step="0.01"
                                            value="${produit.prixHt}"
                                            class="form-control validate"
                                            data-large-mode="true"
                                            required
                                    />
                                </div>
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="stock">Quantité</label>
                                    <input
                                            id="stock"
                                            name="quantite"
                                            type="number"
                                            value="${produit.quantite}"
                                            class="form-control validate"
                                            required
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                            <div class="tm-product-img-dummy mx-auto">
                                <img src="/storage/products/${produit.photoPrincipale}" alt="Photo du plat"
                                     class="img-fluid d-block mx-auto">
                            </div>
                            <div class="custom-file mt-3 mb-3">
                                <input id="fileInput" name="photoPrincipale" type="file" style="display:none;" />
                                <input
                                        type="button"
                                        class="btn btn-primary btn-block mx-auto"
                                        value="IMPORTER L'IMAGE"
                                        onclick="document.getElementById('fileInput').click();"
                                />
                            </div>
                        </div>
                        <div class="col-12">
                            <input type="hidden" value="${produit.id}" name="id">
                            <button type="submit" class="btn btn-primary btn-block text-uppercase">Enregistrer</button>
                        </div>
                    </form>
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

<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
<!-- https://jqueryui.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script>
    $(function() {
        $("#expire_date").datepicker();
    });
</script>
</body>
</html>
