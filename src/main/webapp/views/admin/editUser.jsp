<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FoodStore : Gestion d'utilisateurs</title>
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
                        <a class="nav-link" href="/admin/produits">
                            <i class="fas fa-shopping-cart"></i> Produits
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="/admin/comptes">
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
    <div class="container mt-5">
        <!-- row -->
        <div class="row tm-content-row">
            <div class="tm-block-col tm-col-avatar">
                <div class="tm-bg-primary-dark tm-block tm-block-avatar">
                    <div class="tm-avatar-container">
                        <img
                                src="/storage/user.png"
                                alt="Avatar"
                                class="tm-avatar img-fluid mb-4"
                        />
                    </div>
                </div>
            </div>
            <div class="tm-block-col tm-col-account-settings">
                <div class="tm-bg-primary-dark tm-block tm-block-settings">
                    <h2 class="tm-block-title">Informations</h2>
                    <form action="/admin/compte" method="POST" class="tm-signup-form row">
                        <div class="form-group col-lg-6">
                            <label for="name">Nom</label>
                            <input
                                    id="name"
                                    name="name"
                                    type="text"
                                    value="${user.name}"
                                    class="form-control validate"
                                    required
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="lastName">Prénom</label>
                            <input
                                    id="lastName"
                                    name="lastName"
                                    type="text"
                                    value="${user.lastName}"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="email">Email</label>
                            <input
                                    id="email"
                                    name="email"
                                    type="email"
                                    value="${user.email}"
                                    class="form-control validate"
                                    required
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="role">Type de Compte</label>
                            <select class="custom-select tm-select-accounts" id="role" name="role" required>
                                <option value="" selected>Aucun</option>
                                <c:forEach var="role" items="${roles}">
                                    <option value="${role.id}"
                                        ${role.id == user.role.id ? 'selected' : ''}>
                                            ${role.displayName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="adresse">Adresse</label>
                            <input
                                    id="adresse"
                                    name="adresse"
                                    type="text"
                                    value="${user.adresse}"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="ville">Ville</label>
                            <select  class="custom-select tm-select-accounts" id="ville" name="ville" required>
                                <c:forEach var="ville" items="${villesCouvertes}">
                                    <option ${ville == user.ville ? 'selected' : ''}>${ville}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="zipcode">Code Postal</label>
                            <input
                                    id="zipcode"
                                    name="zipcode"
                                    type="text"
                                    value="${user.zipcode}"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="phone">Téléphone</label>
                            <input
                                    id="phone"
                                    name="telephone"
                                    type="tel"
                                    value="${user.telephone}"
                                    class="form-control validate"
                                    required
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label for="password">Mot de Passe</label>
                            <input
                                    id="password"
                                    name="password"
                                    type="password"
                                    class="form-control validate"
                            />
                        </div>
                        <div class="form-group col-lg-6">
                            <label class="tm-hide-sm">&nbsp;</label>
                            <input type="hidden" value="${user.id}" name="id">
                            <button type="submit" class="btn btn-primary btn-block text-uppercase">
                                Enregistrer
                            </button>
                        </div>
                        <c:if test="${id != null}">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">
                                    Supprimer ce compte
                                </button>
                            </div>
                        </c:if>

                    </form>
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
<script src="/adminAssets/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
</body>
</html>
