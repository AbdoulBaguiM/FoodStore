<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
      <title>FoodShop : Acceuil</title>
    </jsp:attribute>

    <jsp:body>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="/assets/img/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="/assets/img/shop03.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Accessories<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="/assets/img/shop02.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Cameras<br>Collection</h3>
                                <a href="#" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Nouveaux produits</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <c:forEach var="produit" items="${newProducts}">
                                            <!-- product -->
                                            <div class="product">
                                                <a href="/produit?id=${produit.id}">
                                                    <div class="product-img">
                                                        <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                                        <div class="product-label">
                                                            <span class="sale">-30%</span>
                                                            <c:if test="${produit.featured == true}">
                                                                <span class="new">NEW</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category"><a href="/boutique?id=${produit.categorie.id}">${produit.categorie.nom}</a></p>
                                                        <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                                        <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product-btns">
                                                            <form>
                                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter a la wishlist</span></button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <c:if test="${produit.quantite>0}">
                                                        <div class="add-to-cart">
                                                            <form action="/panier" method="POST">
                                                                <input type="hidden" name="id" value="${produit.id}">
                                                                <input type="hidden" name="qte" value="1">
                                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Commander</button>
                                                            </form>
                                                        </div>
                                                    </c:if>
                                                </a>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Meilleures ventes</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <c:forEach var="produit" items="${bestSales}">
                                            <!-- product -->
                                            <div class="product">
                                                <a href="/produit?id=${produit.id}">
                                                    <div class="product-img">
                                                        <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                                        <div class="product-label">
                                                            <span class="sale">-30%</span>
                                                            <c:if test="${produit.featured == true}">
                                                                <span class="new">NEW</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category"><a href="/boutique?id=${produit.categorie.id}">${produit.categorie.nom}</a></p>
                                                        <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                                        <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product-btns">
                                                            <form>
                                                                <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter a la wishlist</span></button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <c:if test="${produit.quantite>0}">
                                                        <div class="add-to-cart">
                                                            <form action="/panier" method="POST">
                                                                <input type="hidden" name="id" value="${produit.id}">
                                                                <input type="hidden" name="qte" value="1">
                                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Commander</button>
                                                            </form>
                                                        </div>
                                                    </c:if>
                                                </a>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Meilleures ventes</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">
                            <div>
                                <c:forEach var="produit" items="${bestSales}" begin="0" end="2">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><a href="/boutique?id=${produit.categorie.id}&query=">${produit.categorie.nom}</a></p>
                                            <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                            <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div>
                                <c:forEach var="produit" items="${bestSales}" begin="3" end="5">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><a href="/boutique?id=${produit.categorie.id}&query=">${produit.categorie.nom}</a></p>
                                            <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                            <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Nouveautes</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <div>
                                <c:forEach var="produit" items="${newProducts}" begin="0" end="2">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><a href="/boutique?id=${produit.categorie.id}&query=">${produit.categorie.nom}</a></p>
                                            <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                            <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div>
                                <c:forEach var="produit" items="${newProducts}" begin="3" end="5">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><a href="//boutique?id=${produit.categorie.id}&query=">${produit.categorie.nom}</a></p>
                                            <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                            <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Meilleures ventes</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                                <c:forEach var="produit" items="${bestSales}" begin="6" end="8">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><a href="/boutique?id=${produit.categorie.id}&query=">${produit.categorie.nom}</a></p>
                                            <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                            <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div>
                                <c:forEach var="produit" items="${bestSales}" begin="9" end="11">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category"><a href="//boutique?id=${produit.categorie.id}&query=">${produit.categorie.nom}</a></p>
                                            <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                            <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
    </jsp:body>
</t:layout>