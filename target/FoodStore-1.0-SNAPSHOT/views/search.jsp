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
                            <%--@if (session()->has('success_message'))
                            <div class="alert alert-success text-center">
                                {{ session()->get('success_message') }}
                            </div>
                            @endif

                            @if(count($errors) > 0)
                            <div class="alert alert-danger text-center">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif--%>
                        </div>
                        <!-- store products -->
                        <div class="row">
                            <c:forEach var="produit" items="${produits}">
                                <!-- product -->
                                <div class="col-md-3 col-xs-6">
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
                                                <p class="product-category">${produit.categorie.nom}</p>
                                                <h3 class="product-name"><a href="#">${produit.nom}</a></h3>
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
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Commander</button>
                                            </div>
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