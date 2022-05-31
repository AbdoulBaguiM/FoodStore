<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
      <title>FoodShop : Boutique</title>
    </jsp:attribute>

    <jsp:body>
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">All Categories</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li class="active">Headphones (227,490 Results)</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <c:forEach var="categorie" items="${categories}">
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="${categorie.id}" ${param.id == categorie.id ? 'checked' : ''} onclick="return false;">
                                        <label for="${categorie.id}">
                                            <span></span>
                                            <a href="/boutique?id=${categorie.id}">
                                                ${categorie.nom}
                                            </a>
                                            <small>(${categorie.produits.size()})</small>
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Price</h3>
                            <div class="price-filter">
                                <div id="price-slider"></div>
                                <div class="input-number price-min">
                                    <input id="price-min" type="number">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                                <span>-</span>
                                <div class="input-number price-max">
                                    <input id="price-max" type="number">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Meilleures ventes</h3>
                            <c:forEach var="produit" items="${bestSales}" begin="0" end="2">
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="/assets/img/${produit.photoPrincipale}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category"><a href="/boutique?id=${produit.categorie.id}">${produit.categorie.nom}</a></p>
                                        <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
                                        <h4 class="product-price">${produit.prixHt} DHS<del class="product-old-price">990.00 DHS</del></h4>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <ul class="store-grid">
                                <li class="active"><i class="fa fa-th"></i></li>
                                <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                            </ul>
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
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
                        </div>
                        <div class="row">
                            <c:forEach var="produit" items="${produits}">
                                <!-- product -->
                                <div class="col-md-4 col-xs-6">
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
                                </div>
                                <!-- /product -->
                            </c:forEach>
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <span class="store-qty">Showing 20-100 products</span>
                            <ul class="store-pagination">
                                <li class="active">1</li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
    </jsp:body>
</t:layout>