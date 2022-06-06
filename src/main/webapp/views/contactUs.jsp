<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
      <title>FoodShop : Contact-Nous</title>
    </jsp:attribute>

    <jsp:body>
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

                    <div class="col-md-6">

                        <h2>Contactez-nous</h2>

                        <div class="spacer"></div>

                        <form action="/contactez-nous" method="POST">
                        <div class="form-group">
                            <label for="name" style="float: left">Nom :</label>
                            <input type="text" class="form-control" name="name" id="name"
                                   value="${utilisateur.name}" placeholder="Nom" required>
                        </div>
                        <div class="form-group">
                            <label for="email" style="float: left">Email :</label>
                            <input type="email" class="form-control" name="email" id="email" value="${utilisateur.email}" placeholder="Adresse Mail" required>
                        </div>
                        <div class="form-group">
                            <label for="message" style="float: left">Message :</label>
                            <textarea class="form-control" name="message" id="message" placeholder="Votre message" required></textarea>
                        </div>
                        <div class="form-group" align="center">
                            <button class="primary-btn">Envoyer</button>
                        </div>
                        </form>
                    </div>

                    <div class="col-md-6" align="center">
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>67, Agdal, Rue Khalil - Rabat</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+212-662-158-998</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>foodshop.contact@gmail.com</a></li>
                        </ul>

                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3308.9190519640606!2d-6.866737385740881!3d33.96892002956573!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xda76ccef54dc051%3A0xd4a3493d9a1f7c4f!2sFOOD%20SHOP%20RESTAURANT!5e0!3m2!1sfr!2sma!4v1654539742009!5m2!1sfr!2sma" width="600" height="395" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>

                </div>
            </div>
        </div>
    </jsp:body>
</t:layout>