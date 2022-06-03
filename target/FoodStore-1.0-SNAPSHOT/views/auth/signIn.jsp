<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
        <title>FoodShop : Connexion</title>
        <link type="text/css" rel="stylesheet" href='${pageContext.request.contextPath}/assets/css/auth.css'/>
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <br>
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

            <div class="auth-pages">
                <div class="auth-left">
                    <h3 align="center" style="color: black">Connectez-vous</h3>
                    <div class="spacer"></div>

                    <form action="/connexion" method="POST">
                        <input type="email" id="email" name="email" value="" placeholder="Email" required autofocus>
                        <input type="password" id="password" name="password" value="" placeholder="Mot de passe" required>

                        <div class="login-container">
                            <button type="submit" class="auth-button">Connexion</button>
                            <label>
                                <input type="checkbox" name="remember"> Se souvenir de moi
                            </label>
                        </div>

                        <div class="spacer"></div>

                        <a href="">
                            Mot de passe oublie ?
                        </a>

                    </form>
                </div>

                <div class="auth-right">
                    <h3 align="center" style="color: black">Creer un compte</h3>

                    <div class="spacer"></div>
                    &nbsp;
                    <div class="spacer"></div>
                    <p style="text-align: justify">Creez votre compte client en quelques clics ! Vous pourrez ainsi commander differents plats proposes dans notre catalogue</p>

                    <div class="spacer"></div>
                    &nbsp;
                    <div class="spacer"></div>
                    &nbsp;


                    <a href="/inscription" class="auth-button-hollow">Creer votre compte</a>

                </div>
            </div>
        </div>
    </jsp:body>
</t:layout>
