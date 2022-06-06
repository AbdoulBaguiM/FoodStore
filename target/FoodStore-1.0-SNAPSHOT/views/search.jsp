<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
      <title>FoodShop : Recherche</title>
    </jsp:attribute>

    <jsp:body>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- STORE -->
                    <div id="store" class="col-md-12" >
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    <h4>${query} : ${produits.size()} Resultat(s)</h4>
                                </label>
                            </div>
                        </div>
                        <!-- /store top filter -->
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
                        <!-- store products -->
                        <div class="row">
                            <c:forEach var="produit" items="${produits}">
                                <!-- product -->
                                <div class="col-md-3 col-xs-6">
                                    <div class="product">
                                        <a href="/produit?id=${produit.id}">
                                            <div class="product-img">
                                                <img src="/storage/products/${produit.photoPrincipale}" alt="">
                                                <div class="product-label">
                                                    <c:if test="${produit.promotion != null}">
                                                        <span class="sale">-${produit.promotion.percentOff}%</span>
                                                    </c:if>

                                                    <c:if test="${produit.featured == true}">
                                                        <span class="new">NEW</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${produit.categorie.nom}</p>
                                                <h3 class="product-name"><a href="#">${produit.nom}</a></h3>
                                                <c:choose>
                                                    <c:when test="${produit.prixPromo != null}">
                                                        <h4 class="product-price">${produit.prixPromo} DHS<del class="product-old-price">${produit.prixHt} DHS</del></h4>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h4 class="product-price">${produit.prixHt} DHS</h4>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="product-rating">
                                                    <c:forEach begin="1" end="5" var="star">
                                                        <i class="fa fa-star${produit.ratingCache >= star ? '' : '-o empty'}"></i>
                                                    </c:forEach>
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