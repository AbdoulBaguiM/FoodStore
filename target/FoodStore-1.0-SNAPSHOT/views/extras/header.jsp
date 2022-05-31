<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +212-662-158-998</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> foodshop.contact@gmail.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 67, Agdal, Rue Khalil - Rabat</a></li>
            </ul>
            <ul class="header-links pull-right">
                <c:choose>
                    <c:when test="${utilisateur != null}">
                        <li class="dropdown profile" style="margin-right: 3%">
                            <a href="#" class="dropdown-toggle text-right" data-toggle="dropdown" role="button"
                               aria-expanded="false"><nobr/><i class="fa fa-user"></i> Bienvenue ${utilisateur.name} <i class="fa fa-caret-down"></i></a></nobr>

                            <ul class="dropdown-menu dropdown-menu-animated">
                                <br>
                                <li class="profile-img" style="padding: 10px" align="center">
                                    <img src="/assets/img/${utilisateur.avatar}" style="width: 50px;height: 50px;border-radius: 10px;">
                                    <div style="color: white"> S</div>
                                    <div class="profile-body" align="center">
                                        <h5>${utilisateur.name}</h5>
                                        <h6>${utilisateur.email}</h6>
                                    </div>
                                </li>
                                <hr>
                                <li>
                                    <a href="" style="color: black;">
                                        <i class="fa fa-user"></i> Mon Profil
                                    </a>
                                </li>
                                <div class="spacer"></div>
                                <li>
                                    <form action="/deconnexion" method="POST">
                                        <button type="submit" class="secondary-btn"  style="position: center">
                                            Deconnexion
                                        </button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/connexion"><i class="fa fa-lock"></i>Mon Compte</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="/" class="logo">
                            <img src="/assets/ginfo/logo.png" alt="" width="169" height="70">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="/rechercher">
                            <input class="input" name="query" placeholder="Chercher un plat" required>
                            <button class="search-btn">Rechercher</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Ma Wishlist</span>
                                <div class="qty">2</div>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Mon Panier</span>
                                <c:if test="${panier.items.size() > 0}">
                                    <div class="qty">${panier.items.size()}</div>
                                </c:if>
                            </a>
                            <div class="cart-dropdown">
                                <c:choose>
                                    <c:when test="${panier.items.size() > 0}">
                                        <div class="cart-list">
                                            <c:forEach var="lignePanier" items="${panier.items}">
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="/assets/img/${lignePanier.produit.photoPrincipale}" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="/produit?id=${lignePanier.produit.id}">${lignePanier.produit.nom}</a></h3>
                                                        <h4 class="product-price"><span class="qty">${lignePanier.quantite}x</span>${lignePanier.produit.prixHt} DHS</h4>
                                                    </div>
                                                    <form action="/panier" method="POST">
                                                        <input type="hidden" name="action" value="supprimer">
                                                        <input type="hidden" name="id" value="${lignePanier.produit.id}">
                                                        <input type="hidden" name="qte" value="${lignePanier.quantite}">
                                                        <button class="delete"><i class="fa fa-close"></i></button>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="cart-summary">
                                            <small>${panier.items.size()} Plat(s) selectionnes</small>
                                            <h5>SOUS-TOTAL : ${panier.totalPanier()} DHS</h5>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="cart-summary">
                                            <small>Votre panier est vide</small>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                                <div class="cart-btns">
                                    <a href="/panier">Voir Panier</a>
                                    <a href="/commander">Commander  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
