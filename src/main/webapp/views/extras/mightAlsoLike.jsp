<!-- Section Related Products -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Vous aimerez aussi</h3>
                </div>
            </div>

            <!-- product -->
            <c:forEach var="produit" items="${relatedProducts}" begin="0" end="3">
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
                                <p class="product-category"><a href="/boutique?id=${produit.categorie.id}">${produit.categorie.nom}</a></p>
                                <h3 class="product-name"><a href="/produit?id=${produit.id}">${produit.nom}</a></h3>
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
                                <%--<div class="product-btns">
                                    <form>
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter a la wishlist</span></button>
                                    </form>
                                </div>--%>
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
            <!-- /product -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->