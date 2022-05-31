<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
    <jsp:attribute name="title">
        <title>FoodShop : Inscription</title>
        <link type="text/css" rel="stylesheet" href='${pageContext.request.contextPath}/assets/css/auth.css'/>
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <div class="auth-pages">
                <div>
                    <%--@if (session()->has('success_message'))
                    <div class="alert alert-success">
                        {{ session()->get('success_message') }}
                    </div>
                    @endif @if(count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                    @endif--%>
                    <h3 align="center">Creer votre compte</h3>
                    <div class="spacer"></div>

                    <form method="POST" action="/inscription">

                        <input id="name" type="text" class="form-control" name="name" value="" placeholder="Nom" required>

                        <input id="email" type="email" class="form-control" name="email" value="" placeholder="Email" required focused>

                        <input id="telephone" type="tel" class="form-control" name="telephone" value="" placeholder="Telephone" required>

                        <input id="password" type="password" class="form-control" name="password" placeholder="Mot de passe" required>

                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Confirmer le mot de passe" required>

                        <%--<div class="form-group">
                            {!! NoCaptcha::display() !!}
                        </div>--%>

                        <div class="login-container">
                            <button type="submit" class="auth-button">Creer votre compte</button>
                            <div class="already-have-container">
                                <p><strong>Vous avez deja un compte?</strong></p>
                                <a href="/connexion">Connectez-vous</a>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="auth-right">
                    <h3 align="center">Nouvel Utilisateur</h3>
                    <div class="spacer"></div>
                    <p><strong>C'est gratuit</strong></p>
                    <p style="text-align: justify">Creez votre compte client en quelques clics ! Vous pourrez ainsi commander differents plats proposes dans notre catalogue</p>

                    &nbsp;
                    <div class="spacer"></div>
                    <p><strong>Programme de fidelite</strong></p>
                    <p>Nos clients fideles sont recompenses par des promotions exclusives. Ne perdez plus de temps et inscrivez-vous</p>
                </div>
            </div> <!-- end auth-pages -->
        </div>
    </jsp:body>
</t:layout>