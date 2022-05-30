<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
        <title>FoodShop : Mon Panier</title>
        <link rel="stylesheet" href="/assets/css/cart.css">
    </jsp:attribute>

    <jsp:body>
        <div class="wrap cf">
            <div class="heading cf">
                <h1>Mon Panier</h1>
                <a href="/boutique" class="btn-local continue">Retour a la boutique</a>
            </div>

            <c:choose>
                <c:when test="${panier != null}">
                    <div class="cart">
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

                        <h2>${panier.items.size()} element(s) dans le Panier</h2>

                        <ul class="cartWrap">
                            <c:forEach var="lignePanier" items="${panier.items}">
                            <li class="items even">
                                <div class="product-widget">
                                    <div class="infoWrap">
                                        <div class="tableRow">
                                            <div class="cartSection">
                                                <a href="/produit?id=${lignePanier.produit.id}">
                                                    <img src="/assets/img/${lignePanier.produit.photoPrincipale}" alt="" class="itemImg" />

                                                    <h3>${lignePanier.produit.nom}</h3>
                                                </a>
                                                <p>${lignePanier.produit.details}</p>
                                                <p>
                                                    <select onmousedown="if(this.options.length>5){this.size=5;}" onchange="this.blur()"  onblur="this.size=1;" class="input-select quantity" data-id="${lignePanier.produit.id}" style="width: 80px; border-radius: 10px;">
                                                        <c:forEach begin="1" end="${lignePanier.produit.quantite}" varStatus="myIndex">
                                                            <option ${lignePanier.quantite == myIndex.index ? 'selected' : ''}> ${myIndex.index}</option>
                                                        </c:forEach>
                                                    </select>
                                                    x ${lignePanier.produit.prixHt} Dhs
                                                </p>
                                                <p class="stockStatus">
                                                    <c:choose>
                                                        <c:when test="${lignePanier.produit.quantite > 5}">
                                                            <span class="product-available">En stock</span>
                                                        </c:when>
                                                        <c:when test="${lignePanier.produit.quantite >= 1}">
                                                            <span class="product-available-low">Stock faible</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="product-not-available">En rupture de stock</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="cell2">
                                                <div class="prodTotal cartSection">
                                                    <p>${lignePanier.produit.prixHt * lignePanier.quantite} DHS</p>
                                                    <%--<div class="cartSection removeWrap">
                                                        <form action="{{route('supprimer_du_panier',$item->rowId)}}" method="POST">
                                                            @csrf
                                                            {{method_field('DELETE')}}

                                                            <button class="delete" type="submit"><i class="fa fa-close"></i></button>

                                                        </form>
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <%--<div class="subtotal cf">
                        <ul>
                            <li class="totalRow"><span class="label">Sous-Total</span><span class="value">{{Cart::subtotal()}} Dhs</span></li>
                            <li class="totalRow"><span class="label">Frais de Livraison</span><span class="value">{{getLivraisonPrice()}} Dhs</span></li>
                            <li class="totalRow"><span class="label">Taxe</span><span class="value">{{setting('site.tax')}} %</span></li>
                            <li class="totalRow final"><span class="label">Total</span><span class="value">{{floatval(str_replace(',', '', Cart::total())) + getLivraisonPrice()}} Dhs</span></li>
                            <li class="totalRow"><a href="{{route('checkout_commande')}}" class="btn-local continue">Commander</a></li>
                        </ul>
                    </div>--%>
                </c:when>
                <c:otherwise>
                    <div class="spacer"></div>
                    <h4>Votre Panier est vide</h4>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>

</t:layout>