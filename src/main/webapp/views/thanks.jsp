<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
      <title>Merci de votre commande</title>
    </jsp:attribute>

    <jsp:body>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="jumbotron text-center" style="background-color: white">
                        <h1 class="display-3">Felicitations !</h1>
                        <p class="lead"><strong>Veuillez verifier votre boite mail</strong> pour visualiser votre commande</p>
                        <hr>
                        <p>
                            Vous rencontrez des difficultes ?<a href="#">Contactez-nous</a>
                        </p>
                        <p class="lead">
                            <a href="/boutique" class="btn btn-primary btn-lg" role="button"  style="background-color: #F96302">
                                Retour vers la boutique</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:layout>
