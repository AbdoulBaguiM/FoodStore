<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FoodStore : Gestion des Commandes</title>
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
                        <a class="nav-link active" href="/admin">
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
                        <a class="nav-link" href="/admin/produits">
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
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mx-auto">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title d-inline-block">Modifier une commande</h2>
                        </div>
                    </div>
                    <div class="row tm-edit-product-row">
                        <div class="col-xl-6 col-lg-6 col-md-12">
                            <form action="/admin/commandes" method="POST" class="tm-edit-product-form" id="formOrder">
                                <div class="form-group mb-3">
                                    <label for="name">Nom</label>
                                    <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            class="form-control validate"
                                            value="${commande.CNom}"
                                            required
                                    />
                                </div>
                                <div class="form-group mb-3">
                                    <label for="lastName">Prénom</label>
                                    <input
                                            id="lastName"
                                            name="lastName"
                                            type="text"
                                            class="form-control validate"
                                            value="${commande.CPrenom}"
                                    />
                                </div>
                                <div class="form-group mb-3">
                                    <label for="email">Email</label>
                                    <input
                                            id="email"
                                            name="email"
                                            type="email"
                                            class="form-control validate"
                                            value="${commande.CEmail}"
                                    />
                                </div>
                                <div class="form-group mb-3">
                                    <label for="adresse">Adresse</label>
                                    <textarea
                                            id="adresse"
                                            name="adresse"
                                            class="form-control validate"
                                            required>${commande.CAdresse}</textarea>
                                </div>
                                <div class="row">
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label for="ville">Ville</label>
                                        <select class="custom-select tm-select-accounts" id="ville" name="ville"
                                                required>
                                            <c:forEach var="ville" items="${villesCouvertes}">
                                                <option ${ville == commande.CVille ? 'selected' : ''}>${ville}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label for="zipcode">Code Postal</label>
                                        <input
                                                id="zipcode"
                                                name="zipcode"
                                                type="text"
                                                value="${commande.CZipcode}"
                                                class="form-control validate"
                                                required
                                        />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group mb-3 col-xs-12 col-sm-6">
                                        <label for="telephone">Téléphone</label>
                                        <input
                                                id="telephone"
                                                name="telephone"
                                                type="text"
                                                value="${commande.CTelephone}"
                                                class="form-control validate"
                                                required
                                        />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12">
                            <div class="form-group mb-3">
                                <label>Produits</label>
                            </div>
                            <!-- Start product Section -->
                            <c:forEach var="commandeProduit"
                                       items="${commande.commandeProduits}">
                                <table align="center" cellpadding="0" cellspacing="0"
                                       border="0" class="devicewidthinner">
                                    <tbody>
                                    <tr>
                                        <td rowspan="4"
                                            style="padding-right: 10px; padding-bottom: 10px;">
                                            <img style="height: 80px;"
                                                 src="/storage/products/${commandeProduit.produit.photoPrincipale}"
                                                 alt="Product Image"/>
                                        </td>
                                        <td colspan="2" style="color: white">
                                                ${commandeProduit.produit.nom}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 14px; line-height: 18px; color: white; width: 440px;">
                                            Quantite: ${commandeProduit.quantite}
                                        </td>
                                        <td style="width: 130px;"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-size: 14px; line-height: 18px; color: #757575;"></td>
                                        <td style="font-size: 14px; line-height: 18px; color: white; text-align:
                                        right;">
                                                ${commandeProduit.quantite}
                                            x ${commandeProduit.produit.prixPromo !=
                                                null ? commandeProduit.produit.prixPromo
                                                : commandeProduit.produit.prixHt} DHS
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </c:forEach>
                            <!-- End product Section -->
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6"></div>
                            </div>
                            <div class="row">
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="statut">Statut</label>
                                    <select class="custom-select tm-select-accounts" id="statut" name="statut"
                                            form="formOrder" required>
                                        <option value="0" ${commande.statut == 0 ? 'selected' : ''}>En Cours</option>
                                        <option value="1" ${commande.statut == 1 ? 'selected' : ''}>Expédiée</option>
                                        <option value="2" ${commande.statut == 2 ? 'selected' : ''}>Livrée</option>
                                        <option value="-1" ${commande.statut == -1 ? 'selected' : ''}>Annulée</option>
                                    </select>
                                </div>
                                <div class="form-group mb-3 col-xs-12 col-sm-6">
                                    <label for="total">Total</label>
                                    <input
                                            id="total"
                                            name="total"
                                            type="number" step="0.01"
                                            value="${commande.CTotal}"
                                            class="form-control validate"
                                            data-large-mode="true"
                                    />
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <input type="hidden" value="${commande.id}" name="id" form="formOrder">
                            <button type="submit" class="btn btn-primary btn-block text-uppercase" form="formOrder">Enregistrer</button>
                        </div>
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
