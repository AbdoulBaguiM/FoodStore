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
                <%--@if (session()->has('success_message'))
                <div class="alert alert-success">
                    {{ session()->get('success_message') }}
                </div>
                @endif

                @if(count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif--%>
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
                                    <%--@foreach(range(1,5) as $star)
                                    <i class="fa fa-star{{$produit->rating_cache >= $star ? '' : '-o empty'}}"></i>
                                    @endforeach--%>
                                </div>
                                <%--<a class="review-link" href="#">{{$produit->reviews()->count()}} Review(s) | Ajouter une note</a>--%>
                            </div>
                            <div>
                                <h3 class="product-price">${produit.prixHt} Dhs
                                    <%--@if(getProductDelPrice($produit))
                                    <del class="product-old-price"> {{getProductDelPrice($produit)}} Dhs</del>
                                    @endif--%>
                                </h3>
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

                            <ul class="product-btns">
                                <li>
                                    <form action="#" method="POST">
                                        <input type="hidden" name="id" value="${produit.id}">
                                        <input type="hidden" name="nom" value="${produit.nom}">
                                        <input type="hidden" name="prix_ht" value="${produit.prixHt}">
                                        <button class="unstyled-button" type="submit" style="font-weight: 500;text-transform: uppercase;"><i class="fa fa-heart-o"></i> Ajouter a ma Wishlist</button>
                                    </form>
                                </li>
                            </ul>

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
                                <%--<li><a data-toggle="tab" href="#tab3">Reviews ({{$produit->reviews()->count()}})</a></li>--%>
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

                               <%-- <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>{{$produit->rating_cache}}</span>
                                                    <div class="rating-stars">
                                                        @foreach(range(1,5) as $star)
                                                        <i class="fa fa-star{{$produit->rating_cache >= $star ? '' : '-o empty'}}"></i>
                                                        @endforeach

                                                    </div>
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][5]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][5]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][4]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][4]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][3]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][3]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: {{$reviewDetails['widthR'][2]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][2]}}</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width:{{$reviewDetails['widthR'][1]}}%;"></div>
                                                        </div>
                                                        <span class="sum">{{$reviewDetails['countR'][1]}}</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <ul class="reviews">
                                                    @forelse($reviews as $review)

                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">{{$review->user->name}}</h5>
                                                            <p class="date">{{presentDate($review->updated_at)}}</p>
                                                            <div class="review-rating">
                                                                @foreach(range(1,5) as $star)
                                                                <i class="fa fa-star{{$review->note >= $star ? '' : '-o empty'}}"></i>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>{{$review->message}}</p>
                                                            @if($review->statut)
                                                            <p align="right" style="color: lawngreen;font-size: small"><i class="fa fa-check-circle-o"></i> Achat vérifié</p>
                                                            @endif
                                                        </div>
                                                    </li>
                                                    @empty
                                                    <li><p>Aucune note pour ce produit, soyez le premier</p></li>
                                                    @endforelse

                                                </ul>

                                                {{$reviews->appends(request()->input())->links("pagination::bootstrap-4")}}
                                            </div>
                                        </div>
                                        <!-- /Reviews -->

                                        <!-- Review Form -->
                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form" action="{{route('ajouter_review')}}" method="POST">
                                                    @csrf
                                                    <input name="id" type="hidden" value="{{$produit->id}}">
                                                    <input class="input" name="nom" type="text" value="{{auth()->user()? auth()->user()->name : null}}" placeholder="Nom">
                                                    <input class="input" name="email" type="email" value="{{auth()->user()? auth()->user()->email : null}}" placeholder="Email">
                                                    <textarea class="input" name="commentaire" placeholder="Commentaire"></textarea>
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
                                <!-- /tab3  -->--%>
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