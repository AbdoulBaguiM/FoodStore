<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
<jsp:attribute name="title">
<title>FoodShop : Mon Profil</title>
<link type="text/css" rel="stylesheet" href="/assets/css/my-profile.css"/>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/jquery.modal.min.js"></script>
<link rel="stylesheet" href="/assets/css/jquery.modal.min.css"/>
</jsp:attribute>

    <jsp:body>
        <div class="container bootstrap snippet">
            <div class="spacer"></div>
            <br>
            <div class="row">
                <c:if test="${messageSucces != null}">
                    <div class="alert alert-success">
                            ${messageSucces}
                    </div>
                </c:if>

                <c:if test="${messageErreur != null}">
                    <div class="alert alert-danger">
                            ${messageErreur}
                    </div>
                </c:if>
                <div class="col-sm-3"><!--left col-->

                    <div class="text-center">
                        <img src="/storage/user.png" class="avatar img-circle img-thumbnail"
                             alt="avatar">
                        <hr>

                    </div>
                    <br>

                    <ul class="list-group">
                        <li class="list-group-item text-muted">Mon Activite <i class="fa fa-dashboard fa-1x"></i></li>
                        <li class="list-group-item text-right"><span class="pull-left"><strong>Commandes</strong></span>
                                ${commandes.size()}</li>
                    </ul>

                </div><!--/col-3-->

                <div class="col-sm-9">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#profile">Mon Profil</a></li>
                        <li><a data-toggle="tab" href="#orders">Mes Commandes</a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="profile">
                            <hr>
                            <form class="form" action="/profil" method="POST" id="registrationForm" role="form">
                                <div class="form-group">

                                    <label for="first_name">Nom</label>
                                    <input type="text" class="form-control" name="first_name" id="first_name"
                                           value="${utilisateur.name}" placeholder="Nom">

                                </div>

                                <div class="form-group">

                                    <label for="last_name">Prenom</label>
                                    <input type="text" class="form-control" name="last_name" id="last_name"
                                           value="${utilisateur.lastName}" placeholder="Prenom">

                                </div>

                                <div class="form-group">

                                    <label for="phone">Telephone</label>
                                    <input type="text" class="form-control" name="telephone" id="phone"
                                           value="${utilisateur.telephone}" placeholder="Téléphone">

                                </div>

                                <div class="form-group">

                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" id="email"
                                           value="${utilisateur.email}" placeholder="Adresse Mail" readonly>

                                </div>

                                <div class="form-group">

                                    <label for="email">Adresse</label>
                                    <input type="text" class="form-control" name="adresse" id="location"
                                           value="${utilisateur.adresse}" placeholder="Adresse">

                                </div>

                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label for="ville">Ville</label>
                                        <select class="input" id="ville" name="ville" required>
                                            <c:forEach var="ville" items="${villesCouvertes}">
                                                <option ${ville == utilisateur.ville ? 'selected' : ''}>${ville}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="zipcode">Code Postal</label>
                                        <input type="text" class="form-control" name="zipcode" id="zipcode"
                                               value="${utilisateur.zipcode}" placeholder="Code Postal">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label style="color: white">Test</label>
                                </div>
                                <div class="form-group">
                                    <label for="password">Mot de Passe</label>
                                    <input type="password" class="form-control" name="password" id="password"
                                           placeholder="Mot de Passe">
                                </div>

                                <div class="form-group">
                                    <label for="password2">Verifier le Mot de Passe</label>
                                    <input type="password" class="form-control" name="password_confirmation"
                                           id="password2" placeholder="Mot de Passe">
                                </div>

                                <div class="form-group">
                                    <p></p>
                                    <p><i class="fa fa-question"></i> Laissez le mot de passe vide pour qu'il soit
                                        inchange</p>
                                </div>

                                <div class="form-group" align="center">
                                    <br>
                                    <button class="primary-btn order-submit" name="buttonUpdateProfile" type="submit"><i
                                            class="fa fa-check"></i>Enregistrer
                                    </button>
                                    <button class="secondary-btn" type="reset"><i class="fa fa-trash"></i> Reinitialiser
                                    </button>
                                </div>
                            </form>

                            <hr>

                        </div><!--/tab-pane-->

                        <div class="tab-pane my-orders container" id="orders" style="width: 100%">
                            <hr>
                            <div>
                                <c:choose>
                                    <c:when test="${commandes.size() > 0}">
                                        <c:forEach var="commande" items="${commandes}">
                                            <div class="order-container">
                                                <div class="order-header">
                                                    <div class="order-header-items">
                                                        <div>
                                                            <div class="uppercase font-bold">Date Commande</div>
                                                            <div align="center">${commande.createdAt}</div>
                                                        </div>
                                                        <div>
                                                            <div class="uppercase font-bold">Commande</div>
                                                            <div align="center">${commande.id}</div>
                                                        </div>
                                                        <div>
                                                            <div class="uppercase font-bold">Total</div>
                                                            <div>${commande.CTotal} Dhs</div>
                                                        </div>
                                                        <div>
                                                            <div class="uppercase font-bold">Statut</div>
                                                            <div>
                                                                <c:choose>
                                                                    <c:when test="${commande.statut == 0}">
                                                                        <span style="color: orange; font-weight: bold">En cours</span>
                                                                    </c:when>
                                                                    <c:when test="${commande.statut == 1}">
                                                                        <span style="color: hotpink; font-weight: bold">Expediee</span>
                                                                    </c:when>
                                                                    <c:when test="${commande.statut == 2}">
                                                                        <span style="color: forestgreen; font-weight: bold">Recu</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span style="color: red;font-weight: bold">Annulee</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <div class="order-header-items">
                                                            <div><a href="#${commande.id}" rel="modal:open">Details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal" id="${commande.id}">
                                                    <!-- Start address Section -->
                                                    <tr>
                                                        <td style="padding-top: 0;">
                                                            <table align="center" cellpadding="0" cellspacing="0"
                                                                   border="0" class="devicewidthinner"
                                                                   style="border-bottom: 1px solid #bbbbbb;">
                                                                <tbody>
                                                                <tr>
                                                                    <td style="width: 55%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                                                        Adresse de Livraison
                                                                    </td>
                                                                    <td style="width: 45%; font-size: 16px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                                                        Informations Client
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                                                            ${commande.CAdresse}
                                                                    </td>
                                                                    <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                                                            ${commande.CNom} ${commande.CPrenom}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 55%; font-size: 14px; line-height: 18px; color: #666666;">
                                                                            ${commande.CVille}, ${commande.CZipcode}
                                                                    </td>
                                                                    <td style="width: 45%; font-size: 14px; line-height: 18px; color: #666666;">
                                                                            ${commande.CTelephone}
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <!-- End address Section -->

                                                    <!-- Start product Section -->
                                                    <c:forEach var="commandeProduit"
                                                               items="${commande.commandeProduits}">
                                                        <tr>
                                                            <td style="padding-top: 0;">
                                                                <table align="center" cellpadding="0" cellspacing="0"
                                                                       border="0" class="devicewidthinner"
                                                                       style="border-bottom: 1px solid #eeeeee;">
                                                                    <tbody>
                                                                    <tr>
                                                                        <td rowspan="4"
                                                                            style="padding-right: 10px; padding-bottom: 10px;">
                                                                            <img style="height: 80px;"
                                                                                 src="/storage/products/${commandeProduit.produit.photoPrincipale}"
                                                                                 alt="Product Image"/>
                                                                        </td>
                                                                        <td colspan="2"
                                                                            style="font-size: 14px; font-weight: bold; color: #666666; padding-bottom: 5px;">
                                                                                ${commandeProduit.produit.nom}
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="font-size: 14px; line-height: 18px; color: #757575; width: 440px;">
                                                                            Quantite: ${commandeProduit.quantite}
                                                                        </td>
                                                                        <td style="width: 130px;"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="font-size: 14px; line-height: 18px; color: #757575;"></td>
                                                                        <td style="font-size: 14px; line-height: 18px; color: #757575; text-align: right;">
                                                                                ${commandeProduit.quantite}
                                                                            x ${commandeProduit.produit.prixPromo !=
                                                                            null ? commandeProduit.produit.prixPromo
                                                                            : commandeProduit.produit.prixHt} DHS
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <!-- End product Section -->
                                                    <br>
                                                    <div align="center">
                                                        <c:if test="${commande.statut == 0}">
                                                            <form action="/annuler" method="post" id="annuler_commande"></form>
                                                            <input type="hidden" name="commandeId" value="${commande.id}" form="annuler_commande">
                                                            <button class="primary-btn" form="annuler_commande">Annuler</button>
                                                        </c:if>
                                                            <a class="secondary-btn" href="#" rel="modal:close">Fermer</a>
                                                    </div>
                                                </div>
                                                <div class="order-products">
                                                    <c:forEach var="commandeProduit"
                                                               items="${commande.commandeProduits}">
                                                        <div class="order-product-item">
                                                            <div>
                                                                <a href="/produit?id=${commandeProduit.produit.id}">
                                                                    <img
                                                                            src="/storage/products/${commandeProduit.produit.photoPrincipale}"
                                                                         alt="Photo Produit">
                                                                </a>
                                                            </div>
                                                            <div>
                                                                <div>
                                                                    <a href="/produit?id=${commandeProduit.produit.id}">${commandeProduit.produit.nom}</a>
                                                                </div>
                                                                <div>${commandeProduit.produit.prixPromo !=
                                                                        null ? commandeProduit.produit.prixPromo
                                                                        : commandeProduit.produit.prixHt} Dhs</div>
                                                                <div>Quantite: ${commandeProduit.quantite}</div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <!-- end order-container -->
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Vous n'avez aucune commande</div>
                                            <div class="panel-body">
                                                <a href="/boutique"><i class="fa fa-arrow-right"></i>
                                                    Visiter notre boutique afin de passer vos premieres commandes</a>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div><!--/tab-pane-->
                    </div><!--/tab-pane-->
                </div><!--/tab-content-->

            </div><!--/col-9-->
        </div>
        <!--/row-->
    </jsp:body>
</t:layout>