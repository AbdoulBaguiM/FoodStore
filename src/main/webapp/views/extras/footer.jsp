<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">A Propos</h3>
                        <p>Nous vous fournissons les meilleurs plats prepares par nos soins a des prix imbattables.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>67, Agdal, Rue Khalil - Rabat</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+212-662-158-998</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>foodshop.contact@gmail.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <c:forEach var="categorie" items="${categories}" begin="0" end="4">
                                <li><a href="/boutique?id=${categorie.id}">${categorie.nom}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">Qui sommes-nous</a></li>
                            <li><a href="/contactez-nous">Contactez-nous</a></li>
                            <li><a href="#">Commandes et Retours</a></li>
                            <li><a href="#">Politique de Confidentialite</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Services</h3>
                        <ul class="footer-links">
                            <li><a href="/profil">Mon Compte</a></li>
                            <li><a href="/panier">Mon Panier</a></li>
                            <li><a href="#">Ma Wishlist</a></li>
                            <li><a href="#">Mes Commandes</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>
                    <span class="copyright">
                       Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | ENSIAS
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->
