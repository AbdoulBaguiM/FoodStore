<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="/">Acceuil</a></li>
                <li><a href="/boutique">Boutique</a></li>
                <c:forEach var="categorie" items="${categories}">
                    <li><a href="/rechercher?idc=${categorie.id}&query=">${categorie.nom}</a></li>
                </c:forEach>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
