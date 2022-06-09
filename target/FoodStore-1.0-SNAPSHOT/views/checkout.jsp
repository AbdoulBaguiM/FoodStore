<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
        <title>FoodShop : Commander</title>
    </jsp:attribute>

    <jsp:body>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
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

                    <div class="spacer"></div>
                    <div class="col-md-6 order-details">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <div class="section-title">
                                <h3 class="title">Vos Informations</h3>
                            </div>
                            <form action="/commander" method="POST" id="payment-form" data-toggle="validator">
                                <div class="form-group">
                                    <input class="input" type="text" id="nom" name="nom" value="${utilisateur.name}" placeholder="Nom" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="prenom" name="prenom" value="${utilisateur.lastName}" placeholder="Prenom" >
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" id="email" name="email" value="${utilisateur.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="adresse" name="adresse" value="${utilisateur.adresse}" placeholder="Addresse" required>
                                </div>


                                <div class="form-group">
                                    <select class="input" id="ville" name="ville" required>
                                        <c:forEach var="ville" items="${villesCouvertes}">
                                        <option ${ville == utilisateur.ville ? 'selected' : ''}>${ville}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <input class="input" type="text" id="pays" name="pays" placeholder="Pays" value="Maroc" readonly>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" id="zip_code" name="zip_code" value="${utilisateur.zipcode}" placeholder="Code Postal" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" id="tel" name="tel" placeholder="Telephone" value="${utilisateur.telephone}" required>
                                </div>
                            </form>
                        </div>
                        <!-- /Billing Details -->

                    </div>

                    <!-- Order Details -->
                    <div class="col-md-5  col-md-offset-1 order-details" >
                        <div class="section-title text-center">
                            <h3 class="title">Votre Commande</h3>
                        </div>
                        <div class="order-summary">
                            <div class="order-col">
                                <div><strong>PRODUIT(S)</strong></div>
                                <div><strong>TOTAL</strong></div>
                            </div>

                            <div class="order-products">
                                <c:forEach var="lignePanier" items="${panier.items}">
                                <div class="order-col">
                                    <div>${lignePanier.produit.nom} (x${lignePanier.quantite})</div>
                                    <div>${lignePanier.produit.prixPromo != null ?
                                            lignePanier.produit.prixPromo : lignePanier.produit.prixHt *
                                            lignePanier.quantite}
                                            DHS</div>
                                </div>
                                </c:forEach>
                            </div>

                            <div class="order-col">
                                <div>Frais de Livraison</div>
                                <div>${panier.fraixLivraison()} DHS</div>
                            </div>

                            <%--<div class="order-col">
                                <div>Taxe</div>
                                <div>{{number_format($newTax,2)}} Dhs</div>
                            </div>--%>

                            <%--@if(session()->has('coupon'))
                            <div class="order-col">
                                <div>
                                    Coupon ({{session()->get('coupon')['name']}})
                                    <form action="{{route('supprimer_coupon')}}" method="POST" style="display: inline">
                                        @csrf
                                        {{method_field('DELETE')}}

                                        <button class="remove" type="submit"><i class="fa fa-trash"></i></button>

                                    </form>
                                </div>
                                <div>- {{number_format($discount,2)}} Dhs</div>
                            </div>
                            @endif--%>

                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div style="display: inline"><strong class="order-total" style="float: right">${panier.totalPanier() + panier.fraixLivraison()} Dhs</strong></div>
                            </div>
                        </div>

                        <div class="payment-method">
                            <div class="input-radio">
                                <input type="radio" name="payement" id="payment-1" value=0 form="payment-form" required>
                                <label for="payment-1">
                                    <span></span>
                                    Paiement cash a la livraison
                                </label>
                                <div class="caption">
                                    <p style="text-align: justify">Payez en especes des que vous recevez votre commande. Assurez vous d'avoir la somme exacte afin de faciliter la transaction</p>
                                </div>
                            </div>

                            <div class="input-radio">
                                <%--<input type="radio" name="payement" id="payment-2" value=1 form="payment-form" required>
                                <label for="payment-2">
                                    <span></span>
                                    Paiement par carte bancaire
                                </label>
                                <div class="caption">
                                    <p style="text-align: justify">C'est une option prepayee securisee et rapide.
                                        Pour garantir le bon deroulement de votre paiement, priere de vous assurer que vous disposez des fonds necessaires sur votre carte.</p>

                                </div>--%>
                            </div>
                        </div>

                        <div class="input-checkbox">
                            <input type="checkbox" id="terms" name="terms" form="payment-form" required>
                            <label for="terms">
                                <span></span>
                                J'ai lu et j'accepte les <a href="#">termes et conditions</a>
                            </label>
                        </div>

                        <button class="primary-btn order-submit" type="submit" form="payment-form" id="complete-order" style="width: 100%">Passer la commande</button>

                        <%--@if(!session()->has('coupon'))
                        <hr>
                        <div class="order-col">
                            <div class="section-title text-center">
                                <h4 class="title">Coupon de reduction</h4>
                            </div>
                        </div>
                        <div class="order-col">
                            <form action="{{route('ajouter_coupon')}}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <input class="input" type="text" name="coupon_code" id="coupon_code" placeholder="Entrer le Code" style="width: 88%"/>
                                    <button type="submit" class="btn-local continue" style="height: 40px"></button>
                                </div>
                            </form>
                        </div>
                        @endif--%>
                    </div>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>

            <!-- /container -->
        </div>
        <!-- /SECTION -->
    </jsp:body>
</t:layout>