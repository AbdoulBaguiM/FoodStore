<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
        <title>FoodShop : Produit</title>
    </jsp:attribute>

    <jsp:body>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
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
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="/storage/products/${produit.photoPrincipale}" alt="">
                            </div>
                            <%--@if($produit->images)
                            @foreach(json_decode($produit->images,true) as $image)
                            <div class="product-preview">
                                <img src="{{asset('storage/'.$image)}}" alt="">
                            </div>
                            @endforeach
                            @endif--%>

                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="/storage/products/${produit.photoPrincipale}" alt="">
                            </div>
                            <%--@if($produit->images)
                            @foreach(json_decode($produit->images,true) as $image)
                            <div class="product-preview">
                                <img src="{{asset('storage/'.$image)}}" alt="">
                            </div>
                            @endforeach
                            @endif--%>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${produit.nom}</h2>
                            <div>
                                <div class="product-rating">
                                    <c:forEach begin="1" end="5" var="star">
                                        <i class="fa fa-star${produit.ratingCache >= star ? '' : '-o empty'}"></i>
                                    </c:forEach>
                                </div>
                                <a class="review-link" href="#">${produit.reviews.size()} Review(s) | Ajouter une note</a>
                            </div>
                            <div>
                                <c:choose>
                                    <c:when test="${produit.prixPromo != null}">
                                        <h3 class="product-price">${produit.prixPromo} DHS<del class="product-old-price">${produit.prixHt} DHS</del></h3>
                                    </c:when>
                                    <c:otherwise>
                                        <h3 class="product-price">${produit.prixHt} DHS</h3>
                                    </c:otherwise>
                                </c:choose>
                                <span class="product-available">
                                <c:choose>
                                    <c:when test="${produit.quantite > 5}">
                                        <span style="color: forestgreen">En Stock</span>
                                    </c:when>
                                    <c:when test="${produit.quantite >= 1}">
                                        <span style="color: darkorange">Stock Faible</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: red">Epuise</span>
                                    </c:otherwise>
                                </c:choose>
                                </span>
                            </div>
                            <p>${produit.details}</p>

                            <c:if test="${produit.quantite > 0}">
                                <div class="add-to-cart">
                                    <div class="qty-label" style="width: 20%;">
                                        <div class="input-group">
                                                <span class="input-group-btn">
                                                    <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[${produit.id}]">
                                                        <span class="glyphicon glyphicon-minus"></span>
                                                    </button>
                                                </span>
                                            <input type="text" name="quant[${produit.id}]" class="form-control input-number" value="1" min="1" max="${produit.quantite}" style="width: 65px;text-align: center" form="add_to_cart" >
                                            <span class="input-group-btn">
                                                    <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[${produit.id}]">
                                                        <span class="glyphicon glyphicon-plus"></span>
                                                    </button>
                                                </span>
                                        </div>
                                    </div>
                                    <p></p>

                                    <button  style="display: none">
                                        <form action="/panier" method="POST" id="add_to_cart">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="id" value="${produit.id}">
                                            <button type="submit" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ajouter au Panier</button>
                                        </form>
                                    </button>
                                </div>
                            </c:if>

                            <%--<ul class="product-btns">
                                <li>
                                    <form action="#" method="POST">
                                        <input type="hidden" name="id" value="${produit.id}">
                                        <input type="hidden" name="nom" value="${produit.nom}">
                                        <input type="hidden" name="prix_ht" value="${produit.prixHt}">
                                        <button class="unstyled-button" type="submit" style="font-weight: 500;text-transform: uppercase;"><i class="fa fa-heart-o"></i> Ajouter a ma Wishlist</button>
                                    </form>
                                </li>
                            </ul>--%>

                            <ul class="product-links">
                                <li>Categorie :</li>

                                <li><a href="/boutique?id=${produit.categorie.id}">${produit.categorie.nom}</a></li>

                            </ul>

                            <ul class="product-links">
                                <li>Partager :</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                                <li><a data-toggle="tab" href="#tab2">Details</a></li>
                                <li><a data-toggle="tab" href="#tab3">Reviews (${produit.reviews.size()})</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            ${produit.description}
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p align="center">${produit.details}</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->

                                <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>${produit.ratingCache}</span>
                                                    <div class="product-rating">
                                                        <c:forEach begin="1" end="5" var="star">
                                                            <i class="fa fa-star${produit.ratingCache >= star ? '' : '-o empty'}"></i>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <ul class="reviews">
                                                    <c:choose>
                                                        <c:when test="${reviews.size() > 0}">
                                                            <c:forEach var="review" items="${reviews}">
                                                            <li>
                                                                <div class="review-heading">
                                                                    <h5 class="name">${review.user.name}</h5>
                                                                    <p class="date">${review.updatedAt}</p>
                                                                    <div class="review-rating">
                                                                        <c:forEach begin="1" end="5" var="star">
                                                                            <i class="fa fa-star${review.note >= star ? '' : '-o empty'}"></i>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                                <div class="review-body">
                                                                    <p>${review.message}</p>
                                                                    <c:if test="${review.statut}">
                                                                        <p align="right" style="color: lawngreen;font-size: small"><i class="fa fa-check-circle-o"></i> Achat verifie</p>
                                                                    </c:if>
                                                                </div>
                                                            </c:forEach>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li><p>Aucune note pour ce produit, soyez le premier</p></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Reviews -->

                                        <!-- Review Form -->
                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form" action="/produit" method="POST">
                                                    <input name="id" type="hidden" value="${produit.id}">
                                                    <input class="input" name="nom" type="text" value="${utilisateur != null ? utilisateur.name : null}" placeholder="Nom" readonly>
                                                    <input class="input" name="mail" type="email" value="${utilisateur != null ? utilisateur.email : null}" placeholder="Email" readonly>
                                                    <textarea class="input" name="commentaire" placeholder="Commentaire" required></textarea>
                                                    <div class="input-rating">
                                                        <span>Note: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                            <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                            <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                            <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                            <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <button class="primary-btn" type="submit">Envoyer</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /Review Form -->
                                    </div>
                                </div>
                                <!-- /tab3  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <c:if test="${relatedProducts.size() > 0}">
            <!-- MIGHTALSOLIKE -->
            <jsp:include page="extras/mightAlsoLike.jsp"/>
            <!-- /MIGHTALSOLIKE -->
        </c:if>

    </jsp:body>
</t:layout>